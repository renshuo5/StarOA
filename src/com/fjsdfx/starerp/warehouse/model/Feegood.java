package com.fjsdfx.starerp.warehouse.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


import com.fjsdfx.starerp.item.model.Item;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.persons.model.Department;


@Entity
@Table(name="feegood")
public class Feegood implements Serializable{
	
	/**
	 * 保税号
	 */
	private Integer bsno;

	/**
	 * 确认实际数量 
	 */
	private Boolean confirmnum;

	public Boolean getConfirmnum() {
		return confirmnum;
	}

	public void setConfirmnum(Boolean confirmnum) {
		this.confirmnum = confirmnum;
	}
	/**
	 * 仓库名
	 */
	private Department department;
	/**
	 * 检查结果
	 */
	private boolean exresult;
	/**
	 * 合格数量
	 */
	private Integer factno;
	/**
	 * 进货单号
	 */
	private Feedexamine feedexamine;
	/**
	 * 备注
	 */
	private String fnote;
	/**
	 * 货单数量
	 */
	private Integer fpnum;
	/**
	 * id
	 */
	private Integer id;
	/**
	 * 部品ID
	 */
	private ItemType itemType;

	public Integer getBsno() {
		return bsno;
	}
	
	@ManyToOne
	@JoinColumn(name="dep_id")
	public Department getDepartment() {
		return department;
	}
	public Integer getFactno() {
		return factno;
	}
	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="feed_id")
	public Feedexamine getFeedexamine() {
		return feedexamine;
	}
	public String getFnote() {
		return fnote;
	}
	public Integer getFpnum() {
		return fpnum;
	}
	
	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="item_id")
	public ItemType getItemType() {
		return itemType;
	}
	public void setBsno(Integer bsno) {
		this.bsno = bsno;
	}
	
	public void setDepartment(Department department) {
		this.department = department;
	}
	public void setFactno(Integer factno) {
		this.factno = factno;
	}
	public void setFeedexamine(Feedexamine feedexamine) {
		this.feedexamine = feedexamine;
	}
	public void setFnote(String fnote) {
		this.fnote = fnote;
	}
	public void setFpnum(Integer fpnum) {
		this.fpnum = fpnum;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public void setItemType(ItemType itemType) {
		this.itemType = itemType;
	}


	public boolean isExresult() {
		return exresult;
	}

	public void setExresult(boolean exresult) {
		this.exresult = exresult;
	}
	
}
