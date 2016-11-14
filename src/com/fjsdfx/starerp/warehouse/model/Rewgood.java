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
@Table(name="rewgood")
public class Rewgood implements Serializable{

	/**
	 * 保税号
	 */
	private Integer bsno;
	/**
	 * 合格数
	 */
	private Integer factno;

	/**
	 * 补品ID
	 */
	private ItemType itemType;
	/**
	 * 是否合格
	 */
	private boolean rewexamine;
	/**
	 * 收料物料单号
	 */
	private Integer rewgid;
	/**
	 * 收料单号
	 */
	private Rewinder rewinder;
	/**
	 * 数量
	 */
	private Integer rewno;
	/**
	 * 备注
	 */
	private String rewnote;
	/**
	 * 金额
	 */
	private float rewprice;

	/**
	 * 单位
	 */
	private String rewunit;
	/**
	 * 单价
	 */
	private float rewuprice;
	public Integer getBsno() {
		return bsno;
	}
	public Integer getFactno() {
		return factno;
	}
	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="ite_id")
	public ItemType getItemType() {
		return itemType;
	}
	@Id
	@GeneratedValue
	public Integer getRewgid() {
		return rewgid;
	}
	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="rew_id")
	public Rewinder getRewinder() {
		return rewinder;
	}
	public Integer getRewno() {
		return rewno;
	}
	
	public String getRewnote() {
		return rewnote;
	}
	public float getRewprice() {
		return rewprice;
	}
	public String getRewunit() {
		return rewunit;
	}
	public float getRewuprice() {
		return rewuprice;
	}
	
	public boolean isRewexamine() {
		return rewexamine;
	}
	public void setBsno(Integer bsno) {
		this.bsno = bsno;
	}
	
	public void setFactno(Integer factno) {
		this.factno = factno;
	}
	
	public void setItemType(ItemType itemType) {
		this.itemType = itemType;
	}
	
	public void setRewexamine(boolean rewexamine) {
		this.rewexamine = rewexamine;
	}
	public void setRewgid(Integer rewgid) {
		this.rewgid = rewgid;
	}
	
	public void setRewinder(Rewinder rewinder) {
		this.rewinder = rewinder;
	}
	public void setRewno(Integer rewno) {
		this.rewno = rewno;
	}
	
	public void setRewnote(String rewnote) {
		this.rewnote = rewnote;
	}
	public void setRewprice(float rewprice) {
		this.rewprice = rewprice;
	}
	public void setRewunit(String rewunit) {
		this.rewunit = rewunit;
	}
	public void setRewuprice(float rewuprice) {
		this.rewuprice = rewuprice;
	}
}
