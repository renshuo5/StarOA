package com.fjsdfx.starerp.produce.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


import com.fjsdfx.starerp.item.model.ItemType;

/**
 * 要货物品
 * @author Administrator
 *
 */

@Entity
@Table(name="pergood")
public class Pergood implements Serializable {
	
	/**
	 * id
	 */
	private Integer id;
	
	/**
	 * 要货计划单id
	 */
	private Preparation preparation;
	
	/**
	 * 产品id
	 */
	private ItemType itemType;
	
	/**
	 * 数量
	 */
	private Integer preNum;
	
	/**
	 * 进仓时间
	 */
	private Date eDate;
	
	/**
	 * 备注
	 */
	private String preNote;
	
	/**
	 * 是否制定配套发料表
	 */
	private Integer addsup;
	/**
	 * 是否需要补发发料表
	 */
	private Integer isExtraSup;

	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(cascade=CascadeType.REFRESH)
	public Preparation getPreparation() {
		return preparation;
	}

	public void setPreparation(Preparation preparation) {
		this.preparation = preparation;
	}

	@ManyToOne(cascade=CascadeType.REFRESH)
	public ItemType getItemType() {
		return itemType;
	}

	public void setItemType(ItemType itemType) {
		this.itemType = itemType;
	}

	public Integer getAddsup() {
		return addsup;
	}

	public void setAddsup(Integer addsup) {
		this.addsup = addsup;
	}

	public Integer getPreNum() {
		return preNum;
	}

	public void setPreNum(Integer preNum) {
		this.preNum = preNum;
	}

	public Date geteDate() {
		return eDate;
	}

	public void seteDate(Date eDate) {
		this.eDate = eDate;
	}

	public String getPreNote() {
		return preNote;
	}

	public void setPreNote(String preNote) {
		this.preNote = preNote;
	}

	public Integer getIsExtraSup() {
		return isExtraSup;
	}

	public void setIsExtraSup(Integer isExtraSup) {
		this.isExtraSup = isExtraSup;
	}
	
	
}
