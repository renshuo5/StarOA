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
@Table(name="Proreportfive")
public class Proreportfive implements Serializable{
	
	/**
	 * 数据库ID
	 */
	private Integer fid;
	/**
	 *产量
	 */
	private Integer pronum;
	/**
	 * 不合格数
	 */
	private Integer unqnum;
	/**
	 * 首检合格数
	 */
	private Integer fiqua;
	/**
	 * 首检不合格数
	 */
	private Integer fiunq;
	/**
	 * 巡检次数
	 */
	private Integer insptime;
	/**
	 * 合格率
	 */
	private Float passrate;
	/**
	 * 日期
	 */
	private Date rtdate;
	@Id
	@GeneratedValue
	@Column(name="rpt5_id")
public Integer getFid() {
		return fid;
	}
	public void setFid(Integer fid) {
		this.fid = fid;
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
	@Column(name="fiqua")
	public Integer getFiqua() {
		return fiqua;
	}
	public void setFiqua(Integer fiqua) {
		this.fiqua = fiqua;
	}
	@Column(name="fiunq")
	public Integer getFiunq() {
		return fiunq;
	}
	public void setFiunq(Integer fiunq) {
		this.fiunq = fiunq;
	}
	@Column(name="insptime")
	public Integer getInsptime() {
		return insptime;
	}
	public void setInsptime(Integer insptime) {
		this.insptime = insptime;
	}
	@Column(name="passrate")
	public Float getPassrate() {
		return passrate;
	}
	public void setPassrate(Float passrate) {
		this.passrate = passrate;
	}
	@Column(name="rtdate")
	public Date getRtdate() {
		return rtdate;
	}
	public void setRtdate(Date rtdate) {
		this.rtdate = rtdate;
	}
}
	
	
	
	
