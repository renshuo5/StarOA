package com.fjsdfx.starerp.warehouse.model;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fjsdfx.starerp.persons.model.Employee;
import com.fjsdfx.starerp.purchase.model.Quaprolist;

@Entity
@Table(name="feedexamine")
public class Feedexamine implements Serializable{

	private Set<Feegood> feegoods = new HashSet<Feegood>();
	@OneToMany(mappedBy="feedexamine",cascade={CascadeType.ALL})
	public Set<Feegood> getFeegoods() {
		return feegoods;
	}

	public void setFeegoods(Set<Feegood> feegoods) {
		this.feegoods = feegoods;
	}

	/**
	 * 入库状态
	 */
	private String estatus;
	/**
	 *进货单号
	 */
	private Integer fee_id;
	/**
	 * 采购
	 */
	private Employee feebuyer;
	/**
	 * 日期
	 */
	private Date feeDate;
	/**
	 * 类别
	 */
	private String feestyle;
	/**
	 * 检验
	 */
	private Employee finspector;
	/**
	 * 来源
	 */
	private String fromt;
	
	/**
	 * 订单号
	 */
	private String orderno;
	/**
	 * 供应商
	 */
	private Quaprolist  supplier;
	/**
	 * 进仓时间
	 */
	private Date warehouseDate;
	
	/**
	 * 仓库
	 */
	private Employee whmanager;
	/**
	 * 仓库2
	 */
	private Employee whmanager2;
	/**
	 * 是否核对数量
	 */
	private Boolean confirm;

	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="wh2_id")
	public Employee getWhmanager2() {
		return whmanager2;
	}

	public void setWhmanager2(Employee whmanager2) {
		this.whmanager2 = whmanager2;
	}

	

	public Boolean getConfirm() {
		return confirm;
	}

	public void setConfirm(Boolean confirm) {
		this.confirm = confirm;
	}

	public String getEstatus() {
		return estatus;
	}

	@Id
	@GeneratedValue
	public Integer getFee_id() {
		return fee_id;
	}
	
	@Temporal(TemporalType.DATE)
	public Date getFeeDate() {
		return feeDate;
	}
	public String getFeestyle() {
		return feestyle;
	}
	public String getFromt() {
		return fromt;
	}
	public String getOrderno() {
		return orderno;
	}
	@Temporal(TemporalType.DATE)
	public Date getWarehouseDate() {
		return warehouseDate;
	}
	public void setEstatus(String estatus) {
		this.estatus = estatus;
	}
	
	public void setFee_id(Integer feeId) {
		fee_id = feeId;
	}
	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="buyer_id")
	public Employee getFeebuyer() {
		return feebuyer;
	}

	public void setFeebuyer(Employee feebuyer) {
		this.feebuyer = feebuyer;
	}

	public void setFeeDate(Date feeDate) {
		this.feeDate = feeDate;
	}
	public void setFeestyle(String feestyle) {
		this.feestyle = feestyle;
	}
	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="spec_id")
	public Employee getFinspector() {
		return finspector;
	}

	public void setFinspector(Employee finspector) {
		this.finspector = finspector;
	}

	public void setFromt(String fromt) {
		this.fromt = fromt;
	}
	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}
	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="sup_id")
	public Quaprolist getSupplier() {
		return supplier;
	}

	public void setSupplier(Quaprolist supplier) {
		this.supplier = supplier;
	}

	public void setWarehouseDate(Date warehouseDate) {
		this.warehouseDate = warehouseDate;
	}

	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="wh_id")
	public Employee getWhmanager() {
		return whmanager;
	}

	public void setWhmanager(Employee whmanager) {
		this.whmanager = whmanager;
	}
}
