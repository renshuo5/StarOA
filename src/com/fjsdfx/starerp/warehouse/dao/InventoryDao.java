package com.fjsdfx.starerp.warehouse.dao;

import com.fjsdfx.starerp.common.dao.BaseDao;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.warehouse.model.Inventory;

public interface InventoryDao extends BaseDao<Inventory>{

	public void addWsNumber(ItemType itemType, Integer num);

	public void addSolationnum(ItemType itemType, Integer num);

	public void subWsNumByPro(ItemType itemType, Integer num);

	public void subWsNumber(ItemType itemType, Integer num);

	public void setStonum();

}
