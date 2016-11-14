package com.fjsdfx.starerp.item.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.item.dao.ItemRelationDao;
import com.fjsdfx.starerp.item.model.ControllerunitInfo;
import com.fjsdfx.starerp.item.model.Item;
import com.fjsdfx.starerp.item.model.ItemRelation;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ControllerService;
import com.fjsdfx.starerp.item.service.ItemRelationService;
import com.fjsdfx.starerp.item.service.ItemTypeService;

@Service
@Transactional
public class ItemRelationServiceImpl extends BaseServiceImpl<ItemRelation>
		implements ItemRelationService {

	private ItemTypeService itemTypeService;
	private ItemRelationDao itemRelationDao;
	private ControllerService controllerService;

	public ControllerService getControllerService() {
		return controllerService;
	}

	@Resource
	public void setControllerService(ControllerService controllerService) {
		this.controllerService = controllerService;
	}

	public ItemRelationDao getItemRelationDao() {
		return itemRelationDao;
	}

	@Resource(name = "itemRelationDaoImpl")
	public void setItemRelationDao(ItemRelationDao itemRelationDao) {
		this.itemRelationDao = itemRelationDao;
	}

	public ItemTypeService getItemTypeService() {
		return itemTypeService;
	}

	@Resource(name = "itemTypeServiceImpl")
	public void setItemTypeService(ItemTypeService itemTypeService) {
		this.itemTypeService = itemTypeService;
	}

	public void saveRelation(ItemType pitem, ItemType part, Integer amount,Integer isCon,ControllerunitInfo controllerunit) {
		ItemRelation ir = new ItemRelation();
		this.saveOrUpdate(pitem);
		ir.setPitem(pitem);
		ir.setPart(part);
		ir.setPartamount(amount);
		ir.setIsCon(isCon);
		ir.setControllerunitInfo(controllerunit);
		this.saveOrUpdate(ir);
	}

	public void saveRelations(ItemType pitem, List<Integer> partids,
			List<Integer> amounts, List<Integer> isCons,
			List<ControllerunitInfo> controllerunits) {
		int i = 0;
		for (int j = 0; j < partids.size(); j++) {
			if (null == partids.get(j)) {
				partids.remove(j);
				amounts.remove(j);
				isCons.remove(j);
				controllerunits.remove(j);
				j--;
			}
		}
		if (null != partids && partids.size() > 0) {
			for (Integer id : partids) {
				if (null != partids && 0 != partids.get(i)
						&& 0 != amounts.get(i) && null != amounts.get(i)) {
					Integer amount = amounts.get(i);
					Integer isCon = isCons.get(i);
					ControllerunitInfo controllerunit = controllerunits.get(i);
					saveRelation(pitem, itemTypeService.findById(
							ItemType.class, id), amount,isCon,controllerunit);
				}
				i++;
			}
		}
	}

	public List<ItemRelation> findRelationsByPitemid(Integer pitemid) {
		return this.findByHql("from ItemRelation ir where ir.pitem.id="
				+ pitemid);
	}

	public void delByObjects(List<ItemRelation> irs) {
		for (ItemRelation ir : irs) {
			this.delete(ir);
		}

	}

	/*
	 * 更新操作，删除旧的关系，新建新的关系
	 * 
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.fjsdfx.starerp.item.service.ItemRelationService#update(java.util.
	 * List, com.fjsdfx.starerp.item.model.Item, java.util.List, java.util.List)
	 */
	public void update(ItemType pitem, List<Integer> partids,
			List<Integer> amounts, List<Integer> isCons,
			List<ControllerunitInfo> controllerunits) {
		List<ItemRelation> oldIrs = this.findRelationsByPitemid(pitem.getId());
		this.delByObjects(oldIrs);
		this.saveRelations(pitem, partids, amounts, isCons,controllerunits);
	}

	public void saveRelations(Item item, List<Item> parts, List<Integer> amounts) {
		// System.out.println((new
		// StringBuilder("amounts: ")).append(amounts).toString());
		// int i = 0;
		// for(Iterator iterator = parts.iterator(); iterator.hasNext();)
		// {
		// ItemType part = (ItemType)iterator.next();
		// if(part != null && ((Integer)amounts.get(i)).intValue() != 0 &&
		// amounts.get(i) != null)
		// {
		// Integer amount = (Integer)amounts.get(i);
		// saveRelation(pitem, part, amount);
		// }
		// i++;
		// }
	}

	public List<ItemRelation> getAllItemRelations() {
		return itemRelationDao.getAllItemRelations();
	}

	public List<ItemRelation> findByItemTypeId(Integer itemTypeId) {
		List<ItemRelation> irs = itemRelationDao.findByItemTypeId(itemTypeId);
		return irs;
	}

	public void saveitemType(ItemType itemType,
			Integer siemid, List<Integer> partids, List<Integer> amounts, List<Integer> isCons,
			List<ControllerunitInfo> controllerunits) {
		itemTypeService.save(itemType, siemid);
		this.saveRelations(itemType, partids, amounts, isCons,controllerunits);
	}

	public void updateitemType(ItemType itemType,
			Integer siemid,
			List<Integer> partids, List<Integer> amounts, List<Integer> isCons,
			List<ControllerunitInfo> controllerunits) {
		itemTypeService.update(itemType, siemid);
		this.update(itemType, partids, amounts,isCons,controllerunits);

	}

	public List<ItemRelation> findPitemByPartId(Integer partId) {
		return itemRelationDao.findPitemByPartId(partId);
	}


}
