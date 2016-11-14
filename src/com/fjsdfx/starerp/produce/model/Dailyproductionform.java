package com.fjsdfx.starerp.produce.model;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


import com.fjsdfx.starerp.persons.model.Department;
@Entity
public class Dailyproductionform implements Serializable {
	
	private Set<Dailyproduction> dailyproductions = new HashSet<Dailyproduction>();
	
	@OneToMany(mappedBy="dailyproductionform",cascade={CascadeType.ALL})
	public Set<Dailyproduction> getDailyproductions() {
		return dailyproductions;
	}
	public void setDailyproductions(Set<Dailyproduction> dailyproductions) {
		this.dailyproductions = dailyproductions;
	}
	/**生产日报表单**/
	/*
	 * 编号
	 */
	private Integer id;
	/*
	 * 编制单位
	 */
	private Department department;
	/*
	 * 编制日期
	 */
	
	private Date date;
	/*
	 * 说明
	 */
	private String info;
@Id
  @GeneratedValue
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@ManyToOne(cascade=CascadeType.REFRESH)
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	
	@Temporal(TemporalType.DATE)
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
}
