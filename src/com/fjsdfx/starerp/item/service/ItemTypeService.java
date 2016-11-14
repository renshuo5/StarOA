package com.fjsdfx.starerp.item.service;

import java.util.List;

import com.fjsdfx.starerp.item.model.Controllerunit;

import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.item.model.ItemType;

public interface ItemTypeService  extends BaseService<ItemType>{
	public List<ItemType> getAllItemTypes();
	public List<ItemType> getItemTypesByIds(List<Integer> ids);
	PagerModel getItemTypesByItemId(Class<ItemType> entityClass,Integer itemId);
	public ItemType save(ItemType itemType,Integer sitemid);
	public List<ItemType> findByItemId(Integer itemid);
	public List<ItemType> findByItemTypeId(Integer itemTypeId);
	public ItemType update(ItemType itemType,Integer sitemid);
	public ItemType deleteById(Integer id);
	public List<ItemType> getParentItemTypesByItemTypeId(Integer itemTypeId);
}
