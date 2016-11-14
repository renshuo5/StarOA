package com.fjsdfx.starerp.produce.model;

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

import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.model.Employee;
import com.fjsdfx.starerp.warehouse.model.Supsendm;
import com.fjsdfx.starerp.warehouse.model.Supsendm3;


/**
 * 
 * 用于“要货编制计划单”
 * 还需要用到“要货物品单”pergood来保持需要的货物信息
 * @author ptzhuf
 *
 */

@Entity
@Table(name="preparation")
public class Preparation implements Serializable {
	private Set<Supsendm> supsendms = new HashSet<Supsendm>();
	@OneToMany(mappedBy="preparation",cascade={CascadeType.ALL})
	public Set<Supsendm> getSupsendms() {
		return supsendms;
	}

	public void setSupsendms(Set<Supsendm> supsendms) {
		this.supsendms = supsendms;
	}

	private Set<Supsendm3> supsendm3s = new HashSet<Supsendm3>();
	@OneToMany(mappedBy="preparation",cascade={CascadeType.ALL})
	public Set<Supsendm3> getSupsendm3s() {
		return supsendm3s;
	}

	public void setSupsendm3s(Set<Supsendm3> supsendm3s) {
		this.supsendm3s = supsendm3s;
	}

	private Set<Pergood> pergoods=new HashSet<Pergood>();
	@OneToMany(mappedBy="preparation",cascade={CascadeType.ALL})
	public Set<Pergood> getPergoods() {
		return pergoods;
	}

	public void setPergoods(Set<Pergood> pergoods) {
		this.pergoods = pergoods;
	}

	private Set<Prscheck> prschecks=new HashSet<Prscheck>();
	@OneToMany(mappedBy="preparation",cascade={CascadeType.ALL})
	public Set<Prscheck> getPrschecks() {
		return prschecks;
	}

	public void setPrschecks(Set<Prscheck> prschecks) {
		this.prschecks = prschecks;
	}

	private Set<Accredition> accreditions = new HashSet<Accredition>();
	@OneToMany(mappedBy="preparation",cascade={CascadeType.ALL})
	public Set<Accredition> getAccreditions() {
		
		return accreditions;
	}

	public void setAccreditions(Set<Accredition> accreditions) {
		this.accreditions = accreditions;
	}
	/**
	 * id
	 */
	private Integer id;
	
	/**
	 * 编制人
	 */
	private Employee person;
	
	/**
	 * 编制单位
	 */
	private Department department;
	
	/**
	 * 编号
	 */
	private String presn;
	
	/**
	 * 编制日期
	 */
	private Date pdate;
	/**
	 * 报送日期
	 */
	private Date sdate;
	
	/**
	 * 编制领导审批
	 */
	private Employee pleader;
	
	/**
	 * 履行情况
	 */
	private String fulfillment;
	
	/**
	 * 最终确认
	 */
	private String confimation;

	/**
	 * 是否制定生产计划单
	 */
	private Integer addplan;
	
	/**
	 * 是否制定配套发料表
	 */
	private Integer addsup;

	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPresn() {
		return presn;
	}

	public void setPresn(String presn) {
		this.presn = presn;
	}

	public Date getPdate() {
		return pdate;
	}

	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}

	public Date getSdate() {
		return sdate;
	}

	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}

	public String getFulfillment() {
		return fulfillment;
	}

	public void setFulfillment(String fulfillment) {
		this.fulfillment = fulfillment;
	}

	public String getConfimation() {
		return confimation;
	}

	public void setConfimation(String confimation) {
		this.confimation = confimation;
	}

	@ManyToOne(cascade=CascadeType.REFRESH)
	public Employee getPerson() {
		return person;
	}

	public void setPerson(Employee person) {
		this.person = person;
	}
	
	@ManyToOne(cascade=CascadeType.REFRESH)
	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	@ManyToOne(cascade=CascadeType.REFRESH)
	public Employee getPleader() {
		return pleader;
	}

	public void setPleader(Employee pleader) {
		this.pleader = pleader;
	}

	public Integer getAddplan() {
		return addplan;
	}

	public void setAddplan(Integer addplan) {
		this.addplan = addplan;
	}

	public Integer getAddsup() {
		return addsup;
	}

	public void setAddsup(Integer addsup) {
		this.addsup = addsup;
	}
	
	
}
