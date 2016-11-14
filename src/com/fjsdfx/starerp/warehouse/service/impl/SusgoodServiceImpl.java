package com.fjsdfx.starerp.warehouse.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ItemTypeService;
import com.fjsdfx.starerp.produce.service.PergoodService;
import com.fjsdfx.starerp.produce.service.PreparationService;
import com.fjsdfx.starerp.warehouse.dao.StockDao;
import com.fjsdfx.starerp.warehouse.dao.SusgoodDao;
import com.fjsdfx.starerp.warehouse.model.Supsendm;
import com.fjsdfx.starerp.warehouse.model.Susgood;
import com.fjsdfx.starerp.warehouse.service.SusgoodService;

@Service
@Transactional
public class SusgoodServiceImpl extends BaseServiceImpl<Susgood> implements
		SusgoodService {
	private ItemTypeService itemTypeService;
	private StockDao stockDao;
	private SusgoodDao susgoodDao;
	private PergoodService pergoodService;
	private PreparationService preparationService;
	

	public PreparationService getPreparationService() {
		return preparationService;
	}
	@Resource
	public void setPreparationService(PreparationService preparationService) {
		this.preparationService = preparationService;
	}
	public PergoodService getPergoodService() {
		return pergoodService;
	}
	@Resource
	public void setPergoodService(PergoodService pergoodService) {
		this.pergoodService = pergoodService;
	}
	public SusgoodDao getSusgoodDao() {
		return susgoodDao;
	}
	@Resource
	public void setSusgoodDao(SusgoodDao susgoodDao) {
		this.susgoodDao = susgoodDao;
	}
	public StockDao getStockDao() {
		return stockDao;
	}
	@Resource
	public void setStockDao(StockDao stockDao) {
		this.stockDao = stockDao;
	}
	public ItemTypeService getItemTypeService() {
		return itemTypeService;
	}
	@Resource
	public void setItemTypeService(ItemTypeService itemTypeService) {
		this.itemTypeService = itemTypeService;
	}
	public List<Susgood> createDefaultSusgoodsByPartItemTypes(
			Map<ItemType, Integer> partItemTypes, Integer needNum) {
		List<Susgood> susgoods = new ArrayList<Susgood>();
		Set<ItemType> itemTypeSet = partItemTypes.keySet();
		for(ItemType it:itemTypeSet)
		{
			Susgood susgood = new Susgood();
			susgood.setItemType(it);
			Integer singleset = partItemTypes.get(it)/needNum;
			System.out.println("singleset = "+singleset);
			susgood.setSingleset(singleset);
			if(null==it.getBondedNo()||it.getBondedNo()==-1)
			{
				susgood.setGeneralno(singleset*needNum);
			}
			else
			{
				susgood.setBondednum(singleset*needNum);
			}
			/**
			 * 拿到库存
			 */
			Integer surplus = stockDao.getNumberByItemTypeId(it.getId());
			susgood.setLbalance(surplus);
			susgood.setTbalance(surplus-partItemTypes.get(it));
			susgoods.add(susgood);
		}
		return susgoods;
	}
	public void saveSusgoods(Supsendm supsendm,List<Integer> itemTypeIds, List<Integer> singlesets,
			List<Integer> generalnos, List<Integer> bondednums,
			List<Integer> tbalances, List<Integer> lbalances, List<String> notes) {
		for(int i=0;i<itemTypeIds.size();i++)
		{
			if(null==itemTypeIds.get(i))
			{
				itemTypeIds.remove(i);
				singlesets.remove(i);
				generalnos.remove(i);
				bondednums.remove(i);
				tbalances.remove(i);
				lbalances.remove(i);
				notes.remove(i);
				i--;
			}
		}
		List<ItemType> itemTypes = itemTypeService.getItemTypesByIds(itemTypeIds);
		for(int i=0;i<itemTypes.size();i++)
		{
			ItemType itemType = itemTypes.get(i);
			Susgood susgood = new Susgood();
			susgood.setItemType(itemType);
			susgood.setBondednum(bondednums.get(i));
			susgood.setGeneralno(generalnos.get(i));
			susgood.setTbalance(tbalances.get(i));
			susgood.setLbalance(lbalances.get(i));
			susgood.setNote(notes.get(i));
			susgood.setSingleset(singlesets.get(i));
			susgood.setSupsendm(supsendm);
			this.save(susgood);
			try {
				stockDao.subNumber(itemType,itemType.getBondedNo()==null||itemType.getBondedNo()==0?generalnos.get(i):bondednums.get(i));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	public List<Susgood> getSusgoodsBySupsendmId(Integer supsendmId) {
		return susgoodDao.getSusgoodsBySupsendmId(supsendmId);
	}
	public Integer getLastSurplus(Integer supsendmId, Integer itemTypeId) {
		List<Susgood> susgoods = findByHql("from Susgood s where s.supsendm.sus_id < "+supsendmId+" and s.itemType.id = "+itemTypeId+" order by s.id desc");
		if(null==susgoods||susgoods.size()==0)
		{
			return stockDao.getNumberByItemTypeId(itemTypeId);
		}
		else
		{
			return susgoods.get(0).getTbalance();
		}
	}
}
