package com.fjsdfx.starerp.warehouse.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;


import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.persons.model.Employee;

/**
 * 变异申报物品
 * 
 * @author CCK
 * 
 */

@Entity
public class Vargood implements Serializable {
	/**
	 * 部品id
	 */
	private ItemType itemType;
	/**
	 * 变异申报表id
	 */
	private Variation variation;
	/**
	 * 适用机型
	 */
	private String forstyle;
	/**
	 * 接料/入库时间
	 */
	private Date etdate;
	/**
	 * 接料/入库数量
	 */
	private Integer etno;
	/**
	 * 退换/隔离数量
	 */
	private Integer chno;
	/**
	 * id
	 */
	private int vag_id;
	/**
	 * 物料变异原因
	 */

	private String vagReason;

	/**
	 * 仓库检查
	 */
	private Employee checkNum;

	@ManyToOne
	@JoinColumn(name = "check_Num")
	public Employee getCheckNum() {
		return checkNum;
	}

	public void setCheckNum(Employee checkNum) {
		this.checkNum = checkNum;
	}

	/**
	 * 车间检查
	 * 
	 * @return
	 */
	private Employee cjcheck;
  
	@ManyToOne
	@JoinColumn(name = "cj_check")
	public Employee getCjcheck() {
		return cjcheck;
	}

	public void setCjcheck(Employee cjcheck) {
		this.cjcheck = cjcheck;
	}

	// 结束allen

	@ManyToOne
	@JoinColumn(name = "ite_id")
	public ItemType getItemType() {
		return itemType;
	}

	public void setItemType(ItemType itemType) {
		this.itemType = itemType;
	}

	@ManyToOne
	@JoinColumn(name = "var_id")
	public Variation getVariation() {
		return variation;
	}

	public void setVariation(Variation variation) {
		this.variation = variation;
	}

	public Date getEtdate() {
		return etdate;
	}

	public void setEtdate(Date etdate) {
		this.etdate = etdate;
	}

	public Integer getEtno() {
		return etno;
	}

	public void setEtno(Integer etno) {
		this.etno = etno;
	}

	public Integer getChno() {
		return chno;
	}

	public String getForstyle() {
		return forstyle;
	}

	public void setForstyle(String forstyle) {
		this.forstyle = forstyle;
	}

	public void setChno(Integer chno) {
		this.chno = chno;
	}

	@Id
	@GeneratedValue
	public int getVag_id() {
		return vag_id;
	}

	public void setVag_id(int vagId) {
		vag_id = vagId;
	}

	public String getVagReason() {
		return vagReason;
	}

	public void setVagReason(String vagReason) {
		this.vagReason = vagReason;
	}
}
