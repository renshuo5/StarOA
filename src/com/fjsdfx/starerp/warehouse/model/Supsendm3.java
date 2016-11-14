package com.fjsdfx.starerp.warehouse.model;

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

import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.produce.model.Preparation;
/**
 * 三车间发料表
 * @author CCK
 *
 */
@Entity
public class Supsendm3 implements Serializable{
	private Set<Susgood3> susgood3s = new HashSet<Susgood3>();
	@OneToMany(mappedBy="supsendm3",cascade={CascadeType.ALL})
	public Set<Susgood3> getSusgood3s() {
		return susgood3s;
	}
	public void setSusgood3s(Set<Susgood3> susgood3s) {
		this.susgood3s = susgood3s;
	}
	/**
	 * ID
	 */
	private Integer id;
	/**
	 * 产品
	 */
	private ItemType itemType;
	/**
	 * 收料车间
	 */
	private Department department;
	/**
	 * 硬件版本
	 */
	private String hawversion;
	/**
	 * 发料时间
	 */
	private Date sudate;
	/**
	 * 发料数量
	 */
	private Integer needNum;
	/**
	 * 车间确认
	 */
	private Integer worshipConfirm;
	/**
	 * 要货计划单ID
	 */
	private Preparation preparation;
	@Id
	@GeneratedValue
	@JoinColumn(name="sus3_id")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@ManyToOne
	@JoinColumn(name="dpt_id")
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	public String getHawversion() {
		return hawversion;
	}
	public void setHawversion(String hawversion) {
		this.hawversion = hawversion;
	}
	public Date getSudate() {
		return sudate;
	}
	public void setSudate(Date sudate) {
		this.sudate = sudate;
	}
	@ManyToOne
	@JoinColumn(name="ite_id")
	public ItemType getItemType() {
		return itemType;
	}
	public void setItemType(ItemType itemType) {
		this.itemType = itemType;
	}
	public Integer getNeedNum() {
		return needNum;
	}
	public void setNeedNum(Integer needNum) {
		this.needNum = needNum;
	}
	@ManyToOne
	@JoinColumn(name="pre_id")
	public Preparation getPreparation() {
		return preparation;
	}
	public void setPreparation(Preparation preparation) {
		this.preparation = preparation;
	}
	public Integer getWorshipConfirm() {
		return worshipConfirm;
	}
	public void setWorshipConfirm(Integer worshipConfirm) {
		this.worshipConfirm = worshipConfirm;
	}
}
