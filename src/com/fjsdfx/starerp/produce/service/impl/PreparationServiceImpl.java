package com.fjsdfx.starerp.produce.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.item.dao.ItemTypeDao;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.produce.dao.PergoodDao;
import com.fjsdfx.starerp.produce.dao.PreparationDao;
import com.fjsdfx.starerp.produce.model.Pergood;
import com.fjsdfx.starerp.produce.model.Preparation;
import com.fjsdfx.starerp.produce.service.PreparationService;

/**
 * 
 * @author zhuf
 * 
 */

@Service
@Transactional
public class PreparationServiceImpl extends BaseServiceImpl<Preparation>
		implements PreparationService {
	/**
	 * 型号规格dao
	 */
	private ItemTypeDao itemTypeDao;

	/**
	 * 要货物品DAO
	 */
	private PergoodDao pergoodDao;
	/**
	 * 要货计划单DAO
	 */
	private PreparationDao preparationDao;

	/**
	 * 通过传入型号规格的id列表获取型号规格
	 * 
	 * @param itemTypeIds
	 *            型号规格id列表
	 * @return 型号规格列表
	 */
	public List<ItemType> getItemTypeByIds(List<Integer> itemTypeIds) {
		List<ItemType> itemTypes = new ArrayList<ItemType>();
		if (!itemTypeIds.isEmpty()) {
			for (Integer id : itemTypeIds) {
				System.out.println("id =" + id);
				itemTypes.add(itemTypeDao.get(ItemType.class, id));
			}
		}
		return itemTypes;
	}

	/**
	 * 保存要货单与型号规格的关系
	 * 
	 * @param preparation
	 *            要货单
	 * @param itemTypes
	 *            型号规格列表
	 * @param preNums
	 *            数量列表
	 * @param eDates
	 *            进仓日期列表
	 * @param prenote
	 *            备注列表
	 * @return 添加是否成功
	 */
	public Boolean savePergoods(Preparation preparation,
			List<Integer> itemTypeIds, List<Integer> preNums,
			List<Date> eDates, List<String> preNotes) {
		Integer itemTypesSize = itemTypeIds.size();
		try {
			for (int i = 0; i < itemTypesSize; i++) {
				if (null != itemTypeIds.get(i)) {
					Pergood pergood = new Pergood();
					ItemType itemType = itemTypeDao.get(ItemType.class,
							itemTypeIds.get(i));
					pergood.setItemType(itemType);
					pergood.setPreparation(preparation);
					pergood.setPreNum(preNums.get(i));
					pergood.seteDate(eDates.get(i));
					pergood.setPreNote(preNotes.get(i));
					pergoodDao.save(pergood);
				}
			}
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	public Boolean updatePergoods(Preparation preparation,
			List<Integer> itemTypeIds, List<Integer> preNums,
			List<Date> eDates, List<String> preNotes, Integer preparationId) {
		List<Pergood> pergoods = new ArrayList<Pergood>();
		Integer itemTypesSize = itemTypeIds.size();
		pergoods = pergoodDao
				.findByHql("select o from Pergood o where o.preparation = "
						+ preparationId);
		try {
			for (Pergood pergood : pergoods) {
				pergoodDao.delete(pergood);
			}
			for (int i = 0; i < itemTypesSize; i++) {
				if (null != itemTypeIds.get(i)) {
					Pergood pergood = new Pergood();
					ItemType itemType = itemTypeDao.get(ItemType.class,
							itemTypeIds.get(i));
					pergood.setItemType(itemType);
					pergood.setPreparation(preparation);
					pergood.setPreNum(preNums.get(i));
					pergood.seteDate(eDates.get(i));
					pergood.setPreNote(preNotes.get(i));
					pergoodDao.save(pergood);
				}
			}
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	
	
	public Boolean deleteByPreparationId(Integer preparationId) {
		List<Pergood> pergoods = new ArrayList<Pergood>();
		pergoods = pergoodDao.findByHql("from Pergood o where o.preparation.id=" + preparationId);
		for (Pergood pergood : pergoods) {
			pergoodDao.delete(pergood);
		}
		deleteById(Preparation.class, preparationId);
		
		return true;
	}

	public ItemTypeDao getItemTypeDao() {
		return itemTypeDao;
	}

	@Resource
	public void setItemTypeDao(ItemTypeDao itemTypeDao) {
		this.itemTypeDao = itemTypeDao;
	}

	public PergoodDao getPergoodDao() {
		return pergoodDao;
	}

	@Resource
	public void setPergoodDao(PergoodDao pergoodDao) {
		this.pergoodDao = pergoodDao;
	}
	

	public PreparationDao getPreparationDao() {
		return preparationDao;
	}

	@Resource
	public void setPreparationDao(PreparationDao preparationDao) {
		this.preparationDao = preparationDao;
	}

	public List<Pergood> getAllPergoods(Preparation p) {
		return preparationDao.getAllPergoods(p);
	}

	/**
	 *  Map<Integer,Integer> :存放itemTypeId和num
	 */
	public Map<Integer,Integer> getPreparationItemTypeInfos(Preparation p) {
		Map<Integer, Integer> infos = new HashMap<Integer, Integer>();
		List<Pergood> pergoods = this.getAllPergoods(p);
		System.out.println("pergoods's size = "+pergoods.size());
		for(Pergood pergood:pergoods)
		{
			infos.put(pergood.getItemType().getId(), pergood.getPreNum());
		}
		return infos;
	}

	public String checkExistsByNO(String presn) {
		List<Preparation> preparations = findByHql("from Preparation p where p.presn = '"+presn+"'");
		if(preparations==null||preparations.size()==0)
		{
			return "1";
		}
		return "0";
	}

}
