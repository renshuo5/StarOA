package com.fjsdfx.starerp.produce.model;

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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.model.Employee;
import com.sun.org.apache.bcel.internal.generic.NEW;

/**
 * 缺料报告单
 * @author ledefe
 *
 */
@Entity
public class Shortm implements Serializable {
	private Set<Shogood> shogoods2=new HashSet<Shogood>();
	@OneToMany(mappedBy="shortm",cascade={CascadeType.ALL})
	public Set<Shogood> getShogoods2() {
		return shogoods2;
	}

	public void setShogoods2(Set<Shogood> shogoods2) {
		this.shogoods2 = shogoods2;
	}


/*	private Set<Shogood> shogoods=new HashSet<Shogood>();
	
	@OneToMany(mappedBy="department1",cascade={CascadeType.ALL})

	public Set<Shogood> getShogoods() {
		return shogoods;
	}

	public void setShogoods(Set<Shogood> shogoods) {
		this.shogoods = shogoods;
	}
*/
	
	/**
	 * 申请单位id
	 */
	private Department department1;
	/**
	 * 车间主任id
	 */
	
	private Employee employee1;
	/**
	 * 申请人id
	 */
	private Employee employee2;
	/**
	 * 自动id
	 */
	private Integer id;
	/**
	 * 时间
	 */
	private Date sdate;
	/**
	 * 缺料编号id
	 */
	private String shoid;
	/**
	 * 表单的状态
	 */
	private String state;
	/**
	 * 批准人
	 */
	private String approve;
	/**
	 * 审核人
	 */
	private String sho_check;

	public String getSho_check() {
		return sho_check;
	}

	public void setSho_check(String shoCheck) {
		sho_check = shoCheck;
	}

	public String getApprove() {
		return approve;
	}

	public void setApprove(String approve) {
		this.approve = approve;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@ManyToOne 
	@JoinColumn(name="rdepartment")
	public Department getDepartment1() {
		return department1;
	}

	@ManyToOne
	@JoinColumn(name="rper")
	public Employee getEmployee2() {
		return employee2;
	}

	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	@Temporal(TemporalType.DATE)
	public Date getSdate() {
		return sdate;
	}

	public String getShoid() {
		return shoid;
	}

	
	public void setDepartment1(Department department1) {
		this.department1 = department1;
	}

	
	public void setEmployee2(Employee employee2) {
		this.employee2 = employee2;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}

	public void setShoid(String shoid) {
		this.shoid = shoid;
	}

	@ManyToOne
	@JoinColumn(name="wsmanager")
	public Employee getEmployee1() {
		return employee1;
	}

	public void setEmployee1(Employee employee1) {
		this.employee1 = employee1;
	}

}