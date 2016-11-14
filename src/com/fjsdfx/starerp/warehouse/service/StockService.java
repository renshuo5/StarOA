package com.fjsdfx.starerp.warehouse.service;


import java.util.List;

import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.warehouse.model.Stock;

public interface StockService extends BaseService<Stock>{

	public List<Stock> getList();
	public List<Stock> getGeneralList();
	public List<Stock> getBondedList();
	public void addNumber(ItemType itemType, String whname, Integer num);
	public void subNumber(ItemType itemType ,Integer num);
	public void addScrnum(ItemType itemType, Integer num);
	public String getWhnameByItemTypeId(Integer itemTypeId);
	public Integer getStonumByItemTypeId(Integer itemTypeId);
}
