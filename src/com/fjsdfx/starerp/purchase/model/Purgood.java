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
public class Purgood implements Serializable {
	/**
	 * ID
	 */
	private Integer id;
	/**
	 * 采购单号
	 */
	private Purorder purorder;
	/**
	 * 采购物品
	 */
	private ItemType itemtype;
	/**
	 * 单位
	 */
	private String unit;
	/**
	 * 数量
	 */
	private Integer num;
	/**
	 * 单价
	 */
	private Float uprice;
	/**
	 * 交期
	 */
	private Date delydate;
	/**
	 * 备注
	 */
	private String note;
	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="purorder_id")
	public Purorder getPurorder() {
		return purorder;
	}
	public void setPurorder(Purorder purorder) {
		this.purorder = purorder;
	}
	
	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="ite_id")
	public ItemType getItemtype() {
		return itemtype;
	}
	public void setItemtype(ItemType itemtype) {
		this.itemtype = itemtype;
	}
	
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public Float getUprice() {
		return uprice;
	}
	public void setUprice(Float uprice) {
		this.uprice = uprice;
	}
	
	@Temporal(TemporalType.DATE)
	public Date getDelydate() {
		return delydate;
	}
	public void setDelydate(Date delydate) {
		this.delydate = delydate;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	

}
