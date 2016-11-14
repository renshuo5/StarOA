package com.fjsdfx.starerp.warehouse.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


import com.fjsdfx.starerp.item.model.ItemType;


@Entity
@Table(name="inventory")
public class Inventory implements Serializable{
	
	/**
	 * 盘点号
	 */
	private Integer inv_id;
	/**
	 * 部品ID
	 */
	private ItemType itemType;
	/**
	 * 隔离数量
	 */
	private Integer solationnum;
	/**
	 * 库存数量
	 */
	private Integer stocknum;
	/**
	 * 总数量
	 */
	private Integer totalnum;
	/**
	 * 车间结存
	 */
	private Integer wsstock;
	@Id
	@GeneratedValue
	public Integer getInv_id() {
		return inv_id;
	}
	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="ite_id")
	public ItemType getItemType() {
		return itemType;
	}
	public Integer getSolationnum() {
		return solationnum;
	}
	public Integer getStocknum() {
		return stocknum;
	}
	public Integer getTotalnum() {
		return totalnum;
	}
	public Integer getWsstock() {
		return wsstock;
	}
	public void setInv_id(Integer invId) {
		inv_id = invId;
	}
	public void setItemType(ItemType itemType) {
		this.itemType = itemType;
	}
	public void setSolationnum(Integer solationnum) {
		this.solationnum = solationnum;
	}
	public void setStocknum(Integer stocknum) {
		this.stocknum = stocknum;
	}
	public void setTotalnum(Integer totalnum) {
		this.totalnum = totalnum;
	}
	public void setWsstock(Integer wsstock) {
		this.wsstock = wsstock;
	}

}
