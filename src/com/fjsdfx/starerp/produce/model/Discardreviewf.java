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


import com.fjsdfx.starerp.persons.model.Employee;
@Entity
public class Discardreviewf implements Serializable{
	private Set<Discardverify> discardverifies=new HashSet<Discardverify>();
	@OneToMany(mappedBy="discardreviewf",cascade={CascadeType.ALL})
	public Set<Discardverify> getDiscardverifies() {
		return discardverifies;
	}

	public void setDiscardverifies(Set<Discardverify> discardverifies) {
		this.discardverifies = discardverifies;
	}

	/**
 * 评审号,主键	
 */
private Integer scaf_id;

//评审意见
private String advice;

//意见说明
private String scanote;

//检验员
//private Employee inspector;

//主管
private Employee manager;

//评审日期
private Date date;

public String getAdvice() {
	return advice;
}

public void setAdvice(String advice) {
	this.advice = advice;
}

public String getScanote() {
	return scanote;
}

public void setScanote(String scanote) {
	this.scanote = scanote;
}


//@ManyToOne
//
//public Employee getInspector() {
//	return inspector;
//}
//
//public void setInspector(Employee inspector) {
//	this.inspector = inspector;
//}
@ManyToOne
public Employee getManager() {
	return manager;
}

public void setManager(Employee manager) {
	this.manager = manager;
}

public Date getDate() {
	return date;
}

public void setDate(Date date) {
	this.date = date;
}
@Id
@GeneratedValue
public Integer getScaf_id() {
	return scaf_id;
}

public void setScaf_id(Integer scafId) {
	scaf_id = scafId;
}


}
