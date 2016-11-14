package com.fjsdfx.starerp.warehouse.model;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;



@Entity
@Table(name="storescheduling")
public class Storescheduling implements Serializable{
	private Set<Stoschgood> stoschgoods = new HashSet<Stoschgood>();
	
	@OneToMany(mappedBy="storescheduling",cascade={CascadeType.ALL})
	public Set<Stoschgood> getStoschgoods() {
		return stoschgoods;
	}
	public void setStoschgoods(Set<Stoschgood> stoschgoods) {
		this.stoschgoods = stoschgoods;
	}
	/**
	 * 入库调度号
	 */
	private Integer id;
	/**
	 * 申请入库时间
	 */
	private Date reqstodate;
	/**
	 * 应入库数量
	 */
	private Integer stonum;
	/**
	 * 入库编号
	 */
	private Integer storsn;
	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	@Temporal(TemporalType.DATE)
	public Date getReqstodate() {
		return reqstodate;
	}
	public Integer getStonum() {
		return stonum;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	public void setReqstodate(Date reqstodate) {
		this.reqstodate = reqstodate;
	}
	public void setStonum(Integer stonum) {
		this.stonum = stonum;
	}
	public Integer getStorsn() {
		return storsn;
	}
	public void setStorsn(Integer storsn) {
		this.storsn = storsn;
	}
	
}
