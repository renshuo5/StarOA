package com.fjsdfx.starerp.warehouse.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;


import com.fjsdfx.starerp.item.model.Controllerunit;
import com.fjsdfx.starerp.item.model.ControllerunitInfo;
import com.fjsdfx.starerp.item.model.ItemType;
/**
 * 三车间发料物料
 * @author CCK
 *
 */
@Entity
public class Susgood3 implements Serializable{
	/**
	 * ID
	 */
	private Integer id;
	/**
	 * 序号
	 */
	private Integer seriNum;
	/**
	 * 部品
	 */
	private ItemType itemType;
	/**
	 * 对应的配套发料表3
	 */
	private Supsendm3 supsendm3;
	/**
	 * 接口信息
	 */
	private ControllerunitInfo controllerunitInfo;
	/**
	 * 单机
	 */
	private Integer singleset;
	/**
	 * 应发数量
	 */
	private Integer needNum;
	/**
	 * 实发数量
	 */
	private Integer pracNum;
	/**
	 * 车间确认
	 */
	private Integer worshipConfirm;
	/**
	 * 是否补发品
	 */
	private Integer isExtra;
	/**
	 * 备注
	 */
	private String note;
	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@ManyToOne
	@JoinColumn(name="ite_id")
	public ItemType getItemType() {
		return itemType;
	}
	public void setItemType(ItemType itemType) {
		this.itemType = itemType;
	}
	public Integer getSingleset() {
		return singleset;
	}
	@Enumerated(EnumType.STRING)
	public ControllerunitInfo getControllerunitInfo() {
		return controllerunitInfo;
	}
	public void setControllerunitInfo(ControllerunitInfo controllerunitInfo) {
		this.controllerunitInfo = controllerunitInfo;
	}
	public void setSingleset(Integer singleset) {
		this.singleset = singleset;
	}
	public Integer getNeedNum() {
		return needNum;
	}
	public void setNeedNum(Integer needNum) {
		this.needNum = needNum;
	}
	public Integer getPracNum() {
		return pracNum;
	}
	public void setPracNum(Integer pracNum) {
		this.pracNum = pracNum;
	}
	public Integer getWorshipConfirm() {
		return worshipConfirm;
	}
	public void setWorshipConfirm(Integer worshipConfirm) {
		this.worshipConfirm = worshipConfirm;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	@ManyToOne
	@JoinColumn(name="sup_id")
	public Supsendm3 getSupsendm3() {
		return supsendm3;
	}
	public void setSupsendm3(Supsendm3 supsendm3) {
		this.supsendm3 = supsendm3;
	}
	public Integer getIsExtra() {
		return isExtra;
	}
	public void setIsExtra(Integer isExtra) {
		this.isExtra = isExtra;
	}
	public Integer getSeriNum() {
		return seriNum;
	}
	public void setSeriNum(Integer seriNum) {
		this.seriNum = seriNum;
	}
}
