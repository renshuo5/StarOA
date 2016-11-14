package com.fjsdfx.starerp.warehouse.model;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fjsdfx.starerp.persons.model.Employee;



@Entity
@Table(name="requisition")
public class Requisition implements Serializable{

	private Set<Picgood> picgoods = new HashSet<Picgood>();
	@OneToMany(mappedBy="requisition",cascade={CascadeType.ALL})
	public Set<Picgood> getPicgoods() {
		return picgoods;
	}
	public void setPicgoods(Set<Picgood> picgoods) {
		this.picgoods = picgoods;
	}
	/**
	 * 单位
	 */
	private String company;
	/**
	 * 核准
	 */
	private Employee confirmper;
	/**
	 * 出库时间
	 */
	private Date deliverDate;
	/**
	 * 部门负责人
	 */
	private Employee dptmanager;
	/**
	 * 领料人
	 */
	private Employee pickingper;
	/**
	 * 领料单号
	 */
	private Integer req_id;
	/**
	 * 领料时间
	 */
	private Date reqDate;
	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="pink_id")
	public Employee getPickingper() {
		return pickingper;
	}
	public void setPickingper(Employee pickingper) {
		this.pickingper = pickingper;
	}
	public String getCompany() {
		return company;
	}
	@Temporal(TemporalType.DATE)
	public Date getDeliverDate() {
		return deliverDate;
	}
	@Id
	@GeneratedValue
	public Integer getReq_id() {
		return req_id;
	}
	@Temporal(TemporalType.DATE)
	public Date getReqDate() {
		return reqDate;
	}
	
	public void setCompany(String company) {
		this.company = company;
	}
	public void setDeliverDate(Date deliverDate) {
		this.deliverDate = deliverDate;
	}
	public void setReq_id(Integer reqId) {
		req_id = reqId;
	}
	public void setReqDate(Date reqDate) {
		this.reqDate = reqDate;
	}
	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="conf_id")
	public Employee getConfirmper() {
		return confirmper;
	}
	public void setConfirmper(Employee confirmper) {
		this.confirmper = confirmper;
	}
	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="dpt_id")
	public Employee getDptmanager() {
		return dptmanager;
	}
	public void setDptmanager(Employee dptmanager) {
		this.dptmanager = dptmanager;
	}
	
}
