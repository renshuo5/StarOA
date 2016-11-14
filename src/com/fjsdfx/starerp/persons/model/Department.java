package com.fjsdfx.starerp.persons.model;

import java.io.Serializable;
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

import com.fjsdfx.starerp.produce.model.Dailyproductionform;
import com.fjsdfx.starerp.produce.model.Discardverify;
import com.fjsdfx.starerp.produce.model.Preparation;
import com.fjsdfx.starerp.produce.model.Prscheck;
import com.fjsdfx.starerp.produce.model.Shortm;
import com.fjsdfx.starerp.produce.model.Trackingtest;


/**
 * 部门信息表
 * @author 
 *
 */
@Entity
@Table(name="department")
public class Department implements Serializable{
	
	
	
	private Set<Ytrainplan> ytrainplans2=new HashSet<Ytrainplan>();
	@OneToMany(mappedBy="withf",cascade={CascadeType.ALL})
	public Set<Ytrainplan> getYtrainplans2() {
		return ytrainplans2;
	}

	public void setYtrainplans2(Set<Ytrainplan> ytrainplans2) {
		this.ytrainplans2 = ytrainplans2;
	}

	private Set<Discardverify> discardverifies=new HashSet<Discardverify>();
	@OneToMany(mappedBy="fdpt",cascade={CascadeType.ALL})
	public Set<Discardverify> getDiscardverifies() {
		return discardverifies;
	}

	public void setDiscardverifies(Set<Discardverify> discardverifies) {
		this.discardverifies = discardverifies;
	}

	private Set<Preparation> preparations=new HashSet<Preparation>();
	
	@OneToMany(mappedBy="department",cascade={CascadeType.ALL})
	public Set<Preparation> getPreparations() {
		return preparations;
	}

	public void setPreparations(Set<Preparation> preparations) {
		this.preparations = preparations;
	}

	private Set<Prscheck> prschecks=new HashSet<Prscheck>();
	
	@OneToMany(mappedBy="department",cascade={CascadeType.ALL})
	public Set<Prscheck> getPrschecks() {
		return prschecks;
	}

	public void setPrschecks(Set<Prscheck> prschecks) {
		this.prschecks = prschecks;
	}

	private Set<Shortm> shortms=new HashSet<Shortm>();
	@OneToMany(mappedBy="department1",cascade={CascadeType.ALL})
	public Set<Shortm> getShortms() {
		return shortms;
	}

	public void setShortms(Set<Shortm> shortms) {
		this.shortms = shortms;
	}

	private Set<Trackingtest> trackingtests3=new HashSet<Trackingtest>();
	
	
	@OneToMany(mappedBy="whDepartment",cascade={CascadeType.ALL})
	public Set<Trackingtest> getTrackingtests3() {
		return trackingtests3;
	}

	public void setTrackingtests3(Set<Trackingtest> trackingtests3) {
		this.trackingtests3 = trackingtests3;
	}

	private Set<Trackingtest> trackingtests2=new HashSet<Trackingtest>();
	@OneToMany(mappedBy="wsDepartment1",cascade={CascadeType.ALL})
	public Set<Trackingtest> getTrackingtests2() {
		return trackingtests2;
	}

	public void setTrackingtests2(Set<Trackingtest> trackingtests2) {
		this.trackingtests2 = trackingtests2;
	}

	private Set<Trackingtest> trackingtests=new HashSet<Trackingtest>();
	@OneToMany(mappedBy="wsDepartment2",cascade={CascadeType.ALL})
public Set<Trackingtest> getTrackingtests() {
		return trackingtests;
	}

	public void setTrackingtests(Set<Trackingtest> trackingtests) {
		this.trackingtests = trackingtests;
	}

private Set<Dailyproductionform> dailyproductionforms = new HashSet<Dailyproductionform>();
@OneToMany(mappedBy="department",cascade={CascadeType.ALL})
	public Set<Dailyproductionform> getDailyproductionforms() {
	return dailyproductionforms;
}

public void setDailyproductionforms(
		Set<Dailyproductionform> dailyproductionforms) {
	this.dailyproductionforms = dailyproductionforms;
}

	private Set<Ytrainplan> ytrainplans = new HashSet<Ytrainplan>();
	@OneToMany(mappedBy="department",cascade={CascadeType.ALL})
	public Set<Ytrainplan> getYtrainplans() {
		return ytrainplans;
	}

	public void setYtrainplans(Set<Ytrainplan> ytrainplans) {
		this.ytrainplans = ytrainplans;
	}

	private Set<Training> trainings = new HashSet<Training>();
	@OneToMany(mappedBy="department",cascade={CascadeType.ALL})
	public Set<Training> getTrainings() {
		return trainings;
	}

	public void setTrainings(Set<Training> trainings) {
		this.trainings = trainings;
	}

	private Set<Recruitment> recruitments = new HashSet<Recruitment>();
	@OneToMany(mappedBy="department",cascade={CascadeType.ALL})
	public Set<Recruitment> getRecruitments() {
		return recruitments;
	}

	public void setRecruitments(Set<Recruitment> recruitments) {
		this.recruitments = recruitments;
	}


	
	

	/**
	 * 部门ID
	 */
	private Integer id;
	
	/**
	 * 部门名称
	 */
	private String dptName;
	
	

	/**
	 * 部门描述
	 */
	private String dptDes;
	
	/**
	 * 部门类型
	 * @return
	 */
	private Integer dptType;
	
	
	
	
	@JoinColumn(name="dpt_id")
	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@JoinColumn(name="dpt_name")
	public String getDptName() {
		return dptName;
	}

	public void setDptName(String dptName) {
		this.dptName = dptName;
	}

	@JoinColumn(name="dpt_des")
	public String getDptDes() {
		return dptDes;
	}

	public void setDptDes(String dptDes) {
		this.dptDes = dptDes;
	}

	public Integer getDptType() {
		return dptType;
	}

	public void setDptType(Integer dptType) {
		this.dptType = dptType;
	}

	
}
