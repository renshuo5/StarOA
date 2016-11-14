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

import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.model.Employee;

/**
 * 物料变异申报表
 * 
 * @author CCK
 * 
 */

@Entity
public class Variation implements Serializable {
	Set<Vargood> vargoods = new HashSet<Vargood>();
	@OneToMany(mappedBy="variation",cascade={CascadeType.ALL})
	public Set<Vargood> getVargoods() {
		return vargoods;
	}

	public void setVargoods(Set<Vargood> vargoods) {
		this.vargoods = vargoods;
	}

	/**
	 * id
	 */
	private int var_id;
	/**
	 * 单位主管
	 */
	private Employee umanager;
	/**
	 * 单位
	 */
	private Department dpt_id;
	/**
	 * 申报人
	 */
	private Employee appper;
	/**
	 * 申报日期
	 */
	private Date vardate;
	/**
	 * 品管意见
	 */
	private Integer quaadvice;
	/**
	 * 品管意见说明
	 */
	private String quanote;
	/**
	 * 备注
	 */
	private String varnote;

	@Id
	@GeneratedValue
	public int getVar_id() {
		return var_id;
	}

	public void setVar_id(int varId) {
		var_id = varId;
	}

	@ManyToOne
	@JoinColumn(name = "umanager")
	public Employee getUmanager() {
		return umanager;
	}

	public void setUmanager(Employee umanager) {
		this.umanager = umanager;
	}

	@ManyToOne
	@JoinColumn(name = "dpt_id")
	public Department getDpt_id() {
		return dpt_id;
	}

	public void setDpt_id(Department dptId) {
		dpt_id = dptId;
	}

	@ManyToOne
	@JoinColumn(name = "appper")
	public Employee getAppper() {
		return appper;
	}

	public void setAppper(Employee appper) {
		this.appper = appper;
	}

	public Date getVardate() {
		return vardate;
	}

	public void setVardate(Date vardate) {
		this.vardate = vardate;
	}

	public String getQuanote() {
		return quanote;
	}

	public Integer getQuaadvice() {
		return quaadvice;
	}

	public void setQuaadvice(Integer quaadvice) {
		this.quaadvice = quaadvice;
	}

	public void setQuanote(String quanote) {
		this.quanote = quanote;
	}

	public String getVarnote() {
		return varnote;
	}

	public void setVarnote(String varnote) {
		this.varnote = varnote;
	}

}
