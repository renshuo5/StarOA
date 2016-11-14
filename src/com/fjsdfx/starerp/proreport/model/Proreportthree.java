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
@Table(name="Proreportthree")
public class Proreportthree implements Serializable{
	
	/**
	 * 数据库ID
	 */
	private Integer id;
	/**
	 *生产批次
	 */
	private Integer probatch;
	/**
	 *合格批次
	 */
	private Integer quabatch;
	/**
	 * 不合格批次
	 */
	private Integer unqbatch;
	/**
	 * 合格率
	 */
	private Float passrate;
	/**
	 * 不合格内容
	 */
	private String unqcon;
	/**
	 * 时间
	 */
	private Date ptdate;
	@Id
	@GeneratedValue
	@Column(name="prt3_id")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Column(name="probatch")
	public Integer getProbatch() {
		return probatch;
	}

	public void setProbatch(Integer probatch) {
		this.probatch = probatch;
	}
	@Column(name="quabatch")
	public Integer getQuabatch() {
		return quabatch;
	}
	public void setQuabatch(Integer quabatch) {
		this.quabatch = quabatch;
	}
	@Column(name="unqbatch")
	public Integer getUnqbatch() {
		return unqbatch;
	}
	public void setUnqbatch(Integer unqbatch) {
		this.unqbatch = unqbatch;
	}
	@Column(name="passrate")
	public Float getPassrate() {
		return passrate;
	}
	public void setPassrate(Float passrate) {
		this.passrate = passrate;
	}
	@Column(name="unqcon")
	public String getUnqcon() {
		return unqcon;
	}
	public void setUnqcon(String unqcon) {
		this.unqcon = unqcon;
	}
	@Column(name="ptdate")
	public Date getPtdate() {
		return ptdate;
	}
	public void setPtdate(Date ptdate) {
		this.ptdate = ptdate;
	}
}