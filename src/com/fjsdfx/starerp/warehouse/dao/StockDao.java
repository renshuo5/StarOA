package com.fjsdfx.starerp.warehouse.dao;

import java.util.List;

import com.fjsdfx.starerp.common.dao.BaseDao;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.warehouse.model.Stock;

public interface StockDao extends BaseDao<Stock>{
	public List<Stock> getAllStocks();
	public void addNumber(ItemType itemType, String whanme,Integer num) throws Exception;
	public void subNumber(ItemType itemType ,Integer num) throws Exception;
	public void addScrnum(ItemType itemType, Integer num) throws Exception;
	public List<Stock> getGeneralList();
	public List<Stock> getBondedList();
	public Integer getNumberByItemTypeId(Integer itemTypeId);
	public String getWhnameByItemTypeId(Integer itemTypeId);
}
