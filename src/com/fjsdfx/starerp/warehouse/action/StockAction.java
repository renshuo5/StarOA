package com.fjsdfx.starerp.warehouse.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ItemTypeService;
import com.fjsdfx.starerp.warehouse.model.Stock;
import com.fjsdfx.starerp.warehouse.model.Warehouse;
import com.fjsdfx.starerp.warehouse.service.StockService;
import com.sun.org.apache.bcel.internal.classfile.PMGClass;

@Controller
@Scope("prototype")
public class StockAction {

	private ItemType itemType;

	private Integer itemTypeId;

	private ItemTypeService itmItemTypeService;

	private PagerModel pm;

	private Stock stock;

	private List<Stock> stocks;

	private Integer stockId;

	private StockService stockService;

	/**
	 * 非保税品列表
	 * 
	 * @return
	 */
	public String generallist() {
		pm = stockService.getPagerDesc(Stock.class,
				"where o.itemType.isbonded = 0");
		return "generallist";
	}

	/**
	 * 保税品列表
	 * 
	 * @return
	 */
	public String bondedList() {
		pm = stockService.getPagerDesc(Stock.class,
				"where o.itemType.isbonded = 1");
		return "bondedlist";
	}

	/**
	 * 非保税品搜索
	 * 
	 * @return
	 */
	public String generalsearch() {
		// pm=resourceService.findByExample(Resource.class, resource);

		Map<String, String> like = new HashMap<String, String>();
		like.put("itemType.item.name", stock.getItemType().getItem().getName());
		pm = stockService.fuzzyQuery(Stock.class, like);
		return "generallist";
	}

	/**
	 * 保税品搜索
	 * 
	 * @return
	 */
	public String bondedsearch() {
		// pm=resourceService.findByExample(Resource.class, resource);

		Map<String, String> like = new HashMap<String, String>();
		like.put("itemType.item.name", stock.getItemType().getItem().getName());
		pm = stockService.fuzzyQuery(Stock.class, like);
		return "bondedlist";
	}

	public ItemType getItemType() {
		return itemType;
	}

	public Integer getItemTypeId() {
		return itemTypeId;
	}

	public ItemTypeService getItmItemTypeService() {
		return itmItemTypeService;
	}

	public PagerModel getPm() {
		return pm;
	}

	public Stock getStock() {
		return stock;
	}

	public Integer getStockId() {
		return stockId;
	}

	public List<Stock> getStocks() {
		return stocks;
	}

	public StockService getStockService() {
		return stockService;
	}

	public void setItemType(ItemType itemType) {
		this.itemType = itemType;
	}

	public void setItemTypeId(Integer itemTypeId) {
		this.itemTypeId = itemTypeId;
	}

	@Resource
	public void setItmItemTypeService(ItemTypeService itmItemTypeService) {
		this.itmItemTypeService = itmItemTypeService;
	}

	public void setPm(PagerModel pm) {
		this.pm = pm;
	}

	public void setStock(Stock stock) {
		this.stock = stock;
	}

	public void setStockId(Integer stockId) {
		this.stockId = stockId;
	}

	public void setStocks(List<Stock> stocks) {
		this.stocks = stocks;
	}

	@Resource
	public void setStockService(StockService stockService) {
		this.stockService = stockService;
	}

}
