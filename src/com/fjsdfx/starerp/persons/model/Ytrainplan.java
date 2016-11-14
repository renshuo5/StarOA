package com.fjsdfx.starerp.persons.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;



/**
 *年度培训计划 
 * @author Administrator
 *
 */
@Entity
@Table(name="ytrainplan")
public class Ytrainplan implements Serializable{

	/**
	 * 培训计划ID
	 */
	private Integer id;
	
	/**
	 * 部门ID(執行單位)
	 */
	private Department department;
	
	
	/**
	 * 培训地点
	 */
	private String traddress;
	
	/**
	 * 时间安排1
	 */
	private String schdate1;
	/**
	 * 时间安排2
	 */
	private String schdate2;
	
	/**
	 * 时间安排3
	 */
	private String schdate3;
	
	/**
	 * 时间安排4
	 */
	private String schdate4;
	
	/**
	 * 拟稿
     */
	private String draftper;
	
	/**
	 * 批准
	 */
	private String appper;
	
	/**
	 * 配合单位
	 */
	private Department withf;
	
	/**
	 * 年度培训计划表名
	 * @return
	 */
	private yplanname yplanname;
	
	/**
	 * 培训内容
	 * @return
	 */
	private String content;

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	
	@Id
	@GeneratedValue
	@JoinColumn(name="ypla_id") 
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(cascade=CascadeType.PERSIST.MERGE)
	@JoinColumn(name="dpt_id",nullable=false)
	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}


	@ManyToOne(cascade=CascadeType.PERSIST.MERGE)
	public yplanname getYplanname() {
		return yplanname;
	}

	public void setYplanname(yplanname yplanname) {
		this.yplanname = yplanname;
	}

	public String getTraddress() {
		return traddress;
	}

	public void setTraddress(String traddress) {
		this.traddress = traddress;
	}

	public String getSchdate1() {
		return schdate1;
	}

	public void setSchdate1(String schdate1) {
		this.schdate1 = schdate1;
	}

	public String getSchdate2() {
		return schdate2;
	}

	public void setSchdate2(String schdate2) {
		this.schdate2 = schdate2;
	}

	public String getSchdate3() {
		return schdate3;
	}

	public void setSchdate3(String schdate3) {
		this.schdate3 = schdate3;
	}

	public String getSchdate4() {
		return schdate4;
	}

	public void setSchdate4(String schdate4) {
		this.schdate4 = schdate4;
	}

	public String getDraftper() {
		return draftper;
	}

	public void setDraftper(String draftper) {
		this.draftper = draftper;
	}

	public String getAppper() {
		return appper;
	}

	public void setAppper(String appper) {
		this.appper = appper;
	}
	@ManyToOne(cascade=CascadeType.PERSIST.MERGE)
	@JoinColumn(name="withf",nullable=false)
	public Department getWithf() {
		return withf;
	}

	public void setWithf(Department withf) {
		this.withf = withf;
	}


	
	
	}

