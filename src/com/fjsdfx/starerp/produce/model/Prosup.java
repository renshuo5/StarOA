package com.fjsdfx.starerp.produce.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


import com.fjsdfx.starerp.warehouse.model.Supsendm;
import com.fjsdfx.starerp.warehouse.model.Susgood;
@Entity
@Table(name = "pro_sup")
public class Prosup implements Serializable {

	Integer id;

	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * 配套发料表
	 */
	private Supsendm supsendm;
	

	/**
	 * 生产计划单
	 */
	private Prscheck prscheck;
	/**
	 *要货计划单
	 */
	private Preparation preparation;

	@ManyToOne(cascade = CascadeType.REFRESH)
	public Supsendm getSupsendm() {
		return supsendm;
	}

	public void setSupsendm(Supsendm supsendm) {
		this.supsendm = supsendm;
	}

	@ManyToOne(cascade = CascadeType.REFRESH)
	public Prscheck getPrscheck() {
		return prscheck;
	}

	public void setPrscheck(Prscheck prscheck) {
		this.prscheck = prscheck;
	}

	@ManyToOne(cascade = CascadeType.REFRESH)
	public Preparation getPreparation() {
		return preparation;
	}

	public void setPreparation(Preparation preparation) {
		this.preparation = preparation;
	}

}
