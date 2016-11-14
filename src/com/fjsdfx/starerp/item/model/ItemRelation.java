package com.fjsdfx.starerp.item.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;



@Entity
public class ItemRelation implements Serializable{
	
	private Integer id;
	//生产所需部件
	private ItemType part;
	//部件数量
	private Integer partamount;
	//所生产的部品
	private ItemType pitem;
	/**
	 * 是否添加控制器
	 */
	private Integer isCon;
	/**
	 * 控制器信息
	 * */
	private ControllerunitInfo controllerunitInfo;

	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	
	@ManyToOne
	@JoinColumn(name="part_id",nullable=false)
	public ItemType getPart() {
		return part;
	}
	public Integer getPartamount() {
		return partamount;
	}
	@ManyToOne
	@JoinColumn(name="pitem_id",nullable=false)
	public ItemType getPitem() {
		return pitem;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public void setPart(ItemType part) {
		this.part = part;
	}
	public void setPartamount(Integer partamount) {
		this.partamount = partamount;
	}
	public void setPitem(ItemType pitem) {
		this.pitem = pitem;
	}
	public Integer getIsCon() {
		return isCon;
	}

	public void setIsCon(Integer isCon) {
		this.isCon = isCon;
	}

	@Enumerated(EnumType.STRING)
	public ControllerunitInfo getControllerunitInfo() {
		return controllerunitInfo;
	}

	public void setControllerunitInfo(ControllerunitInfo controllerunitInfo) {
		this.controllerunitInfo = controllerunitInfo;
	}
}
