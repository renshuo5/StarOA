package com.fjsdfx.starerp.persons.model;

/**
 * 培训内容
 * @author wuhaibin
 */
import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Training implements Serializable {

	/**
	 * 培训ID
	 */
	private Integer id;

	/**
	 * 部门ID
	 */
	private Department department;

	/**
	 * 培训名称
	 */
	private String traName;

	/**
	 * 培训人数
	 */
	private Integer traNumber;

	/**
	 * 开始时间
	 */
	private Date stDate;

	/**
	 * 结束时间
	 */
	private Date edDate;

	/**
	 * 是否考试
	 */
	private String exam;

	/**
	 * 讲师
	 */
	private String lecture;

	/**
	 * 培训内容
	 */
	private String tracontent;

	/**
	 * 用于查询时用的
	 * 
	 * @return
	 */
	private String dateTemp;

	public String getDateTemp() {
		return dateTemp;
	}

	@ManyToOne(cascade = CascadeType.PERSIST.MERGE)
	// persist更新 merge新建
	@JoinColumn(name = "dpt_id", nullable = true)
	public Department getDepartment() {
		return department;
	}

	// /**
	// * 关联到人员表
	// */
	// private Set<Employee> employees=new HashSet<Employee>();

	@Column(name = "eddate")
	public Date getEdDate() {
		return edDate;
	}

	@Column(name = "exam", length = 2)
	public String getExam() {
		return exam;
	}

	@Id
	@JoinColumn(name = "training")
	@GeneratedValue
	public Integer getId() {
		return id;
	}

	@Column(name = "lecture")
	public String getLecture() {
		return lecture;
	}

	@JoinColumn(name = "stdate")
	public Date getStDate() {
		return stDate;
	}

	@Column(name = "tracontent")
	public String getTracontent() {
		return tracontent;
	}

	@JoinColumn(name = "tra_name")
	public String getTraName() {
		return traName;
	}

	@JoinColumn(name = "trnumber")
	public Integer getTraNumber() {
		return traNumber;
	}

	

	public void setDateTemp(String dateTemp) {
		this.dateTemp = dateTemp;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public void setEdDate(Date edDate) {
		this.edDate = edDate;
	}

	public void setExam(String exam) {
		this.exam = exam;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setLecture(String lecture) {
		this.lecture = lecture;
	}

	public void setStDate(Date stDate) {
		this.stDate = stDate;
	}

	public void setTracontent(String tracontent) {
		this.tracontent = tracontent;
	}

	public void setTraName(String traName) {
		this.traName = traName;
	}

	public void setTraNumber(Integer traNumber) {
		this.traNumber = traNumber;
	}


	// @ManyToMany(mappedBy="training")
	// public Set<Employee> getEmployees() {
	// return employees;
	// }
	//
	// public void setEmployees(Set<Employee> employees) {
	// this.employees = employees;
	// }

}
