package com.fjsdfx.starerp.produce.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import java.util.Date;

import org.aspectj.weaver.NewConstructorTypeMunger;
import org.hibernate.annotations.GenericGenerator;


import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.persons.model.Employee;
@Entity
@Table(name="changef")//生产调度表
public class ProductionSchdul implements Serializable {
    /**
     *序号
     */
	private Integer id;
	
	private String cha_no;
	
	/**
	 * 下达日期
	 */
	private Date startdate;
	
	/**
	 * 完成日期
	 */
	private Date enddate;
	
	/**
	 * 备注
	 */
	private String channote;
	
	/**
	 * 完成改机进仓数量
	 */
	private Integer competeno;
	
	/**
	 * 产品序号记录 

	 */
	private String prorecord;
	
	/**
	 * 借出数量
	 */
	private Integer bno;
	
	
	/**
	 * 原来机型 

	 */
	private ItemType itemType;
	
	/**
	 * 改为机型
	 */
	
	private ItemType itemType2;
	
	/**
	 * 车间签字  wssign 

	 */
	private Employee wssign;
	
	/**
	 * 仓库签字  whsign 

	 */
	private Employee whsign;
	
	/**
	 * 检验签字 exsign 

	 */
	
	private Employee exsign;
	
	private Employee menumake;

	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	@Temporal(TemporalType.DATE)
	public Date getStartdate() {
		return startdate;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}
	@Temporal(TemporalType.DATE)
	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	public String getChannote() {
		return channote;
	}

	public void setChannote(String channote) {
		this.channote = channote;
	}

	public Integer getCompeteno() {
		return competeno;
	}

	public void setCompeteno(Integer competeno) {
		this.competeno = competeno;
	}

	public String getProrecord() {
		return prorecord;
	}

	public void setProrecord(String prorecord) {
		this.prorecord = prorecord;
	}

	public Integer getBno() {
		return bno;
	}

	public void setBno(Integer bno) {
		this.bno = bno;
	}

	  @ManyToOne
	  @JoinColumn(name="former_pro" ,nullable=false)
	public ItemType getItemType() {
		return itemType;
	}

	public void setItemType(ItemType itemType) {
		this.itemType = itemType;
	}
	@ManyToOne
	@JoinColumn(name="to_pro",nullable=false)
	public ItemType getItemType2() {
		return itemType2;
	}

	public void setItemType2(ItemType itemType2) {
		this.itemType2 = itemType2;
	}
     @ManyToOne
     @JoinColumn(name="ws_sign")
	public Employee getWssign() {
		return wssign;
	}

	public void setWssign(Employee wssign) {
		this.wssign = wssign;
	}
     @ManyToOne
     @JoinColumn(name="wh_sign")
	public Employee getWhsign() {
		return whsign;
	}

	public void setWhsign(Employee whsign) {
		this.whsign = whsign;
	}
     
	@ManyToOne
	@JoinColumn(name="ex_sign")
	public Employee getExsign() {
		return exsign;
	}

	public void setExsign(Employee exsign) {
		this.exsign = exsign;
	}
	@ManyToOne
	@JoinColumn(name="menu_make")
	public Employee getMenumake() {
		return menumake;
	}

	public void setMenumake(Employee menumake) {
		this.menumake = menumake;
	}

	
	public String getCha_no() {
		return cha_no;
	}

	public void setCha_no(String chaNo) {
		cha_no = chaNo;
	}



	
	
	
	

}
