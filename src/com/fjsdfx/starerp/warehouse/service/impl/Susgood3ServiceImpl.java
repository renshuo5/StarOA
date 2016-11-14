package com.fjsdfx.starerp.warehouse.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.item.model.ControllerunitInfo;
import com.fjsdfx.starerp.item.model.ItemRelation;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ItemRelationService;
import com.fjsdfx.starerp.item.service.ItemTypeService;
import com.fjsdfx.starerp.produce.model.Pergood;
import com.fjsdfx.starerp.produce.model.Preparation;
import com.fjsdfx.starerp.produce.service.PergoodService;
import com.fjsdfx.starerp.produce.service.PreparationService;
import com.fjsdfx.starerp.warehouse.dao.StockDao;
import com.fjsdfx.starerp.warehouse.dao.Supsendm3Dao;
import com.fjsdfx.starerp.warehouse.dao.Susgood3Dao;
import com.fjsdfx.starerp.warehouse.model.Supsendm3;
import com.fjsdfx.starerp.warehouse.model.Susgood;
import com.fjsdfx.starerp.warehouse.model.Susgood3;
import com.fjsdfx.starerp.warehouse.service.Supsendm3Service;
import com.fjsdfx.starerp.warehouse.service.Susgood3Service;

@Service
@Transactional
public class Susgood3ServiceImpl extends BaseServiceImpl<Susgood3> implements Susgood3Service {

