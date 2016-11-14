package com.fjsdfx.starerp.warehouse.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.warehouse.dao.InventoryDao;
import com.fjsdfx.starerp.warehouse.model.Inventory;
import com.fjsdfx.starerp.warehouse.service.InventoryService;

@Service
@Transactional
public class InventoryServiceImpl extends BaseServiceImpl<Inventory> implements InventoryService{
	
	private InventoryDao inventoryDao;

	public InventoryDao getInventoryDao() {
		return inventoryDao;
	}

	@Resource
	public void setInventoryDao(InventoryDao inventoryDao) {
		this.inventoryDao = inventoryDao;
	}

	/**
	 * 增加车间结存数量
	 */
	public void addWsNumber(ItemType itemType, Integer num) {
		inventoryDao.addWsNumber(itemType, num);
	}

	/**
	 * 增加隔离数量
	 */
	public void addSolationnum(ItemType itemType, Integer num) {
		inventoryDao.addSolationnum(itemType, num);
	}

	/**
	 * 通过产品进仓单减少车间结存数量
	 */
	public void subWsNumByPro(ItemType itemType, Integer num) {
		inventoryDao.subWsNumByPro(itemType, num);
	}

	/**
	 * 减少车间结存数量
	 */
	public void subWsNumber(ItemType itemType, Integer num) {
		inventoryDao.subWsNumber(itemType, num);
	}

	/**
	 * 获取库存数量
	 */
	public void setStonum() {
		inventoryDao.setStonum();
		
	}

}
