package com.fjsdfx.starerp.warehouse.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.persons.model.Department;

@Entity
@Table(name="stoschgood")
public class Stoschgood implements Serializable{

	/**
	 * 入库调度物品ID
	 */
	private Integer id;
	/**
	 * 部品ID
	 */
	private ItemType itemType;
	/**
	 * 合格数量
	 */
	private Integer qualitynum;
	
	/**
	 * 入库数量
	 */
	private Integer stonum;
	/**
	 * 入库调度ID
	 */
	private Storescheduling storescheduling;
	/**
	 * 仓库名
	 * */
	
	private Department department;
	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	@ManyToOne
	@JoinColumn(name="item_id")
	public ItemType getItemType() {
		return itemType;
	}
	public Integer getQualitynum() {
		return qualitynum;
	}
	public Integer getStonum() {
		return stonum;
	}
	@ManyToOne
	@JoinColumn(name="sto_id")
	public Storescheduling getStorescheduling() {
		return storescheduling;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public void setItemType(ItemType itemType) {
		this.itemType = itemType;
	}
	public void setQualitynum(Integer qualitynum) {
		this.qualitynum = qualitynum;
	}
	public void setStonum(Integer stonum) {
		this.stonum = stonum;
	}
	public void setStorescheduling(Storescheduling storescheduling) {
		this.storescheduling = storescheduling;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	@ManyToOne
	@JoinColumn(name="dpt_id")
	public Department getDepartment() {
		return department;
	}
}
