package com.fjsdfx.starerp.warehouse.service;

import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.item.model.Item;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.warehouse.model.Inventory;

public interface InventoryService extends BaseService<Inventory>{

	public void addWsNumber(ItemType itemType, Integer num);
	
	public void subWsNumber(ItemType itemType, Integer num );
	
	public void subWsNumByPro(ItemType itemType, Integer num);
	
	public void addSolationnum(ItemType itemType, Integer num);
	
	public void setStonum();
}
