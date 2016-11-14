package com.fjsdfx.starerp.sales.model;

import java.io.Serializable;
import java.util.Date;
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
@Table(name = "rmtotal")
public class Rmtotal implements Serializable {
	private Set<Retgood> retgoods = new HashSet<Retgood>();
	@OneToMany(mappedBy="rmtotal",cascade={CascadeType.ALL})
	public Set<Retgood> getRetgoods() {
		return retgoods;
	}

	public void setRetgoods(Set<Retgood> retgoods) {
		this.retgoods = retgoods;
	}

	@Id
	@GeneratedValue
	public Integer getRmt_id() {
		return rmt_id;
	}

	public void setRmt_id(Integer rmtId) {
		rmt_id = rmtId;
	}

	public Integer getRnum() {
		return rnum;
	}

	public void setRnum(Integer rnum) {
		this.rnum = rnum;
	}

	public Integer getRepairnum() {
		return repairnum;
	}

	public void setRepairnum(Integer repairnum) {
		this.repairnum = repairnum;
	}

	public Integer getScrapnum() {
		return scrapnum;
	}

	public void setScrapnum(Integer scrapnum) {
		this.scrapnum = scrapnum;
	}

	public Integer getRtotal() {
		return rtotal;
	}

	public void setRtotal(Integer rtotal) {
		this.rtotal = rtotal;
	}

	public Integer getMsendnum() {
		return msendnum;
	}

	public void setMsendnum(Integer msendnum) {
		this.msendnum = msendnum;
	}

	public Integer getTsendnum() {
		return tsendnum;
	}

	public void setTsendnum(Integer tsendnum) {
		this.tsendnum = tsendnum;
	}

	public Float getTunqrate() {
		return tunqrate;
	}

	public void setTunqrate(Float tunqrate) {
		this.tunqrate = tunqrate;
	}

	public Float getMunqrate() {
		return munqrate;
	}

	public void setMunqrate(Float munqrate) {
		this.munqrate = munqrate;
	}

	public Date getRmonth() {
		return rmonth;
	}

	public void setRmonth(Date rmonth) {
		this.rmonth = rmonth;
	}

	/**
	 * 序号
	 */
	private Integer rmt_id;

	/**
	 * 退货数
	 */
	private Integer rnum;

	/**
	 * 修复合格数
	 */
	private Integer repairnum;

	/**
	 * 报废数
	 */
	private Integer scrapnum;

	/**
	 * 累计退货数
	 */
	private Integer rtotal;

	/**
	 * 本月送货数
	 */
	private Integer msendnum;

	/**
	 * 累计送货数
	 */
	private Integer tsendnum;

	/**
	 * 累计不合格率
	 */
	private Float tunqrate;

	/**
	 * 本月不合格率
	 */
	private Float munqrate;

	/**
	 * 月份
	 */
	private Date rmonth;
	/**
	 * 产品id
	 */
	private ItemType itemType;

	@ManyToOne(cascade = CascadeType.REFRESH)
	@JoinColumn(name = "ite_id")
	public ItemType getItemType() {
		return itemType;
	}

	public void setItemType(ItemType itemType) {
		this.itemType = itemType;
	}

}