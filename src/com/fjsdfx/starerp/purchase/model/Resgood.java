package com.fjsdfx.starerp.purchase.model;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


import com.fjsdfx.starerp.item.model.ItemType;

@Entity
public class Resgood implements Serializable{
	/**
	 * ID
	 */
	private Integer id;
	/**
	 * 请购单号
	 */
	private Requisitions requisitions;
	/**
	 * 请购物品
	 */
	private ItemType itemtype;
	/**
	 * 单机数
	 */
	private Integer unum;
	/**
	 * 单价
	 */
	private Float uprice;
	/**
	 * 订购数量
	 */
	private Integer reqnum;
	/**
	 * 到货期
	 */
	private Date arrivaldate;
	/**
	 * 付款条件
	 */
	private String payment;
	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@ManyToOne(cascade=CascadeType.REFRESH)
	public Requisitions getRequisitions() {
		return requisitions;
	}
	public void setRequisitions(Requisitions requisitions) {
		this.requisitions = requisitions;
	}
	
	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="ite_id")
	public ItemType getItemtype() {
		return itemtype;
	}
	public void setItemtype(ItemType itemtype) {
		this.itemtype = itemtype;
	}
	public Integer getUnum() {
		return unum;
	}
	public void setUnum(Integer unum) {
		this.unum = unum;
	}
	public Float getUprice() {
		return uprice;
	}
	public void setUprice(Float uprice) {
		this.uprice = uprice;
	}
	public Integer getReqnum() {
		return reqnum;
	}
	public void setReqnum(Integer reqnum) {
		this.reqnum = reqnum;
	}
	@Temporal(TemporalType.DATE)
	public Date getArrivaldate() {
		return arrivaldate;
	}
	public void setArrivaldate(Date arrivaldate) {
		this.arrivaldate = arrivaldate;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	

}
