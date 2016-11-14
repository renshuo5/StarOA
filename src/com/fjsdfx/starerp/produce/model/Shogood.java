package com.fjsdfx.starerp.produce.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;


import com.fjsdfx.starerp.item.model.ItemType;
/**
 * 缺料品
 * @author ledefe
 *
 */
@Entity
public class Shogood implements Serializable{
	/**
	 * 缺料id
	 */
	private Shortm shortm;
	/**
	 * 产品id 
	 */
	private ItemType itemType;
	/**
	 * 单位 
	 */
	private String unit; 
	/**
	 * 数量 
	 */
	private Integer num;
	/**
	 * 用途 
	 */
	private String userf;
	/**
	 * 金额
	 */
	private Float price; 
	/**
	 * 单价
	 */
	private Float uprice;
	/**
	 * shog_id 
	 */
	private Integer shog_id;
	/**
	 * 备注
	 */
	private String note;
	
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	@ManyToOne
	@JoinColumn(name="shoid")
	public Shortm getShortm() {
		return shortm;
	}
	public void setShortm(Shortm shortm) {
		this.shortm = shortm;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public String getUserf() {
		return userf;
	}
	public void setUserf(String userf) {
		this.userf = userf;
	}
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
	}
	public Float getUprice() {
		return uprice;
	}
	public void setUprice(Float uprice) {
		this.uprice = uprice;
	}
	@Id
	@GeneratedValue
	public Integer getShog_id() {
		return shog_id;
	}
	public void setShog_id(Integer shogId) {
		shog_id = shogId;
	}
	@ManyToOne
	@JoinColumn(name="ite_id")
	public ItemType getItemType() {
		return itemType;
	}
	public void setItemType(ItemType itemType) {
		this.itemType = itemType;
	}

}
