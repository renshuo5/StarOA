package com.fjsdfx.starerp.warehouse.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


import com.fjsdfx.starerp.item.model.Item;
import com.fjsdfx.starerp.item.model.ItemType;

@Entity
@Table(name = "picgood")
public class Picgood implements Serializable{

	/**
	 * 计量单位
	 */
	private String calunit;
	/**
	 * 实发数量
	 */
	private Integer factnum;
	/**
	 * ID
	 */
	private Integer id;
	/**
	 * 部品
	 */
	private ItemType itemType;
	/**
	 * 申请数量
	 */
	private Integer reqnum;
	/**
	 * 领料单
	 */
	private Requisition requisition;
	/**
	 * 金额
	 */
	private float rprice;
	/**
	 * 单价
	 */
	private float ruprice;
	/**
	 * 用途
	 */
	private String userf;
	public String getCalunit() {
		return calunit;
	}
	public Integer getFactnum() {
		return factnum;
	}
	
	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="ite_id")
	public ItemType getItemType() {
		return itemType;
	}
	public Integer getReqnum() {
		return reqnum;
	}
	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="req_id")
	public Requisition getRequisition() {
		return requisition;
	}
	public float getRprice() {
		return rprice;
	}
	public float getRuprice() {
		return ruprice;
	}
	public String getUserf() {
		return userf;
	}
	public void setCalunit(String calunit) {
		this.calunit = calunit;
	}
	public void setFactnum(Integer factnum) {
		this.factnum = factnum;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public void setItemType(ItemType itemType) {
		this.itemType = itemType;
	}
	public void setReqnum(Integer reqnum) {
		this.reqnum = reqnum;
	}
	public void setRequisition(Requisition requisition) {
		this.requisition = requisition;
	}
	public void setRprice(float rprice) {
		this.rprice = rprice;
	}
	public void setRuprice(float ruprice) {
		this.ruprice = ruprice;
	}
	public void setUserf(String userf) {
		this.userf = userf;
	}
}
