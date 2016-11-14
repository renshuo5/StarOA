package com.fjsdfx.starerp.purchase.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;



@Entity
@Table(name="spare")
public class Spare implements Serializable{
	
	/**
	 * Id
	 */
	private Integer id;
	/**
	 * 合格名录
	 */
	private Quaprolist quaprolist;
	/**
	 * 单位
	 */
	private String unit;
	/***
	 * 数量
	 */
	private Integer num;

	/**
	 * 单价
	 */
	private Float uprice;


	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(cascade=CascadeType.REFRESH)
	public Quaprolist getQuaprolist() {
		return quaprolist;
	}

	public void setQuaprolist(Quaprolist quaprolist) {
		this.quaprolist = quaprolist;
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
	

}
