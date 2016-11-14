package com.fjsdfx.starerp.sales.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


import com.fjsdfx.starerp.item.model.Item;
import com.fjsdfx.starerp.item.model.ItemType;
import com.sun.org.apache.bcel.internal.generic.DADD;
@Entity
@Table(name="unqmessage")
public class Unqmessage implements Serializable{
	@Id
	@GeneratedValue
	public Integer getUnm_id() {
		return unm_id;
	}

	public void setUnm_id(Integer unmId) {
		unm_id = unmId;
	}

	public String getUnmcode() {
		return unmcode;
	}

	public void setUnmcode(String unmcode) {
		this.unmcode = unmcode;
	}

	public String getUnmstatus() {
		return unmstatus;
	}

	public void setUnmstatus(String unmstatus) {
		this.unmstatus = unmstatus;
	}
	@Temporal(TemporalType.DATE)   
	public Date getFdate() {
		return fdate;
	}
 
	public void setFdate(Date fdate) {
		this.fdate = fdate;
	}

	public String getBdepartment() {
		return bdepartment;
	}

	public void setBdepartment(String bdepartment) {
		this.bdepartment = bdepartment;
	}

	/**
	 * 不合格信息id（主键）
	 */
	
	private Integer unm_id;	
	
	/**
	 * 不合格编码
	 */
	private String unmcode;	
	
	/**
	 * 不合格状态
	 */
	private String unmstatus;
	
	/**
	 * 发现日期
	 */
	private Date fdate;	
	
	/**
	 * 负责部门处理情况
	 */
	private String bdepartment;
	
	/**
	 * 不合格件单号（外键）
	 */
	private Unqualified unqualified;

	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="unq_id")
	public Unqualified getUnqualified() {
		return unqualified;
	}

	public void setUnqualified(Unqualified unqualified) {
		this.unqualified = unqualified;
	}

	

	
}