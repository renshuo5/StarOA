package com.fjsdfx.starerp.purchase.model;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fjsdfx.starerp.persons.model.Employee;

@Entity
@Table(name="purorder")
public class Purorder implements Serializable{
	private Set<Purgood> purgoods = new HashSet<Purgood>();
	@OneToMany(mappedBy="purorder",cascade={CascadeType.ALL})
	public Set<Purgood> getPurgoods() {
		return purgoods;
	}
	public void setPurgoods(Set<Purgood> purgoods) {
		this.purgoods = purgoods;
	}
	/**
	 * ID
	 */
	private Integer id;
	/**
	 * 采购单编号
	 */
	private String pno;
	/**
	 * 审批
	 */
	private Employee approval;
	/**
	 * 审核
	 */
	private Employee audit;
	/**
	 * 经办
	 */
	private Employee handing;
	/**
	 * 合格供应商
	 */
	private Quaprolist quaprolist;
	/**
	 * 厂商编号
	 */
	private String firm;
	/**
	 * 订购日期
	 */
	private Date purdate;
	/**
	 * 附注
	 */
	private String pnote;
	/**
	 * 特殊要求传真
	 */
	private Boolean srep;
	/**
	 * 供应商确认
	 */
	private String purconfirm;
	/**
	 * 入库判断
	 */
	private Boolean enter;
	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@ManyToOne(cascade=CascadeType.REFRESH)
	public Employee getApproval() {
		return approval;
	}
	public void setApproval(Employee approval) {
		this.approval = approval;
	}
	
	@ManyToOne(cascade=CascadeType.REFRESH)
	public Employee getAudit() {
		return audit;
	}
	public void setAudit(Employee audit) {
		this.audit = audit;
	}
	
	@ManyToOne(cascade=CascadeType.REFRESH)
	public Employee getHanding() {
		return handing;
	}
	public void setHanding(Employee handing) {
		this.handing = handing;
	}
	
	@ManyToOne(cascade=CascadeType.REFRESH)
	public Quaprolist getQuaprolist() {
		return quaprolist;
	}
	public void setQuaprolist(Quaprolist quaprolist) {
		this.quaprolist = quaprolist;
	}
	public String getFirm() {
		return firm;
	}
	public void setFirm(String firm) {
		this.firm = firm;
	}
	@Temporal(TemporalType.DATE)
	public Date getPurdate() {
		return purdate;
	}
	public void setPurdate(Date purdate) {
		this.purdate = purdate;
	}
	public String getPnote() {
		return pnote;
	}
	public void setPnote(String pnote) {
		this.pnote = pnote;
	}
	public Boolean getSrep() {
		return srep;
	}
	public void setSrep(Boolean srep) {
		this.srep = srep;
	}
	public String getPurconfirm() {
		return purconfirm;
	}
	public void setPurconfirm(String purconfirm) {
		this.purconfirm = purconfirm;
	}
	public String getPno() {
		return pno;
	}
	public void setPno(String pno) {
		this.pno = pno;
	}


	public Boolean getEnter() {
		return enter;
	}
	public void setEnter(Boolean enter) {
		this.enter = enter;
	}

}
