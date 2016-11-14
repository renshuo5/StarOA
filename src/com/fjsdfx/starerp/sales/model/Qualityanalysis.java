package com.fjsdfx.starerp.sales.model;

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

import com.fjsdfx.starerp.item.model.ItemType;
@Entity
@Table(name="qualityanalysis")
public class Qualityanalysis implements Serializable{
	private Set<Retgood> retgoods = new HashSet<Retgood>();
	@OneToMany(mappedBy="qualityanalysis",cascade={CascadeType.ALL})
	public Set<Retgood> getRetgoods() {
		return retgoods;
	}

	public void setRetgoods(Set<Retgood> retgoods) {
		this.retgoods = retgoods;
	}

	@Id
	@GeneratedValue
	public Integer getAna_id() {
		return ana_id;
	}

	public void setAna_id(Integer anaId) {
		ana_id = anaId;
	}

	public Integer getRnum() {
		return rnum;
	}

	public void setRnum(Integer rnum) {
		this.rnum = rnum;
	}

	public Integer getSnum() {
		return snum;
	}

	public void setSnum(Integer snum) {
		this.snum = snum;
	}



	public String getMainfault() {
		return mainfault;
	}

	public void setMainfault(String mainfault) {
		this.mainfault = mainfault;
	}

	public String getAnalysis() {
		return analysis;
	}

	public void setAnalysis(String analysis) {
		this.analysis = analysis;
	}

	public String getMeasures() {
		return measures;
	}

	public void setMeasures(String measures) {
		this.measures = measures;
	}



	/**
	 * 分析表号
	 */
	private Integer ana_id;
	
	/**
	 * 退货数
	 */
	private Integer rnum;

	/**
	 * 送货数
	 */
	private Integer snum;
	
	/**
	 * 主要故障现象
	 */
	private String mainfault;
	
	/**
	 * 原因分析
	 */
	private String analysis;

	/**
	 * 对策措施
	 */
	private String measures;



	/**
	 * 产品id 
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
	
}
	