package com.fjsdfx.starerp.purchase.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.model.Employee;

@Entity
@Table(name="supidentified")
public class Supidentified implements Serializable {
	/*
	 * Id
	 * */
	private Integer id;
	/*
	 * 申请人
	 * */
	private Employee reqper;
	/*
	 * 申请单位
	 * */
	private Department reqdpt;
	/*
	 * 申请日期
	 * */
	private Date reqdate;
	/*
	 * 接收人
	 * */
	private Employee recper 
;
	/*
	 * 接收单位
	 * */
	private Department recdpt;
	/*
	 * 接收日期
	 * */
	private Date recdate;
	/*
	 * 供应商
	 * */
	private Supplierinfo supplierinfo;
	/*
	 * 品牌
	 * */
	private String brand;
	/*
	 * 直销（1）或代销（0）
	 * */
	private Boolean directosales;
	/*
	 * 申请认定理由
	 * */
	private String reqreason;
	/*
	 * 申请附备资料
	 * */
	private String reqinfo;
	/*
	 * 采购认定意见
	 * */
	private String puradvice;
	/*
	 * 采购经办
	 * */
	private Employee purper;
	/*
	 * 采购部门负责人
	 * */
	private Employee purresper;
	/*
	 * 采购认定日期
	 * */
	private Date purdate;
	/**
	 * 部门认定日期
	 */
	private Date pardate;
	
	/*
	 * 品工部认定意见
	 * */
	private String quadvice;
	/*
	 * 品工经办
	 * */
	private Employee quaper;
	/*
	 * 品工部门负责人
	 * */
	private Employee quaresper;
	/*
	 * 品工认定日期
	 * */
	private Date quadate;
	/**
	 * 部门认定日期
	 */
	private Date partdate;
	@Temporal(TemporalType.DATE)
	public Date getPartdate() {
		return partdate;
	}
	public void setPartdate(Date partdate) {
		this.partdate = partdate;
	}
	/*
	 * 总工或分管领导意见
	 * */
	private String manadvice;
	/*
	 * 总工或分管签字
	 * */
	private Employee manper;
	/*
	 * 总工或分管日期
	 * */
	private Date mandate;
	/*
	 * 备注
	 * */
	private String note;
	/*
	 * 记住样品ID
	 * */
	private Integer samid;
	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@ManyToOne(cascade=CascadeType.REFRESH)
	public Employee getReqper() {
		return reqper;
	}
	public void setReqper(Employee reqper) {
		this.reqper = reqper;
	}
	@ManyToOne(cascade=CascadeType.REFRESH)
	public Department getReqdpt() {
		return reqdpt;
	}
	public void setReqdpt(Department reqdpt) {
		this.reqdpt = reqdpt;
	}
	
	@Temporal(TemporalType.DATE)
	public Date getReqdate() {
		return reqdate;
	}
	public void setReqdate(Date reqdate) {
		this.reqdate = reqdate;
	}
	
	@ManyToOne(cascade=CascadeType.REFRESH)
	public Employee getRecper() {
		return recper;
	}
	public void setRecper(Employee recper) {
		this.recper = recper;
	}
	
	@ManyToOne(cascade=CascadeType.REFRESH)
	public Department getRecdpt() {
		return recdpt;
	}
	public void setRecdpt(Department recdpt) {
		this.recdpt = recdpt;
	}
	
	@Temporal(TemporalType.DATE)
	public Date getRecdate() {
		return recdate;
	}
	public void setRecdate(Date recdate) {
		this.recdate = recdate;
	}
	
	@ManyToOne(cascade=CascadeType.REFRESH)
	public Supplierinfo getSupplierinfo() {
		return supplierinfo;
	}
	public void setSupplierinfo(Supplierinfo supplierinfo) {
		this.supplierinfo = supplierinfo;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getReqreason() {
		return reqreason;
	}
	public void setReqreason(String reqreason) {
		this.reqreason = reqreason;
	}
	public String getReqinfo() {
		return reqinfo;
	}
	public void setReqinfo(String reqinfo) {
		this.reqinfo = reqinfo;
	}
	public String getPuradvice() {
		return puradvice;
	}
	public void setPuradvice(String puradvice) {
		this.puradvice = puradvice;
	}
	
	@ManyToOne(cascade=CascadeType.REFRESH)
	public Employee getPurper() {
		return purper;
	}
	public void setPurper(Employee purper) {
		this.purper = purper;
	}
	
	@ManyToOne(cascade=CascadeType.REFRESH)
	public Employee getPurresper() {
		return purresper;
	}
	public void setPurresper(Employee purresper) {
		this.purresper = purresper;
	}
	
	@Temporal(TemporalType.DATE)
	public Date getPurdate() {
		return purdate;
	}
	public void setPurdate(Date purdate) {
		this.purdate = purdate;
	}
	public String getQuadvice() {
		return quadvice;
	}
	public void setQuadvice(String quadvice) {
		this.quadvice = quadvice;
	}
	
	@ManyToOne(cascade=CascadeType.REFRESH)
	public Employee getQuaper() {
		return quaper;
	}
	public void setQuaper(Employee quaper) {
		this.quaper = quaper;
	}
	
	@ManyToOne(cascade=CascadeType.REFRESH)
	public Employee getQuaresper() {
		return quaresper;
	}
	public void setQuaresper(Employee quaresper) {
		this.quaresper = quaresper;
	}
	
	@Temporal(TemporalType.DATE)
	public Date getQuadate() {
		return quadate;
	}
	public void setQuadate(Date quadate) {
		this.quadate = quadate;
	}
	public String getManadvice() {
		return manadvice;
	}
	public void setManadvice(String manadvice) {
		this.manadvice = manadvice;
	}
	
	@ManyToOne(cascade=CascadeType.REFRESH)
	public Employee getManper() {
		return manper;
	}
	public void setManper(Employee manper) {
		this.manper = manper;
	}
	
	@Temporal(TemporalType.DATE)
	public Date getMandate() {
		return mandate;
	}
	public void setMandate(Date mandate) {
		this.mandate = mandate;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public Boolean getDirectosales() {
		return directosales;
	}
	public void setDirectosales(Boolean directosales) {
		this.directosales = directosales;
	}
	public Integer getSamid() {
		return samid;
	}
	public void setSamid(Integer samid) {
		this.samid = samid;
	}
	@Temporal(TemporalType.DATE)
	public Date getPardate() {
		return pardate;
	}
	public void setPardate(Date pardate) {
		this.pardate = pardate;
	}
	

}
