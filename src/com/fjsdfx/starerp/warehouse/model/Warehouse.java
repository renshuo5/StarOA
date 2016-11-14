package com.fjsdfx.starerp.warehouse.model;

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

import org.hibernate.engine.Cascade;


import com.fjsdfx.starerp.item.model.Item;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.persons.model.Employee;
@Entity
@Table(name="warehouse")
public class Warehouse implements Serializable{
	
	
	/**
	 * 生产时间
	 */
	private  Date dateOfManufacture;
	/**
	 * 部品ID
	 */
	private ItemType itemType;
	/**
	 * 本月累计
	 */
	private Integer mtotal;
	
	/**
	 * 产品序列号
	 */
	private String prno;
	
	/**
	 * 检验人
	 * 
	 */
	private String productionAcceptance;
	
	/**
	 * 生产单位
	 */
	private String prunit;
	/**
	 * 进仓单号
	 */
	private Integer war_id;

	/**
	 * 进仓日期
	 */
	private Date warehouseDate;
	
	/**
	 * 仓库名
	 */
	private String warname;
	

	/**
	 * 数量
	 */
	private Integer warno;
	
	/**
	 * 生协号
	 */
	private String warsn;
	

	/**
	 * 仓库验收人
	 */
	private Employee whmg;
	
	/**
	 * 说明
	 */
	private String whnote;

	/**
	 * 生产部验收人
	 */
	private Employee winpector;

	/**
	 * 生产部
	 */
	private Integer wpro;
	
	/**
	 * 年度累计
	 */
	private Integer ytotal;


	@Temporal(TemporalType.DATE)
	public Date getDateOfManufacture() {
		return dateOfManufacture;
	}
	
	
	@ManyToOne(cascade=CascadeType.REFRESH)
	public ItemType getItemType() {
		return itemType;
	}
	
	
	public Integer getMtotal() {
		return mtotal;
	}
	
	public String getPrno() {
		return prno;
	}
	
	public String getProductionAcceptance() {
		return productionAcceptance;
	}

	public String getPrunit() {
		return prunit;
	}

	@Id
	@GeneratedValue
	public Integer getWar_id() {
		return war_id;
	}

	@Temporal(TemporalType.DATE)
	public Date getWarehouseDate() {
		return warehouseDate;
	}

	public String getWarname() {
		return warname;
	}


	public Integer getWarno() {
		return warno;
	}

	public String getWarsn() {
		return warsn;
	}

	

	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="wh_id")
	public Employee getWhmg() {
		return whmg;
	}

	public String getWhnote() {
		return whnote;
	}

	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="winpector_id")
	public Employee getWinpector() {
		return winpector;
	}
	

	public Integer getWpro() {
		return wpro;
	}

	public Integer getYtotal() {
		return ytotal;
	}

	public void setDateOfManufacture(Date dateOfManufacture) {
		this.dateOfManufacture = dateOfManufacture;
	}
	
	public void setItemType(ItemType itemType) {
		this.itemType = itemType;
	}

	public void setMtotal(Integer mtotal) {
		this.mtotal = mtotal;
	}

	public void setPrno(String prno) {
		this.prno = prno;
	}

	public void setProductionAcceptance(String productionAcceptance) {
		this.productionAcceptance = productionAcceptance;
	}
	
	public void setPrunit(String prunit) {
		this.prunit = prunit;
	}

	public void setWar_id(Integer warId) {
		war_id = warId;
	}

	public void setWarehouseDate(Date warehouseDate) {
		this.warehouseDate = warehouseDate;
	}

	public void setWarname(String warname) {
		this.warname = warname;
	}

	public void setWarno(Integer warno) {
		this.warno = warno;
	}
	
	public void setWarsn(String warsn) {
		this.warsn = warsn;
	}

	public void setWhmg(Employee whmg) {
		this.whmg = whmg;
	}

	public void setWhnote(String whnote) {
		this.whnote = whnote;
	}

	public void setWinpector(Employee winpector) {
		this.winpector = winpector;
	}

	public void setWpro(Integer wpro) {
		this.wpro = wpro;
	}

	public void setYtotal(Integer ytotal) {
		this.ytotal = ytotal;
	}
	
}

