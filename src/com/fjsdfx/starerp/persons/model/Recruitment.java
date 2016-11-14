package com.fjsdfx.starerp.persons.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;



/**
 * 人员招聘
 * @author Administrator
 *
 */
@Entity
@Table(name="recruitment")
public class Recruitment implements Serializable{

	/**
	 * 人员招聘单号
	 */
	private Integer id;
	
	/**
	 * 部门ID
	 */
	private Department department;
	
	/**
	 * 需求类别
	 */
	private String recstyle;
	
	/**
	 * 需求人数
	 */
	private Integer recno;
	
	/**
	 * 招聘性质
	 */
	private String recnature;
	
	/**
	 * 基本要求
	 */
	private String baserec;
	
	/**
	 * 登记日期
	 */
	private Date rDate;
	
	/**
	 * 审核字段
	 * @return
	 */
    private Integer isCheck;
    
    /**
     * 是否是年度招聘里面的东西1表示是，0表示不是
     * @return
     */
    private Integer isyear;

	/**
     * 年度招聘的名字
     */
    private Yrecruitment yrecruitment;
    
	@Id
	@GeneratedValue
	@JoinColumn(name="rec_id")
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(cascade=CascadeType.PERSIST.MERGE)
	@JoinColumn(name="dpt_id",nullable=false)
	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	@JoinColumn(name="recstyle")
	public String getRecstyle() {
		return recstyle;
	}

	public void setRecstyle(String recstyle) {
		this.recstyle = recstyle;
	}

	@JoinColumn(name="recno")
	public Integer getRecno() {
		return recno;
	}

	public void setRecno(Integer recno) {
		this.recno = recno;
	}

	@JoinColumn(name="recnature")
	public String getRecnature() {
		return recnature;
	}

	public void setRecnature(String recnature) {
		this.recnature = recnature;
	}

	@JoinColumn(name="baserec")
	public String getBaserec() {
		return baserec;
	}

	public void setBaserec(String baserec) {
		this.baserec = baserec;
	}

	@JoinColumn(name="rdate")
	public Date getrDate() {
		return rDate;
	}

	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}

	public Integer getIsCheck() {
		return isCheck;
	}

	public void setIsCheck(Integer isCheck) {
		this.isCheck = isCheck;
	}

	public Integer getIsyear() {
		return isyear;
	}

	public void setIsyear(Integer isyear) {
		this.isyear = isyear;
	}

	@ManyToOne(cascade=CascadeType.PERSIST.MERGE)
	public Yrecruitment getYrecruitment() {
		return yrecruitment;
	}
 
	
	public void setYrecruitment(Yrecruitment yrecruitment) {
		this.yrecruitment = yrecruitment;
	}
    
	
}
