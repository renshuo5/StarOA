package com.fjsdfx.starerp.warehouse.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;




import com.fjsdfx.starerp.item.model.ItemType;

@Entity
@Table(name="stock")
public class Stock implements Serializable{

	/**
	 * 部品ID
	 */
	private ItemType itemType;
	/**
	 * 序号
	 */
	private Integer sto_id;
	/**
	 * 进仓数
	 */
	private Integer ennum;
	/**
	 * 出仓数
	 */
	private Integer outnum;
	
	/**
	 * 库存数量
	 */
	private Integer stonum;
	/**
	 * 仓库名
	 */
	private String whname;
	/**
	 * 报废数量
	 * @return
	 */
	private Integer scrnum;
	public Integer getEnnum() {
		return ennum;
	}
	@ManyToOne(cascade=CascadeType.REFRESH)
	public ItemType getItemType() {
		return itemType;
	}
	
	public Integer getOutnum() {
		return outnum;
	}
	@Id
	@GeneratedValue
	public Integer getSto_id() {
		return sto_id;
	}
	
	public Integer getStonum() {
		return stonum;
	}
	
	public String getWhname() {
		return whname;
	}
	public void setEnnum(Integer ennum) {
		this.ennum = ennum;
	}
	public void setItemType(ItemType itemType) {
		this.itemType = itemType;
	}
	public void setOutnum(Integer outnum) {
		this.outnum = outnum;
	}
	public void setSto_id(Integer stoId) {
		sto_id = stoId;
	}
	public void setStonum(Integer stonum) {
		this.stonum = stonum;
	}
	public void setWhname(String whname) {
		this.whname = whname;
	}
	public Integer getScrnum() {
		return scrnum;
	}
	public void setScrnum(Integer scrnum) {
		this.scrnum = scrnum;
	}
}
