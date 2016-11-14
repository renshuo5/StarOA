package com.fjsdfx.starerp.proreport.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Table;



import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name="proreportone")
public class Proreportone implements Serializable{
	
	/**
	 * 数据库ID
	 */
	private Integer prt1Id;
	/**
	 *生产台数
	 */
	private Integer pronum;
	/**
	 * 不合格台数
	 */
	private Integer unqnum;
	/**
	 * 不合格率
	 */
	private Float failurerate;
	/**
	 * 不合格内容
	 */
	private String failurecon;
	/**
	 * 时间
	 */
	private Date prtdate;
	@Id
	@GeneratedValue
	@Column(name="prt1_id")
	public Integer getPrt1Id() {
		return prt1Id;
	}
	public void setPrt1Id(Integer prt1Id) {
		this.prt1Id = prt1Id;
	}
	
	@Column(name="pronum")
	public Integer getPronum() {
		return pronum;
	}
	public void setPronum(Integer pronum) {
		this.pronum = pronum;
	}
	@Column(name="unqnum")
	public Integer getUnqnum() {
		return unqnum;
	}
	public void setUnqnum(Integer unqnum) {
		this.unqnum = unqnum;
	}
	@Column(name="failurerate")
	public Float getFailurerate() {
		return failurerate;
	}
	public void setFailurerate(Float failurerate) {
		this.failurerate = failurerate;
	}
	@Column(name="failurecon")
	public String getFailurecon() {
		return failurecon;
	}
	public void setFailurecon(String failurecon) {
		this.failurecon = failurecon;
	}
	@Column(name="prtdate")
	public Date getPrtdate() {
		return prtdate;
	}
	public void setPrtdate(Date prtdate) {
		this.prtdate = prtdate;
	}
	
	

}
