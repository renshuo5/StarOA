package com.fjsdfx.starerp.produce.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;


import com.fjsdfx.starerp.item.model.ItemType;

@Entity
public class Discardproduction implements Serializable {
	/**
	 * 主键
	 */
	private Integer scg_id;
	/**
	 * 报废单号
	 */

	private Discardverify scr_id;
	/**
	 * 产品id
	 */

	private ItemType ite_id;
	/**
	 * 数量
	 */

	private Integer number;
	/**
	 * 报废原因
	 */

	private String reason;

	/**
	 * 损失工时
	 */

	private String losetime;

	/**
	 * 损失材料（元）
	 */

	private float losemoney;

	@ManyToOne
	@JoinColumn(name = "scr_id")
	public Discardverify getScr_id() {
		return scr_id;
	}

	public void setScr_id(Discardverify scrId) {
		scr_id = scrId;
	}

	@ManyToOne
	@JoinColumn(name = "ite_id")
	public ItemType getIte_id() {
		return ite_id;
	}

	public void setIte_id(ItemType iteId) {
		ite_id = iteId;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String i) {
		this.reason = i;
	}

	public String getLosetime() {
		return losetime;
	}

	public void setLosetime(String losetime) {
		this.losetime = losetime;
	}

	public float getLosemoney() {
		return losemoney;
	}

	public void setLosemoney(float losemoney) {
		this.losemoney = losemoney;
	}

	@Id
	@GeneratedValue
	public Integer getScg_id() {
		return scg_id;
	}

	public void setScg_id(Integer scgId) {
		scg_id = scgId;
	}

}
