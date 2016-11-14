package com.fjsdfx.starerp.produce.model;

import java.io.Serializable;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


import com.fjsdfx.starerp.item.model.ItemType;

@Entity
public class Repairproduction implements Serializable {

	private String itemTypeName;
	
	public String getItemTypeName() {
		return itemTypeName;
	}
	public void setItemTypeName(String itemTypeName) {
		this.itemTypeName = itemTypeName;
	}
	public Integer getPno() {
		return pno;
	}
	public void setPno(Integer pno) {
		this.pno = pno;
	}
	public String getRepstatus() {
		return repstatus;
	}
	public void setRepstatus(String repstatus) {
		this.repstatus = repstatus;
	}
	@Temporal(TemporalType.DATE)
	public Date getRecDate() {
		return recDate;
	}
	public void setRecDate(Date recDate) {
		this.recDate = recDate;
	}
	/**
	 * 维修数量
	 */
	private Integer pno;
	/**
	 * 维修状况
	 */
	private String repstatus;
	/**
	 * 维修时间
	 */
	private Date recDate;
	/**
	 * ID
	 */
	private Integer id;
	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
}
