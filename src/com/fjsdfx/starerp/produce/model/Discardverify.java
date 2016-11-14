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
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.model.Employee;
@Entity
public class Discardverify implements Serializable{
	private Set<Discardproduction> discardproductions = new HashSet<Discardproduction>();
	@OneToMany(mappedBy="scr_id",cascade={CascadeType.ALL})
	public Set<Discardproduction> getDiscardproductions() {
		return discardproductions;
	}
	public void setDiscardproductions(Set<Discardproduction> discardproductions) {
		this.discardproductions = discardproductions;
	}
	/**
	 * 报废单号
	 */
private Integer scr_id;
/**
 * 员工id 车间负责人
 */
private Employee emp_id;
/**
 * 出废部门
 */
private Department fdpt;
///**
// * 车间负责
// */
//private Employee rdpt;
/**
 * 申请日期 

 */
private Date rdate;
/**
 * 机型
 */
private ItemType itemType;
/**
 * 意见
 */
private Discardreviewf discardreviewf;
private Discardreviews discardreviews;
private Discardreviewt discardreviewt;
@ManyToOne
public Discardreviews getDiscardreviews() {
	return discardreviews;
}
public void setDiscardreviews(Discardreviews discardreviews) {
	this.discardreviews = discardreviews;
}
@ManyToOne
public Discardreviewt getDiscardreviewt() {
	return discardreviewt;
}
public void setDiscardreviewt(Discardreviewt discardreviewt) {
	this.discardreviewt = discardreviewt;
}
@ManyToOne
public Discardreviewf getDiscardreviewf() {
	return discardreviewf;
}
public void setDiscardreviewf(Discardreviewf discardreviewf) {
	this.discardreviewf = discardreviewf;
}
@ManyToOne
@JoinColumn(name="ite_id")
public ItemType getItemType() {
	return itemType;
}
public void setItemType(ItemType itemType) {
	this.itemType = itemType;
}
@Id
@GeneratedValue
public Integer getScr_id() {
	return scr_id;
}

public void setScr_id(Integer scrId) {
	scr_id = scrId;
}

public void setEmp_id(Employee empId) {
	emp_id = empId;
}
@ManyToOne
@JoinColumn(name="fdpt")
public Department getFdpt() {
	return fdpt;
}
public void setFdpt(Department fdpt) {
	this.fdpt = fdpt;
}
@ManyToOne
@JoinColumn(name="emp_id")
public Employee getEmp_id() {
	return emp_id;
}

//public String getRdpt() {
//	return rdpt;
//}
//public void setRdpt(String rdpt) {
//	this.rdpt = rdpt;
//}
@Temporal(TemporalType.DATE)
public Date getRdate() {
	return rdate;
}
public void setRdate(Date rdate) {
	this.rdate = rdate;
}

}
