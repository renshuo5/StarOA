package com.fjsdfx.starerp.warehouse.model;

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

import org.hibernate.annotations.ManyToAny;


import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.purchase.model.Quaprolist;
import com.fjsdfx.starerp.purchase.model.Supplierinfo;

@Entity
@Table(name="auxmaterial")
public class Auxmaterial implements Serializable{

	/**
	 * 辅助材料号
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
	/**
	 * 采购日期
	 */
	private Date purDate;
	/**
	 * 进仓数
	 */
	private Integer ewhnum;
	/**
	 * 出仓数
	 */
	private Integer owhnum;
	public Integer getEwhnum() {
		return ewhnum;
	}
	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	public Integer getNum() {
		return num;
	}
	public Integer getOwhnum() {
		return owhnum;
	}
	@Temporal(TemporalType.DATE)
	public Date getPurDate() {
		return purDate;
	}
	public String getUnit() {
		return unit;
	}
	public Float getUprice() {
		return uprice;
	}
	public void setEwhnum(Integer ewhnum) {
		this.ewhnum = ewhnum;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public void setOwhnum(Integer owhnum) {
		this.owhnum = owhnum;
	}
	public void setPurDate(Date purDate) {
		this.purDate = purDate;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public void setUprice(Float uprice) {
		this.uprice = uprice;
	}
	public void setQuaprolist(Quaprolist quaprolist) {
		this.quaprolist = quaprolist;
	}
	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="qua_id")
	public Quaprolist getQuaprolist() {
		return quaprolist;
	}
}
