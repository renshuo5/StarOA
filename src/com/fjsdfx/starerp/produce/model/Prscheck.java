package com.fjsdfx.starerp.produce.model;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.annotation.Resource;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.model.Employee;

@Entity
public class Prscheck implements Serializable {
	
	private Set<Pro_schedule> proSchedules=new HashSet<Pro_schedule>();
	@OneToMany(mappedBy="prscheck",cascade={CascadeType.ALL})
	public Set<Pro_schedule> getProSchedules() {
		return proSchedules;
	}

	public void setProSchedules(Set<Pro_schedule> proSchedules) {
		this.proSchedules = proSchedules;
	}

	private Set<Prosup> prosups = new HashSet<Prosup>();

	@OneToMany(mappedBy = "prscheck", cascade = { CascadeType.ALL })
	public Set<Prosup> getProsups() {
		return prosups;
	}

	public void setProsups(Set<Prosup> prosups) {
		this.prosups = prosups;
	}

	// 计划月份
	private Date sdate;
	// 计划年份

	// 编制号
	private String psn;

	// 编制人
	private Employee employeeEdit;
	// 批准
	private Employee employeeApprove;

	// 审核
	private Employee employeeAudit;

	// 部门id
	private Department department;

	// 要货计划单

	private Preparation preparation;

	private Integer id;

	// 编制日期
	private Date prsDate;

	@ManyToOne
	@JoinColumn(name = "pre_id")
	public Preparation getPreparation() {
		return preparation;
	}

	public void setPreparation(Preparation preparation) {
		this.preparation = preparation;
	}

	@Temporal(TemporalType.DATE)
	public Date getSdate() {
		return sdate;
	}

	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}

	public String getPsn() {
		return psn;
	}

	public void setPsn(String psn) {
		this.psn = psn;
	}

	@ManyToOne
	@JoinColumn(name = "eEdit")
	public Employee getEmployeeEdit() {
		return employeeEdit;
	}

	public void setEmployeeEdit(Employee employeeEdit) {
		this.employeeEdit = employeeEdit;
	}

	@ManyToOne
	@JoinColumn(name = "eApprove")
	public Employee getEmployeeApprove() {
		return employeeApprove;
	}

	public void setEmployeeApprove(Employee employeeApprove) {
		this.employeeApprove = employeeApprove;
	}

	@ManyToOne
	@JoinColumn(name = "eAudit")
	public Employee getEmployeeAudit() {
		return employeeAudit;
	}

	public void setEmployeeAudit(Employee employeAudit) {
		this.employeeAudit = employeAudit;
	}

	@ManyToOne
	@JoinColumn(name = "dpt_id")
	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Temporal(TemporalType.DATE)
	public Date getPrsDate() {
		return prsDate;
	}

	public void setPrsDate(Date prsDate) {
		this.prsDate = prsDate;
	}

}
