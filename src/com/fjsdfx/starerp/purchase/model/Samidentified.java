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
import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.model.Employee;

@Entity
@Table(name="samidentified")
public class Samidentified implements Serializable{
	/**
	 * ID
	 */
	private Integer id;
	/**
	 * 供应商
	 */
	private Supplierinfo supplierinfo;
	/**
	 * 经办人
	 */
	private Employee hangding;
	/**
	 * 负责人
	 */
	private Employee resper;
	/**
	 * 申请单位
	 */
	private Department department;
	/**
	 * 时间
	 */
	private Date samdate;
	/**
	 * 第几次申请
	 */
	private Integer reqtime;
	/**
	 * 希望_之前完成
	 */
	private Date wantdate;
	/**
	 * 图号或料号
	 */
	private String mcodename;
	/**
	 * 品牌
	 */
	private String brand;
	/**
	 * 数量
	 */
	private Integer num;
	/**
	 * 单价
	 */
	private Float uprice;
	/**
	 * 新产品
	 */
	private Boolean newitem;
	/**
	 * 新供方
	 */
	private Boolean newsup;
	/**
	 * 技术变更
	 */
	private Boolean techchange;
	/**
	 * 降低成本
	 */
	private Boolean redcost;
	/**
	 * 进入量试
	 */
	private Boolean entest;
	/**
	 * 认定结论
	 */
	private String conclusion;
	/**
	 * 审核经办
	 */
	private Employee examine;
	/*
	 * 经办时间
	 */
	private Date examdate;
	/**
	 * 主管
	 */
	private Employee charge;
	/**
	 * 审核时间
	 */
	private Date examinedate;
	/**
	 * 分管领导意见
	 */
	private String opinion;
	/**
	 * 分管意见填写时间
	 */
	private Date opiniondate;
	/**
	 * 适用产品
	 */
	private ItemType itemtype;
	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@ManyToOne(cascade=CascadeType.REFRESH)
	public Supplierinfo getSupplierinfo() {
		return supplierinfo;
	}
	public void setSupplierinfo(Supplierinfo supplierinfo) {
		this.supplierinfo = supplierinfo;
	}
	
	@ManyToOne(cascade=CascadeType.REFRESH)
	public Employee getHangding() {
		return hangding;
	}
	public void setHangding(Employee hangding) {
		this.hangding = hangding;
	}
	
	@ManyToOne(cascade=CascadeType.REFRESH)
	public Employee getResper() {
		return resper;
	}
	public void setResper(Employee resper) {
		this.resper = resper;
	}
	
	@ManyToOne(cascade=CascadeType.REFRESH)
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	
	@Temporal(TemporalType.DATE)
	public Date getSamdate() {
		return samdate;
	}
	public void setSamdate(Date samdate) {
		this.samdate = samdate;
	}
	@Temporal(TemporalType.DATE)
	public Date getExamdate() {
		return examdate;
	}
	public void setExamdate(Date examdate) {
		this.examdate = examdate;
	}
	public Integer getReqtime() {
		return reqtime;
	}
	public void setReqtime(Integer reqtime) {
		this.reqtime = reqtime;
	}
	@Temporal(TemporalType.DATE)
	public Date getWantdate() {
		return wantdate;
	}
	public void setWantdate(Date wantdate) {
		this.wantdate = wantdate;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
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
	public Boolean getNewitem() {
		return newitem;
	}
	public void setNewitem(Boolean newitem) {
		this.newitem = newitem;
	}
	public Boolean getNewsup() {
		return newsup;
	}
	public void setNewsup(Boolean newsup) {
		this.newsup = newsup;
	}
	public Boolean getTechchange() {
		return techchange;
	}
	public void setTechchange(Boolean techchange) {
		this.techchange = techchange;
	}
	public Boolean getRedcost() {
		return redcost;
	}
	public void setRedcost(Boolean redcost) {
		this.redcost = redcost;
	}
	public Boolean getEntest() {
		return entest;
	}
	public void setEntest(Boolean entest) {
		this.entest = entest;
	}
	public String getMcodename() {
		return mcodename;
	}
	public void setMcodename(String mcodename) {
		this.mcodename = mcodename;
	}
	public String getConclusion() {
		return conclusion;
	}
	public void setConclusion(String conclusion) {
		this.conclusion = conclusion;
	}
	
	@ManyToOne(cascade=CascadeType.REFRESH)
	public Employee getExamine() {
		return examine;
	}
	public void setExamine(Employee examine) {
		this.examine = examine;
	}
	
	@ManyToOne(cascade=CascadeType.REFRESH)
	public Employee getCharge() {
		return charge;
	}
	public void setCharge(Employee charge) {
		this.charge = charge;
	}
	
	@Temporal(TemporalType.DATE)
	public Date getExaminedate() {
		return examinedate;
	}
	public void setExaminedate(Date examinedate) {
		this.examinedate = examinedate;
	}
	public String getOpinion() {
		return opinion;
	}
	public void setOpinion(String opinion) {
		this.opinion = opinion;
	}
	
	@Temporal(TemporalType.DATE)
	public Date getOpiniondate() {
		return opiniondate;
	}
	public void setOpiniondate(Date opiniondate) {
		this.opiniondate = opiniondate;
	}
	@ManyToOne(cascade=CascadeType.REFRESH)
	public ItemType getItemtype() {
		return itemtype;
	}
	public void setItemtype(ItemType itemtype) {
		this.itemtype = itemtype;
	}
	

}
