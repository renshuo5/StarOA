package com.fjsdfx.starerp.persons.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import java.io.Serializable;
import java.util.Date;
/**
 * 员工奖惩信息
 *
 */
@Entity
@Table(name="employeeRap")
public class EmployeeRap implements Serializable {

	/**
	 * 数据库ID
	 */
	private Integer empRpId;

	/**
	 *奖惩名称
	 */
	private String rapName;

	/**
	 *奖惩时间
	 */
	private Date rapDate;

	/**
	 *奖惩原因
	 */
	private String rapReason;
	
	/**
	 * 员工的信息
	 * @return
	 */
	private Employee employee;
	
	private Integer  isdel;

	public Integer getIsdel() {
		return isdel;
	}

	public void setIsdel(Integer isdel) {
		this.isdel = isdel;
	}

	@Id
	@GeneratedValue
	@JoinColumn(name="emprp_id")
	public Integer getEmpRpId() {
		return empRpId;
	}

	public void setEmpRpId(Integer empRpId) {
		this.empRpId = empRpId;
	}


	@JoinColumn(name="rapname")
	public String getRapName() {
		return rapName;
	}

	public void setRapName(String rapName) {
		this.rapName = rapName;
	}

	@JoinColumn(name="rapdate")
	public Date getRapDate() {
		return rapDate;
	}

	public void setRapDate(Date rapDate) {
		this.rapDate = rapDate;
	}

	@JoinColumn(name="rapreason")
	public String getRapReason() {
		return rapReason;
	}
	
	public void setRapReason(String rapReason) {
		this.rapReason = rapReason;
	}	
	@ManyToOne(cascade=CascadeType.PERSIST.MERGE)//persist更新  merge新建
	@JoinColumn(name="emp_id",nullable=true)
	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
}
