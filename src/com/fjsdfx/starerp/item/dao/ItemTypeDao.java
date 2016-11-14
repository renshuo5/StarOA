package com.fjsdfx.starerp.item.dao;

import java.util.List;

import com.fjsdfx.starerp.common.dao.BaseDao;
import com.fjsdfx.starerp.item.model.ItemType;

public interface ItemTypeDao  extends BaseDao<ItemType>{
	public List<ItemType> getAllItemTypes();
	public List<ItemType> findByItemTypeId(Integer itemTypeId);
	public List<ItemType> findByItemId(Integer itemid);
}
