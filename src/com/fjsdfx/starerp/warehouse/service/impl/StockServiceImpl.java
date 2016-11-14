package com.fjsdfx.starerp.warehouse.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.swing.JMenu;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.item.dao.ItemTypeDao;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.sales.dao.Shi1goodDao;
import com.fjsdfx.starerp.sales.dao.Shi2goodDao;
import com.fjsdfx.starerp.sales.model.Shi1good;
import com.fjsdfx.starerp.sales.model.Shi2good;
import com.fjsdfx.starerp.warehouse.dao.PicgoodDao;
import com.fjsdfx.starerp.warehouse.dao.StockDao;
import com.fjsdfx.starerp.warehouse.dao.StoschgoodDao;
import com.fjsdfx.starerp.warehouse.model.Picgood;
import com.fjsdfx.starerp.warehouse.model.Stock;
import com.fjsdfx.starerp.warehouse.model.Stoschgood;
import com.fjsdfx.starerp.warehouse.service.StockService;
import com.fjsdfx.starerp.warehouse.service.StoschgoodService;

@Service
@Transactional
public class StockServiceImpl extends BaseServiceImpl<Stock> implements
		StockService {

	private List<Stoschgood> stoschgoods;

	private List<Stock> stocks;

	private Stoschgood stoschgood;

	private ItemTypeDao itemTypeDao;
	private StoschgoodDao stoschgoodDao;
	private StockDao stockDao;
	private Shi1goodDao shi1goodDao;
	private Shi2goodDao shi2goodDao;
	private PicgoodDao picgoodDao;

	public Shi2goodDao getShi2goodDao() {
		return shi2goodDao;
	}

	@Resource
	public void setShi2goodDao(Shi2goodDao shi2goodDao) {
		this.shi2goodDao = shi2goodDao;
	}

	public PicgoodDao getPicgoodDao() {
		return picgoodDao;
	}

	@Resource
	public void setPicgoodDao(PicgoodDao picgoodDao) {
		this.picgoodDao = picgoodDao;
	}

	public Shi1goodDao getShi1goodDao() {
		return shi1goodDao;
	}

	@Resource
	public void setShi1goodDao(Shi1goodDao shi1goodDao) {
		this.shi1goodDao = shi1goodDao;
	}

	public StockDao getStockDao() {
		return stockDao;
	}

	@Resource
	public void setStockDao(StockDao stockDao) {
		this.stockDao = stockDao;
	}

	public StoschgoodDao getStoschgoodDao() {
		return stoschgoodDao;
	}

	@Resource
	public void setStoschgoodDao(StoschgoodDao stoschgoodDao) {
		this.stoschgoodDao = stoschgoodDao;
	}

	public ItemTypeDao getItemTypeDao() {
		return itemTypeDao;
	}

	@Resource
	public void setItemTypeDao(ItemTypeDao itemTypeDao) {
		this.itemTypeDao = itemTypeDao;
	}

	public List<Stock> getList() {
		return stockDao.getAllStocks();
	}

	public List<Stock> getGeneralList() {
		return stockDao.getGeneralList();
	}

	public List<Stock> getBondedList() {
		
		return stockDao.getBondedList();
	}

	public List<Stock> getStocks() {
		return stocks;
	}

	public Stoschgood getStoschgood() {
		return stoschgood;
	}

	public List<Stoschgood> getStoschgoods() {
		return stoschgoods;
	}

	public void setStocks(List<Stock> stocks) {
		this.stocks = stocks;
	}

	public void setStoschgood(Stoschgood stoschgood) {
		this.stoschgood = stoschgood;
	}

	public void setStoschgoods(List<Stoschgood> stoschgoods) {
		this.stoschgoods = stoschgoods;
	}

	public void addNumber(ItemType itemType, String whname, Integer num) {
		try {
			stockDao.addNumber(itemType, whname, num);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void subNumber(ItemType itemType, Integer num) {
		try {
			stockDao.subNumber(itemType, num);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void addScrnum(ItemType itemType, Integer num) {
		try {
			stockDao.addScrnum(itemType,num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public Integer getStonumByItemTypeId(Integer itemTypeId) {
		return stockDao.getNumberByItemTypeId(itemTypeId);
	}

	public String getWhnameByItemTypeId(Integer itemTypeId) {
		return stockDao.getWhnameByItemTypeId(itemTypeId);
	}

}