	private ItemTypeService itemTypeService;
	private ItemRelationService itemRelationService;
	private StockDao stockDao;
	private Susgood3Dao susgood3Dao;
	private PergoodService pergoodService;
	private Supsendm3Dao supsendm3Dao;
	private PreparationService preparationService;
	public void saveBySupsendm3(Supsendm3 supsendm3,List<Integer> seriNums, List<Integer> itemTypeIds,
			List<ControllerunitInfo> controllerunitInfos, List<Integer> singlesets,
			List<Integer> needNums, List<Integer> pracNums, List<String> notes) {
		for(int i=0;i<itemTypeIds.size();i++)
		{
			if(null==itemTypeIds.get(i))
			{
				itemTypeIds.remove(i);
				seriNums.remove(i);
				controllerunitInfos.remove(i);
				needNums.remove(i);
				pracNums.remove(i);
				singlesets.remove(i);
				notes.remove(i);
				i--;
			}
		}
		List<ItemType> itemTypes = itemTypeService.getItemTypesByIds(itemTypeIds);
		for(int i=0;i<itemTypes.size();i++)
		{
			ItemType itemType = itemTypes.get(i);
			Susgood3 susgood3 = new Susgood3();
			susgood3.setSupsendm3(supsendm3);
			susgood3.setSeriNum(seriNums.get(i));
			susgood3.setControllerunitInfo(controllerunitInfos.get(i));
			susgood3.setItemType(itemType);
			susgood3.setIsExtra(0);
			susgood3.setNeedNum(needNums.get(i));
			susgood3.setNote(notes.get(i));
			susgood3.setPracNum(pracNums.get(i));
			susgood3.setSingleset(singlesets.get(i));
			this.save(susgood3);
			if(pracNums.get(i)<needNums.get(i))
			{
				Preparation preparation =supsendm3.getPreparation();
				preparation.setAddsup(0);
				preparationService.update(preparation);
				List<Pergood> pergoods = pergoodService.findByHql("from Pergood p where p.preparation.id="+supsendm3.getPreparation().getId()+" and p.itemType.id="+supsendm3.getItemType().getId());
				Pergood pergood = null;
				if(null!=pergoods&&pergoods.size()>0)
				{
					pergood = pergoods.get(0);
				}
				pergood.setAddsup(0);
				pergood.setIsExtraSup(1);
				pergoodService.saveOrUpdate(pergood);
				Susgood3 sus3 = new Susgood3();
				sus3.setControllerunitInfo(controllerunitInfos.get(i));
				sus3.setIsExtra(1);
				sus3.setItemType(itemType);
				sus3.setNeedNum(needNums.get(i)-pracNums.get(i));
				sus3.setSingleset(singlesets.get(i));
				sus3.setSupsendm3(supsendm3);
				sus3.setNote("补发");
				save(sus3);
			}
			try {
				stockDao.subNumber(itemType,pracNums.get(i));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	public List<Susgood3> createDefaultSusgood3s(ItemType itemType, Integer needNum) {
		List<Susgood3> susgood3s = findByHql("from Susgood3 s order by s.seriNum desc");
		Integer serNum = null==susgood3s||susgood3s.size()==0?1:susgood3s.get(0).getSeriNum()+1;
		List<ItemRelation> itemRelations = itemRelationService.findByItemTypeId(itemType.getId());
		List<Susgood3> result = new ArrayList<Susgood3>();
		for(int i=0;i<itemRelations.size();i++)
		{
			ItemRelation ir = itemRelations.get(i);
			Susgood3 susgood3 = new Susgood3();
			susgood3.setSeriNum(serNum+i);
			susgood3.setItemType(ir.getPart());
			int susNeedNum = ir.getPartamount()*needNum;
			susgood3.setNeedNum(susNeedNum);
			susgood3.setSingleset(ir.getPartamount());
			int num = stockDao.getNumberByItemTypeId(ir.getPart().getId());
			susgood3.setPracNum(susNeedNum>num?num:susNeedNum);
			if(susNeedNum>num)
			{
				susgood3.setNote("需补发"+(susNeedNum-num)+"件");
			}
			susgood3.setControllerunitInfo(ir.getControllerunitInfo());
			result.add(susgood3);
		}
		return result;
	}
	public List<Susgood3> createExtraDefaultSusgood3s(ItemType itemType) {
		List<Susgood3> susgood3s = findByHql("from Susgood3 s order by s.seriNum desc");
		Integer serNum = null==susgood3s||susgood3s.size()==0?1:susgood3s.get(0).getSeriNum()+1;
		String hql = "from Susgood3 s where s.isExtra=1 and s.supsendm3.itemType.id = "+itemType.getId();
		susgood3s = findByHql(hql);
		for(int i=0;i<susgood3s.size();i++)
		{
			Susgood3 susgood3 = susgood3s.get(i);
			susgood3.setSeriNum(serNum);
			Integer susNeedNum = susgood3.getNeedNum();
			int num = stockDao.getNumberByItemTypeId(susgood3.getItemType().getId());
			susgood3.setPracNum(susNeedNum>num?num:susNeedNum);
		}
		return susgood3s;
	}
	/**************************get and set********************************/
	public ItemTypeService getItemTypeService() {
		return itemTypeService;
	}
	@Resource
	public void setItemTypeService(ItemTypeService itemTypeService) {
		this.itemTypeService = itemTypeService;
	}
	public StockDao getStockDao() {
		return stockDao;
	}
	@Resource
	public void setStockDao(StockDao stockDao) {
		this.stockDao = stockDao;
	}
	public ItemRelationService getItemRelationService() {
		return itemRelationService;
	}
	@Resource
	public void setItemRelationService(ItemRelationService itemRelationService) {
		this.itemRelationService = itemRelationService;
	}
	public List<Susgood3> getSusgood3sBySupsendm3Id(Integer supsendm3Id) {
		return susgood3Dao.getSusgood3sBySupsendm3Id(supsendm3Id);
	}
	public Susgood3Dao getSusgood3Dao() {
		return susgood3Dao;
	}
	@Resource
	public void setSusgood3Dao(Susgood3Dao susgood3Dao) {
		this.susgood3Dao = susgood3Dao;
	}
	public PergoodService getPergoodService() {
		return pergoodService;
	}
	@Resource
	public void setPergoodService(PergoodService pergoodService) {
		this.pergoodService = pergoodService;
	}
	public void confirm(Supsendm3 supsendm3, List<Integer> susgood3ids,
			List<Integer> confirms) {
		for(int i=0;i<susgood3ids.size();i++)
		{
			if(null==susgood3ids.get(i))
			{
				susgood3ids.remove(i);
				confirms.remove(i);
				i--;
			}
		}
		boolean isAllConfirm = true;
		for(int i=0;i<susgood3ids.size();i++)
		{
			Susgood3 susgood3 = findById(Susgood3.class, susgood3ids.get(i));
			susgood3.setWorshipConfirm(confirms.get(i));
			if(confirms.get(i)==0)
			{
				isAllConfirm = false;
			}
			saveOrUpdate(susgood3);
		}
		if(isAllConfirm)
		{
			supsendm3.setWorshipConfirm(1);
			supsendm3Dao.saveOrUpdate(supsendm3);
		}
	}
	public Supsendm3Dao getSupsendm3Dao() {
		return supsendm3Dao;
	}
	@Resource
	public void setSupsendm3Dao(Supsendm3Dao supsendm3Dao) {
		this.supsendm3Dao = supsendm3Dao;
	}
	public PreparationService getPreparationService() {
		return preparationService;
	}
	@Resource
	public void setPreparationService(PreparationService preparationService) {
		this.preparationService = preparationService;
	}
	public void deleteExtraSusgood3s(List<Integer> susgood3Ids) {
		for(Integer id:susgood3Ids)
		{
			deleteById(Susgood3.class, id);
		}
	}
}
