package com.fjsdfx.starerp.persons.model;
/**
 * 人事部内部培训的关联
 * @author wuhaibin
 */
import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Emp_Train implements Serializable{

	/**
	 * 人事培训ID
	 */
	private Integer id;


	/**
	 * 培训人
	 */
	private Employee empName;
	
	/**
	 * 培训名称
	 */
	private String traName;
	

	/**
	 * 培训时间
	 */
	private Date stDate;
	
	
	@Id
	@JoinColumn(name="training")
	@GeneratedValue
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	
	@ManyToOne(cascade=CascadeType.PERSIST.MERGE)//persist更新  merge新建
	public Employee getEmpName() {
		return empName;
	}

	public void setEmpName(Employee empName) {
		this.empName = empName;
	}

	@JoinColumn(name="tra_name")
	public String getTraName() {
		return traName;
	}

	public void setTraName(String traName) {
		this.traName = traName;
	}



	@JoinColumn(name="stdate")
	public Date getStDate() {
		return stDate;
	}

	public void setStDate(Date stDate) {
		this.stDate = stDate;
	}
	
	
}
