package com.fjsdfx.starerp.produce.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.persons.model.Department;

@Entity
public class Dailyproduction implements Serializable {
	/** 生产日报表详细 **/
	/*
	 * 编号
	 */
	private Integer id;
	/*
	 * 日报告单id
	 */
	private Dailyproductionform dailyproductionform;
	/*
	 * 型号规格
	 */
	private ItemType itemType;
	/*
	 * 当日（投料）
	 */
	private Integer feedDaily;
	/*
	 * 月累计（投料）
	 */
	private Integer feedMonth;
	/*
	 * 年累计（投料）
	 */
	private Integer feedYear;
	/*
	 * 当日（计划）
	 */
	private Integer planDaily;
	/*
	 * 完成率
	 */
	private Float planComplete;
	/*
	 * 当日（进仓）
	 */
	private Integer storeDaily;
	/*
	 * 月累计（进仓）
	 */
	private Integer storeMonth;
	/*
	 * 年累计（进仓）
	 */
	private Integer storeYear;
	/*
	 * 当日直通率
	 */
	private Float rateDaily;

	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(cascade = CascadeType.REFRESH)
	public Dailyproductionform getDailyproductionform() {
		return dailyproductionform;
	}

	public void setDailyproductionform(Dailyproductionform dailyproductionform) {
		this.dailyproductionform = dailyproductionform;
	}

	@ManyToOne(cascade = CascadeType.REFRESH)
	public ItemType getItemType() {
		return itemType;
	}

	public void setItemType(ItemType itemType) {
		this.itemType = itemType;
	}

	public Integer getFeedDaily() {
		return feedDaily;
	}

	public void setFeedDaily(Integer feedDaily) {
		this.feedDaily = feedDaily;
	}

	public Integer getFeedMonth() {
		return feedMonth;
	}

	public void setFeedMonth(Integer feedMonth) {
		this.feedMonth = feedMonth;
	}

	public Integer getFeedYear() {
		return feedYear;
	}

	public void setFeedYear(Integer feedYear) {
		this.feedYear = feedYear;
	}

	public Integer getPlanDaily() {
		return planDaily;
	}

	public void setPlanDaily(Integer planDaily) {
		this.planDaily = planDaily;
	}

	public Float getPlanComplete() {
		return planComplete;
	}

	public void setPlanComplete(Float planComplete) {
		this.planComplete = planComplete;
	}

	public Integer getStoreDaily() {
		return storeDaily;
	}

	public void setStoreDaily(Integer storeDaily) {
		this.storeDaily = storeDaily;
	}

	public Integer getStoreMonth() {
		return storeMonth;
	}

	public void setStoreMonth(Integer storeMonth) {
		this.storeMonth = storeMonth;
	}

	public Integer getStoreYear() {
		return storeYear;
	}

	public void setStoreYear(Integer storeYear) {
		this.storeYear = storeYear;
	}

	public Float getRateDaily() {
		return rateDaily;
	}

	public void setRateDaily(Float rateDaily) {
		this.rateDaily = rateDaily;
	}

}
