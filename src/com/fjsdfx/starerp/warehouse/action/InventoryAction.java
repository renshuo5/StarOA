package com.fjsdfx.starerp.warehouse.action;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ItemTypeService;
import com.fjsdfx.starerp.warehouse.model.Inventory;
import com.fjsdfx.starerp.warehouse.model.Maccounting;
import com.fjsdfx.starerp.warehouse.service.InventoryService;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;
import com.sun.org.apache.bcel.internal.classfile.PMGClass;

@Controller
@Scope("prototype")
public class InventoryAction {

	private Inventory inventory;

	private Integer inventoryId;

	private InventoryService inventoryService;

	private ItemType itemType;

	private Integer itemTypeId;

	private ItemTypeService itemTypeService;

	private Logger logger = LoggerFactory.getLogger(InventoryAction.class);

	private PagerModel pm;

	/**
	 * 列表
	 * 
	 * @return
	 */
	public String list() {

		inventoryService.setStonum();
		pm = inventoryService.getPagerDesc(Inventory.class);

		return "list";
	}

	/**
	 * 查询
	 * 
	 * @return
	 */
	public String search() {
		Map<String, String> like = new HashMap<String, String>();
		like.put("itemType.name", inventory.getItemType().getName());
		pm = inventoryService.fuzzyQuery(Inventory.class, like);
		return "list";
	}

	public void setInventory(Inventory inventory) {
		this.inventory = inventory;
	}

	public void setInventoryId(Integer inventoryId) {
		this.inventoryId = inventoryId;
	}

	@Resource
	public void setInventoryService(InventoryService inventoryService) {
		this.inventoryService = inventoryService;
	}

	public void setItemType(ItemType itemType) {
		this.itemType = itemType;
	}

	public void setItemTypeId(Integer itemTypeId) {
		this.itemTypeId = itemTypeId;
	}

	@Resource
	public void setItemTypeService(ItemTypeService itemTypeService) {
		this.itemTypeService = itemTypeService;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	public void setPm(PagerModel pm) {
		this.pm = pm;
	}

	public Inventory getInventory() {
		return inventory;
	}

	public Integer getInventoryId() {
		return inventoryId;
	}

	public InventoryService getInventoryService() {
		return inventoryService;
	}

	public ItemType getItemType() {
		return itemType;
	}

	public Integer getItemTypeId() {
		return itemTypeId;
	}

	public ItemTypeService getItemTypeService() {
		return itemTypeService;
	}

	public Logger getLogger() {
		return logger;
	}

	public PagerModel getPm() {
		return pm;
	}

}
