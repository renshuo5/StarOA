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
import com.fjsdfx.starerp.sales.model.Retgood;

/**
 * 收料通知单
 * @author WangPn
 *
 */
@Entity
@Table(name="rewinder")
public class Rewinder implements Serializable{
	private Set<Rewgood> rewgoods = new HashSet<Rewgood>();
	@OneToMany(mappedBy="rewinder",cascade={CascadeType.ALL})
	public Set<Rewgood> getRewgoods() {
		return rewgoods;
	}
	public void setRewgoods(Set<Rewgood> rewgoods) {
		this.rewgoods = rewgoods;
	}
	/**
	 * 采购
	 */
	private Employee buyerEmployee;
	/**
	 * 供货单编制日期
	 */
	private Date rew_date;
	/**
	 * 收料单号
	 */
	private Integer rew_id;
	/**
	 * 检验结果
	 */
	private String rewexamine;
	/**
	 * 检验
	 */
	private Employee rewinspector;
	/**
	 * 备注信息
	 */
	private String rewnote;
	/**
	 * 供货单位
	 */
	private String suplyu;
	/**
	 * 进仓时间
	 */
	private Date warehouseDate;
	
	/**
	 * 仓库
	 */
	private Employee whmanager;
	
	@Temporal(TemporalType.DATE)
	public Date getRew_date() {
		return rew_date;
	}
	@Id
	@GeneratedValue
	public Integer getRew_id() {
		return rew_id;
	}
	public String getRewnote() {
		return rewnote;
	}
	
	
	
	public String getSuplyu() {
		return suplyu;
	}
	@Temporal(TemporalType.DATE)
	public Date getWarehouseDate() {
		return warehouseDate;
	}
	
	
	public void setRew_date(Date rewDate) {
		rew_date = rewDate;
	}
	public void setRew_id(Integer rewId) {
		rew_id = rewId;
	}

	public void setRewnote(String rewnote) {
		this.rewnote = rewnote;
	}
	public void setSuplyu(String suplyu) {
		this.suplyu = suplyu;
	}
	public void setWarehouseDate(Date warehouseDate) {
		this.warehouseDate = warehouseDate;
	}
	public void setBuyerEmployee(Employee buyerEmployee) {
		this.buyerEmployee = buyerEmployee;
	}
	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="buyer_id")
	public Employee getBuyerEmployee() {
		return buyerEmployee;
	}
	public void setRewinspector(Employee rewinspector) {
		this.rewinspector = rewinspector;
	}
	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="spector_id")
	public Employee getRewinspector() {
		return rewinspector;
	}
	public void setWhmanager(Employee whmanager) {
		this.whmanager = whmanager;
	}
	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="wh_id")
	public Employee getWhmanager() {
		return whmanager;
	}
	public String getRewexamine() {
		return rewexamine;
	}
	public void setRewexamine(String rewexamine) {
		this.rewexamine = rewexamine;
	}
	
}
