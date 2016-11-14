package com.fjsdfx.starerp.warehouse.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


import com.fjsdfx.starerp.item.model.ItemType;

/**
 * 
 * @author CCK 发料物料
 */

@Entity
@Table(name = "susgood")
public class Susgood implements Serializable {
	// ID
	private Integer id;
	// 保税部品数量
	private Integer bondednum;
	// 一般部品数量
	private Integer generalno;
	// 上次结存
	private Integer lbalance;
	// 序号
	private Integer no;
	// 备注
	private String note;
	// 单定
	private Integer singleset;
	// 本批结存
	private Integer tbalance;
	// 产品id
	private ItemType itemType;
	// 发料表号
	private Supsendm supsendm;
	
	@ManyToOne
	@JoinColumn(name="ite_id")
	public ItemType getItemType() {
		return itemType;
	}
	
	public void setItemType(ItemType itemType) {
		this.itemType = itemType;
	}


	@ManyToOne
	@JoinColumn(name = "sus_id")
	public Supsendm getSupsendm() {
		return supsendm;
	}


	public void setSupsendm(Supsendm supsendm) {
		this.supsendm = supsendm;
	}

	public Integer getBondednum() {
		return bondednum;
	}

	public Integer getGeneralno() {
		return generalno;
	}

	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getLbalance() {
		return lbalance;
	}

	public Integer getNo() {
		return no;
	}

	public String getNote() {
		return note;
	}

	public Integer getSingleset() {
		return singleset;
	}

	public Integer getTbalance() {
		return tbalance;
	}

	public void setBondednum(Integer bondednum) {
		this.bondednum = bondednum;
	}

	public void setGeneralno(Integer generalno) {
		this.generalno = generalno;
	}

	public void setLbalance(Integer lbalance) {
		this.lbalance = lbalance;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public void setSingleset(Integer singleset) {
		this.singleset = singleset;
	}

	public void setTbalance(Integer tbalance) {
		this.tbalance = tbalance;
	}
}
