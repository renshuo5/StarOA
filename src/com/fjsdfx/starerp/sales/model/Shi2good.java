package com.fjsdfx.starerp.sales.model;

import java.io.Serializable;
import java.util.Date;

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
@Table(name="shi2good")
public class Shi2good implements Serializable{
	
	@Id
	@GeneratedValue
	public Integer getShi2gid() {
		return shi2gid;
	}

	public void setShi2gid(Integer shi2gid) {
		this.shi2gid = shi2gid;
	}
	

	public Integer getOrderid() {
		return orderid;
	}

	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}
	
	public Integer getShi2no() {
		return shi2no;
	}

	public void setShi2no(Integer shi2no) {
		this.shi2no = shi2no;
	}

	public Integer getShi2no2() {
		return shi2no2;
	}

	public void setShi2no2(Integer shi2no2) {
		this.shi2no2 = shi2no2;
	}

	public String getShi2note() {
		return shi2note;
	}

	public void setShi2note(String shi2note) {
		this.shi2note = shi2note;
	}

	/**
	 * 发货物号（主键）
	 */
	private Integer shi2gid;

	/**
	 * 要货单号
	 */
	private Integer orderid;


	/**
	 * 数量
	 */
	private Integer shi2no;
	
	/**
	 * 件数
	 */
	private Integer shi2no2;

	/**
	 * 备注
	 */
	private String shi2note;

	/**
	 * 发货单号（外键）
	 */
	private Shinote2 shinote2;


	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="shi2id")
	public Shinote2 getShinote2() {
		return shinote2;
	}

	public void setShinote2(Shinote2 shinote2) {
		this.shinote2 = shinote2;
	}
	

	/**
	 * 型号规格（部品名称）
	 */
	private ItemType itemType;


	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="ite_id")
	public ItemType getItemType() {
		return itemType;
	}
	public void setItemType(ItemType itemType) {
		this.itemType = itemType;
	}

	
}