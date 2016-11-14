package com.fjsdfx.starerp.produce.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fjsdfx.starerp.persons.model.Employee;

@Entity
@Table(name="accredition")
public class Accredition implements Serializable {
	/**
	 * id
	 */
	private Integer id;
	
	/**
	 * 评审人
	 */
	private Employee employee;
	
	/**
	 * 要货计划单
	 */
	private Preparation preparation;
	
	/**
	 * 评审时间
	 */
	private Date adate;
	
	/**
	 * 评审内容
	 */
	private String content;

	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(cascade=CascadeType.REFRESH)
	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	@ManyToOne(cascade=CascadeType.REFRESH)
	public Preparation getPreparation() {
		return preparation;
	}

	public void setPreparation(Preparation preparation) {
		this.preparation = preparation;
	}

	public Date getAdate() {
		return adate;
	}

	public void setAdate(Date adate) {
		this.adate = adate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	
}
