package com.fjsdfx.starerp.sales.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


import com.fjsdfx.starerp.item.model.Item;
import com.fjsdfx.starerp.item.model.ItemType;
@Entity
@Table(name="retgood")
public class Retgood implements Serializable{
	@Id
	@GeneratedValue
	public Integer getRetgid() {
		return retgid;
	}

	public void setRetgid(Integer retgid) {
		this.retgid = retgid;
	}
	
	public Integer getRetno() {
		return retno;
	}

	public void setRetno(Integer retno) {
		this.retno = retno;
	}


	/**
	 * 退货物号（主键）
	 */
	private Integer retgid;	
	
	
	/**
	 * 数量
	 */
	private Integer retno;
	
	/**
	 * 退货单号（外键）
	 */
	private Returned returned;

	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="retid")
	public Returned getReturned() {
		return returned;
	}
	public void setReturned(Returned returned) {
		this.returned = returned;
	}

	/**
	 * 型号规格（部品名称）
	 */
	private ItemType itemType;


	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="ite_id")
	public ItemType getItemType() {
		return itemType;
	}
	public void setItemType(ItemType itemType) {
		this.itemType = itemType;
	}
	
	/**
	 * 退货分析（外键）
	 */
	private Qualityanalysis qualityanalysis;


	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="ana_id")
	public Qualityanalysis getQualityanalysis() {
		return qualityanalysis;
	}

	public void setQualityanalysis(Qualityanalysis qualityanalysis) {
		this.qualityanalysis = qualityanalysis;
	}
	
	/**
	 * 退货统计（外键）
	 */
	private Rmtotal rmtotal;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="rmt_id")
	public Rmtotal getRmtotal() {
		return rmtotal;
	}

	public void setRmtotal(Rmtotal rmtotal) {
		rmtotal = rmtotal;
	}
	

	

	
	

	
}