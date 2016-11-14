package com.fjsdfx.starerp.produce.model;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
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
public class Discardreviews implements Serializable{
	private Set<Discardverify> discardverifies=new HashSet<Discardverify>();
	@OneToMany(mappedBy="discardreviews",cascade={CascadeType.ALL})
public Set<Discardverify> getDiscardverifies() {
		return discardverifies;
	}
	public void setDiscardverifies(Set<Discardverify> discardverifies) {
		this.discardverifies = discardverifies;
	}
/**
 * 评审号,主键	
 */
private Integer scas_id;
//报废单位
//private Discardverify discardverify;
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
//领导是否审核
private Integer flag=0;
public Integer getFlag() {
	return flag;
}
public void setFlag(Integer flag) {
	this.flag = flag;
}
//@ManyToOne(cascade=CascadeType.REFRESH)
//@JoinColumn(name="scr_id")
//public Discardverify getDiscardverify() {
//	return discardverify;
//}
@Id
@GeneratedValue
public Integer getScas_id() {
	return scas_id;
}

public void setScas_id(Integer scasId) {
	scas_id = scasId;
}

public String getAdvice() {
	return advice;
}

public void setAdvice(String advice) {
	this.advice = advice;
}

//public void setDiscardverify(Discardverify discardverify) {
//	this.discardverify = discardverify;
//}



public String getScanote() {
	return scanote;
}
public void setScanote(String scanote) {
	this.scanote = scanote;
}
//@ManyToOne
//public Employee getInspector() {
//	return inspector;
//}
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
@Temporal(TemporalType.DATE)
public Date getDate() {
	return date;
}
public void setDate(Date date) {
	this.date = date;
}

}
