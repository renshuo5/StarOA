package com.fjsdfx.starerp.item.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.item.dao.ItemRelationDao;
import com.fjsdfx.starerp.item.dao.ItemTypeDao;
import com.fjsdfx.starerp.item.model.Item;
import com.fjsdfx.starerp.item.model.ItemRelation;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ControllerService;
import com.fjsdfx.starerp.item.service.ItemService;
import com.fjsdfx.starerp.item.service.ItemTypeService;
@Service
@Transactional
public class ItemTypeServiceImpl extends BaseServiceImpl<ItemType> implements ItemTypeService{
	
	private ItemTypeDao itemTypeDao;
	private ItemService itemService;
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

	@Resource(name="itemRelationDaoImpl")
	public void setItemRelationDao(ItemRelationDao itemRelationDao) {
		this.itemRelationDao = itemRelationDao;
	}

	public ItemTypeDao getItemTypeDao() {
		return itemTypeDao;
	}

	@Resource(name="itemTypeDaoImpl")
	public void setItemTypeDao(ItemTypeDao itemTypeDao) {
		this.itemTypeDao = itemTypeDao;
	}

	public ItemService getItemService() {
		return itemService;
	}

	@Resource(name="itemServiceImpl")
	public void setItemService(ItemService itemService) {
		this.itemService = itemService;
	}

	public List<ItemType> getAllItemTypes() {
		return itemTypeDao.getAllItemTypes();
	}

	public List<ItemType> getItemTypesByIds(List<Integer> ids) {
		List<ItemType> itemTypes=new ArrayList<ItemType>();
		
		if(!ids.isEmpty())
		{
						
			for(Integer id:ids)
			{
				if(null!=id)
				{
					List<ItemType> tempItemTypes = this.findByHql("from ItemType it where it.id = "+id);
					if(null!=tempItemTypes && tempItemTypes.size()>0)
					itemTypes.add(tempItemTypes.get(0));
				}
				else if(null==id)
				{
					itemTypes.add(null);
				}
			}
		
		}
		return itemTypes;
	}

	public PagerModel getItemTypesByItemId(Class<ItemType> entityClass,
			Integer itemId) {
		
		if(null!=itemId)
		{
			return this.getPagerDesc(ItemType.class,"where o.item.id="+itemId);
		}
		else
		{
			return this.getPagerDesc(ItemType.class);
		}
	}
	
	public ItemType save(ItemType itemType,Integer sitemid)
    {
		List<Item> items = itemService.findByHql("from Item i where i.id = "+sitemid);
		Item sitem = null;
        if(null!=items&&items.size()>0)
        {
        	sitem = items.get(0);
        }
        itemType.setItem(sitem);
        itemType.setBondedNo(itemType.getIsbonded()==1?itemType.getBondedNo():null);
        itemService.saveAndRefresh(sitem);
        return super.saveAndRefresh(itemType);
    }

	public List<ItemType> findByItemTypeId(Integer itemTypeId) {
		return itemTypeDao.findByItemTypeId(itemTypeId);
	}

	public ItemType update(ItemType itemType, Integer sitemid) {
		List<Item> items = itemService.findByHql("from Item i where i.id = "+sitemid);
		Item sitem = null;
		if(null!=items && items.size()>0)
		{
			sitem = items.get(0);
		}
        itemType.setItem(sitem);
        itemType.setBondedNo(itemType.getIsbonded()==1?itemType.getBondedNo():null);
        return (ItemType) this.update(itemType);
	}

	public ItemType deleteById(Integer id) {
		return deleteById(ItemType.class, id);
	}

	public List<ItemType> findByItemId(Integer itemid) {
		return itemTypeDao.findByItemId(itemid);
	}
	public List<ItemType> getParentItemTypesByItemTypeId(Integer itemTypeId) {
		List<ItemType> result = new ArrayList<ItemType>();
		List<ItemRelation> irs = itemRelationDao.findPitemByPartId(itemTypeId);
		for(ItemRelation ir:irs)
		{
			result.add(ir.getPitem());
		}
		return result;
	}
	
}
