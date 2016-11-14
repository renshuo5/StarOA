package com.fjsdfx.starerp.persons.model;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;


/**
 * 年度人员招聘计划表的表名
 * @author Administrator
 *
 */
@Entity
@Table(name="Yrecruitment")
public class Yrecruitment implements Serializable {
	 private Set<Recruitment> recruitments = new HashSet<Recruitment>();
	   @OneToMany(mappedBy="yrecruitment",cascade={CascadeType.ALL})
		public Set<Recruitment> getRecruitments() {
		return recruitments;
	}

	public void setRecruitments(Set<Recruitment> recruitments) {
		this.recruitments = recruitments;
	}
	/**
	 * 表名的ID
	 */
	private Integer id;
	
	/**
	 * 表名字
	 */
	private Date recruitmentName;
	
//	/**
//	 * 用于判定该表是否被用过1是被用过，0是没被用过的
//	 * @return
//	 */
//	private Integer isUser;
//	

	@Id
	@GeneratedValue
	@JoinColumn(name="id") 
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getRecruitmentName() {
		return recruitmentName;
	}

	public void setRecruitmentName(Date recruitmentName) {
		this.recruitmentName = recruitmentName;
	}


}

