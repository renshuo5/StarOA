package com.fjsdfx.starerp.warehouse.model;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
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


import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.model.Employee;
import com.fjsdfx.starerp.produce.model.Preparation;
import com.fjsdfx.starerp.produce.model.Prosup;

/**
 * 
 * @author CCK
 * 配套发料表
 *
 */
@Entity
@Table(name="supsendm")
public class Supsendm implements Serializable{
	private Set<Prosup> prosups=new HashSet<Prosup>();
	@OneToMany(mappedBy="supsendm",cascade={CascadeType.ALL})
	public Set<Prosup> getProsups() {
		return prosups;
	}
	public void setProsups(Set<Prosup> prosups) {
		this.prosups = prosups;
	}
	private Set<Susgood> susgoods = new HashSet<Susgood>();
	
	@OneToMany(mappedBy="supsendm",cascade={CascadeType.ALL})
	public Set<Susgood> getSusgoods() {
		return susgoods;
	}
	public void setSusgoods(Set<Susgood> susgoods) {
		this.susgoods = susgoods;
	}
	/**
	 * 发料表号
	 */
	private int sus_id;
	/**
	 * 生产部
	 */
	private Employee proper;
	/**
	 * 车间
	 */
	private Employee wsper;
	/**
	 * 领料单位
	 */
	private Department department;
	/**
	 * 仓管员
	 */
	private Employee whmanager;
	/**
	 * 部品号
	 */
	private String partno;
	/**
	 * 本批发料
	 */
	private String batch;
	/**
	 * 日期
	 */
	private Date date;
	/**
	 * 保税产品
	 */
	private String bondedpro;
	/**
	 * 要货计划单ID
	 */
	private Preparation preparation;
	/**
	 * 对应要求的部品
	 */
	private ItemType itemType;
	/**
	 * 投料套数
	 */
	private Integer feeding;
	public Integer getFeeding() {
		return feeding;
	}
	public void setFeeding(Integer feeding) {
		this.feeding = feeding;
	}
	@ManyToOne
	@JoinColumn(name="ite_id")
	public ItemType getItemType() {
		return itemType;
	}
	public void setItemType(ItemType itemType) {
		this.itemType = itemType;
	}
	@ManyToOne
	@JoinColumn(name="pre_id")
	public Preparation getPreparation() {
		return preparation;
	}
	public void setPreparation(Preparation preparation) {
		this.preparation = preparation;
	}
	@Id
	@GeneratedValue
	public int getSus_id() {
		return sus_id;
	}
	public void setSus_id(int susId) {
		sus_id = susId;
	}
	@ManyToOne
	@JoinColumn(name="proper")
	public Employee getProper() {
		return proper;
	}
	public void setProper(Employee proper) {
		this.proper = proper;
	}
	@ManyToOne
	@JoinColumn(name="wsper")
	public Employee getWsper() {
		return wsper;
	}
	public void setWsper(Employee wsper) {
		this.wsper = wsper;
	}
	@ManyToOne
	@JoinColumn(name="dpt_id")
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	@ManyToOne
	@JoinColumn(name="whmanager")
	public Employee getWhmanager() {
		return whmanager;
	}
	public void setWhmanager(Employee whmanager) {
		this.whmanager = whmanager;
	}
	public String getPartno() {
		return partno;
	}
	public void setPartno(String partno) {
		this.partno = partno;
	}
	public String getBatch() {
		return batch;
	}
	public void setBatch(String batch) {
		this.batch = batch;
	}
	@Temporal(TemporalType.DATE)
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getBondedpro() {
		return bondedpro;
	}
	public void setBondedpro(String bondedpro) {
		this.bondedpro = bondedpro;
	}
}
