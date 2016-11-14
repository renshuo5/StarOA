package com.fjsdfx.starerp.purchase.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fjsdfx.starerp.persons.model.Employee;

@Entity
@Table(name="requisitions")
public class Requisitions implements Serializable{
	private Set<Resgood> resgoods = new HashSet<Resgood>();
	@OneToMany(mappedBy="requisitions",cascade={CascadeType.ALL})
	public Set<Resgood> getResgoods() {
		return resgoods;
	}
	public void setResgoods(Set<Resgood> resgoods) {
		this.resgoods = resgoods;
	}
	/**
	 * ID
	 */
	private Integer id;
	/**
	 * 公司主管
	 */
	private Employee cmanager;
	/**
	 * 公司分管
	 */
	private Employee bmanager;
	/**
	 * 部门主管
	 */
	private Employee dmanager;
	/**
	 * 部门分管
	 */
	private Employee dpmanager;
	/**
	 * 采购员
	 */
	private Employee buyer;
	/**
	 * 合格供应商
	 */
	private Quaprolist quaprolist;
	/**
	 * 说明
	 */
	private String directions;
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
	public Employee getCmanager() {
		return cmanager;
	}
	public void setCmanager(Employee cmanager) {
		this.cmanager = cmanager;
	}
	@ManyToOne(cascade=CascadeType.REFRESH)
	public Employee getBmanager() {
		return bmanager;
	}
	public void setBmanager(Employee bmanager) {
		this.bmanager = bmanager;
	}
	@ManyToOne(cascade=CascadeType.REFRESH)
	public Employee getDmanager() {
		return dmanager;
	}
	public void setDmanager(Employee dmanager) {
		this.dmanager = dmanager;
	}
	@ManyToOne(cascade=CascadeType.REFRESH)
	public Employee getDpmanager() {
		return dpmanager;
	}
	public void setDpmanager(Employee dpmanager) {
		this.dpmanager = dpmanager;
	}
	@ManyToOne(cascade=CascadeType.REFRESH)
	public Employee getBuyer() {
		return buyer;
	}
	public void setBuyer(Employee buyer) {
		this.buyer = buyer;
	}
	@ManyToOne(cascade=CascadeType.REFRESH)
	public Quaprolist getQuaprolist() {
		return quaprolist;
	}
	public void setQuaprolist(Quaprolist quaprolist) {
		this.quaprolist = quaprolist;
	}
	public String getDirections() {
		return directions;
	}
	public void setDirections(String directions) {
		this.directions = directions;
	}
	
	public Boolean getEnter() {
		return enter;
	}
	public void setEnter(Boolean enter) {
		this.enter = enter;
	}



}
