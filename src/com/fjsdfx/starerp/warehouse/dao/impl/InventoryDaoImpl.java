package com.fjsdfx.starerp.warehouse.dao.impl;

import java.util.List;

import org.hibernate.dialect.IngresDialect;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.fjsdfx.starerp.common.dao.BaseDaoImpl;
import com.fjsdfx.starerp.item.model.ItemRelation;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.warehouse.dao.InventoryDao;
import com.fjsdfx.starerp.warehouse.model.Inventory;
import com.fjsdfx.starerp.warehouse.model.Maccounting;
import com.fjsdfx.starerp.warehouse.model.Stock;

@Component
public class InventoryDaoImpl extends BaseDaoImpl<Inventory> implements
		InventoryDao {

	/**
	 * 增加车间结存数量
	 */
	public void addWsNumber(ItemType itemType, Integer num) {
		HibernateTemplate hibernateTemplate = getHibernatetemplate();
		if (itemType!=null&&num!=null) {
			if (hibernateTemplate.find(
					"from Inventory i where i.itemType.id=" + itemType.getId())
					.size() != 0) {
		
				Inventory inventory = (Inventory) hibernateTemplate.find(
						"from Inventory i where i.itemType.id ="
								+ itemType.getId()).get(0);
				if (inventory.getWsstock() == null) {
					inventory.setWsstock(num);
				} else {
					inventory.setWsstock(inventory.getWsstock() + num);
				}
				hibernateTemplate.update(inventory);
			} else {
				Inventory inventory = new Inventory();
				inventory.setItemType(itemType);
				inventory.setWsstock(num);
				hibernateTemplate.save(inventory);
			}
		}

	}

	/**
	 * 计算隔离数量
	 */
	public void addSolationnum(ItemType itemType, Integer num) {
		HibernateTemplate hibernateTemplate = getHibernatetemplate();
		if (itemType!=null&&num!=null) {
			if (hibernateTemplate.find(
					"from Inventory i where i.itemType.id=" + itemType.getId())
					.size() != 0) {
				Inventory inventory = (Inventory) hibernateTemplate.find(
						"from Inventory i where i.itemType.id ="
								+ itemType.getId()).get(0);
				if (inventory.getSolationnum() == null) {
					inventory.setSolationnum(num);
				} else {
					inventory.setSolationnum(inventory.getSolationnum() + num);
				}
				hibernateTemplate.update(inventory);
			} else {
				Inventory inventory = new Inventory();
				inventory.setItemType(itemType);
				inventory.setSolationnum(num);
				hibernateTemplate.save(inventory);
			}
		}
	}

	/**
	 * 计算库存
	 */
	public void setStonum() {
		HibernateTemplate hibernateTemplate = getHibernatetemplate();
		List<Inventory> inventories = hibernateTemplate.find("from Inventory");
		if (inventories.size() != 0) {
			for (int i = 0; i < inventories.size(); i++) {
				if (hibernateTemplate.find(
						"from Stock s where s.itemType.id="
								+ inventories.get(i).getItemType().getId())
						.size() != 0) {
					Stock stock = (Stock) hibernateTemplate.find(
							"from Stock s where s.itemType.id="
									+ inventories.get(i).getItemType().getId())
							.get(0);
					inventories.get(i).setStocknum(stock.getStonum());
					hibernateTemplate.update(inventories.get(i));
				}

			}

		} else {

		}
	}

	/**
	 * 通过产品进仓单计算减少的车间结存
	 */
	@SuppressWarnings("unchecked")
	public void subWsNumByPro(ItemType itemType, Integer num) {
		if (itemType!=null&&num!=null) {
			HibernateTemplate hibernateTemplate = getHibernatetemplate();
			List<ItemRelation> itemRelations = hibernateTemplate
					.find("from ItemRelation ir where ir.pitem.id="
							+ itemType.getId());
			/**
			 * 盘点不为空
			 */
			if (hibernateTemplate.find(
					"from Inventory i where i.itemType.id=" + itemType.getId())
					.size() != 0) {
				Inventory inventory = (Inventory) hibernateTemplate.find(
						"from Inventory i where i.itemType.id ="
								+ itemType.getId()).get(0);
				if (itemRelations.size() != 0) {
					for (int i = 0; i < itemRelations.size(); i++) {
						/**
						 * 车间结存不为空
						 */
						if (inventory.getWsstock() != null) {
							/**
							 * 单击配套中itemType不为空
							 */
							if (itemRelations.get(i).getPartamount() != null) {
								inventory
										.setWsstock(inventory.getWsstock()
												- (itemRelations.get(i)
														.getPartamount() * num));
								hibernateTemplate.update(inventory);
							}
						} else {
							if (itemRelations.get(i).getPartamount() != null) {
								inventory.setWsstock(0
										- itemRelations.get(i).getPartamount()
										* num);
								hibernateTemplate.update(inventory);
							}
						}
					}

				}
			} else {

				if (itemRelations.size() != 0) {
					Inventory inventory = new Inventory();
					for (int i = 0; i < itemRelations.size(); i++) {

						if (itemRelations.get(i).getPartamount() != null) {
							inventory.setItemType(itemType);
							inventory.setWsstock(0 - (itemRelations.get(i)
									.getPartamount() * num));
							if (inventory.getStocknum() != null
									&& inventory.getWsstock() != null) {
								inventory.setTotalnum(inventory.getStocknum()
										+ inventory.getWsstock());
							} else if (inventory.getStocknum() != null) {
								inventory.setTotalnum(inventory.getStocknum());
							} else if (inventory.getWsstock() != null) {
								inventory.setTotalnum(inventory.getWsstock());
							}
							hibernateTemplate.save(inventory);
						}

					}
				}
			}
		}
	}


	/**
	 * 减少车间结存
	 */
	public void subWsNumber(ItemType itemType, Integer num) {
		if (itemType!=null&&num!=null) {
			HibernateTemplate hibernateTemplate = getHibernatetemplate();
			if (hibernateTemplate.find(
					"from Inventory i where i.itemType.id=" + itemType.getId())
					.size() != 0) {
				Inventory inventory = (Inventory) hibernateTemplate.find(
						"from Inventory i where i.itemType.id ="
								+ itemType.getId()).get(0);
				if (inventory.getWsstock() == null) {
					inventory.setWsstock(0 - num);
				} else {
					inventory.setWsstock(inventory.getWsstock() - num);
				}
				hibernateTemplate.update(inventory);
			} else {
				Inventory inventory = new Inventory();
				inventory.setItemType(itemType);
				inventory.setWsstock(0 - num);
				hibernateTemplate.save(inventory);
			}
		}

	}

}
