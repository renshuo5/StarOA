package com.fjsdfx.starerp.warehouse.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


import com.fjsdfx.starerp.item.model.ItemType;

@Entity
@Table(name="maccounting")
public class Maccounting implements Serializable{

	/***
	 * 部品ID
	 */
	private ItemType itemType;
	/**
	 * 台账号
	 */
	private Integer mac_id;
	/**
	 * 日期
	 */
	private Date macdate;
	/**
	 * 摘要
	 */
	private String notes;
	/**
	 * 收入数量
	 */
	private Integer ennum;
	/**
	 *发出数量 
	 */
	private Integer outnum;
	/**
	 * 结存数量
	 */
	private Integer stonum;
	/**
	 * 存储仓库名
	 */
	private String whname;
	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="ite_id")
	public ItemType getItemType() {
		return itemType;
	}
	@Id
	@GeneratedValue
	public Integer getMac_id() {
		return mac_id;
	}
	
	@Temporal(TemporalType.DATE)
	public Date getMacdate() {
		return macdate;
	}
	public String getNotes() {
		return notes;
	}
	public Integer getStonum() {
		return stonum;
	}
	public String getWhname() {
		return whname;
	}
	public void setItemType(ItemType itemType) {
		this.itemType = itemType;
	}
	public void setMac_id(Integer macId) {
		mac_id = macId;
	}
	@Temporal(TemporalType.DATE)
	public void setMacdate(Date macdate) {
		this.macdate = macdate;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	public void setStonum(Integer stonum) {
		this.stonum = stonum;
	}
	public void setWhname(String whname) {
		this.whname = whname;
	}
	public Integer getEnnum() {
		return ennum;
	}
	public void setEnnum(Integer ennum) {
		this.ennum = ennum;
	}
	public Integer getOutnum() {
		return outnum;
	}
	public void setOutnum(Integer outnum) {
		this.outnum = outnum;
	}
}
