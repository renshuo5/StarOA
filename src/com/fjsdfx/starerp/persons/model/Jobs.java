package com.fjsdfx.starerp.persons.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * 职位表
 * @author wuhaibin
 *
 */
@Entity
@Table(name="jobs")
public class Jobs implements Serializable{
	private Set<Employee> employees = new HashSet<Employee>();
    
	@OneToMany(mappedBy="jobs",cascade={CascadeType.ALL})
	   public Set<Employee> getEmployees() {
		return employees;
	}

	public void setEmployees(Set<Employee> employees) {
		this.employees = employees;
	}

    /**
     * 职位ID
     */
	private Integer id;
	
	

	

	/**
	 * 职位名称
	 */
	private String jobsName;
	
	/**
	 * 职位描述
	 */
	private String jobsDes;

	@Id
	@GeneratedValue
	@Column(name="job_id")
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}


	@Column(name="job_name")
	public String getJobsName() {
		return jobsName;
	}

	public void setJobsName(String jobsName) {
		this.jobsName = jobsName;
	}

	@Column(name="job_des")
	public String getJobsDes() {
		return jobsDes;
	}

	public void setJobsDes(String jobsDes) {
		this.jobsDes = jobsDes;
	}
	
	}
