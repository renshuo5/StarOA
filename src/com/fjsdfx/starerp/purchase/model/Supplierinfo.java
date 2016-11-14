package com.fjsdfx.starerp.purchase.model;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fjsdfx.starerp.persons.model.Employee;

@Entity
@Table(name="supplierinfo")
public class Supplierinfo implements Serializable{
	private Set<Testnotes> testnotes = new HashSet<Testnotes>();
	@OneToMany(mappedBy="supplierinfo",cascade={CascadeType.ALL})
	public Set<Testnotes> getTestnotes() {
		return testnotes;
	}
	public void setTestnotes(Set<Testnotes> testnotes) {
		this.testnotes = testnotes;
	}
	private Set<Supidentified> supidentifieds = new HashSet<Supidentified>();
	@OneToMany(mappedBy="supplierinfo",cascade={CascadeType.ALL})
	public Set<Supidentified> getSupidentifieds() {
		return supidentifieds;
	}
	public void setSupidentifieds(Set<Supidentified> supidentifieds) {
		this.supidentifieds = supidentifieds;
	}
	private Set<Samidentified> samidentifieds = new HashSet<Samidentified>();
	@OneToMany(mappedBy="supplierinfo",cascade={CascadeType.ALL})
	public Set<Samidentified> getSamidentifieds() {
		return samidentifieds;
	}
	public void setSamidentifieds(Set<Samidentified> samidentifieds) {
		this.samidentifieds = samidentifieds;
	}
	/**
	 * ID
	 */
	private Integer id;
	/**
	 * 填表人
	 */
	private Employee wper;
	/**
	 * 审核人
	 */
	private Employee checkper;
	/**
	 * 中文名称
	 */
	private String supcname;
	/**
	 * 英文名称
	 */
	private String supename;
	/**
	 * 地址
	 */
	private String address;
	/**
	 * 联系电话
	 */
	private String phone;
	/**
	 * 联系人业务
	 */
	private String business;
	/**
	 * 联系人质量
	 */
	private String quality;
	/**
	 * 联系人技术
	 */
	private String tech;
	/*--------------------------------修改--------------------------------*/
	/**
	 * 产品名称
	 */
	private  String itemname;
	/**
	 * 型号规格
	 */
	private  String itemtypename;
	/**
	 * 年产量
	 */
	private  Integer output;
	/**
	 * 质量情况
	 */
	private String qsituation;
	/**
	 * 主要用户
	 */
	private String muser;
	/**
	 * 供货能力
	 */
	private String availability;
	/**
	 * 供货周期
	 */
	private String supcycle;
	/*--------------------------------修改--------------------------------*/
	/**
	 * 产品取证情况
	 */
	private String obtain;
	/**
	 * 企业质量管理情况
	 */
	private String quamger;
	/**
	 * 企业管理获奖情况
	 */
	private String award;
	/**
	 * 填写日期
	 */
	private Date wdate;
	/**
	 * 审核日期
	 */
	private Date checkdate;
	/**
	 * 备注
	 */
	private String notes;
	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@ManyToOne(cascade=CascadeType.REFRESH)
	public Employee getWper() {
		return wper;
	}
	public void setWper(Employee wper) {
		this.wper = wper;
	}
	@ManyToOne(cascade=CascadeType.REFRESH)
	public Employee getCheckper() {
		return checkper;
	}
	public void setCheckper(Employee checkper) {
		this.checkper = checkper;
	}
	public String getSupcname() {
		return supcname;
	}
	public void setSupcname(String supcname) {
		this.supcname = supcname;
	}
	public String getSupename() {
		return supename;
	}
	public void setSupename(String supename) {
		this.supename = supename;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBusiness() {
		return business;
	}
	public void setBusiness(String business) {
		this.business = business;
	}
	public String getQuality() {
		return quality;
	}
	public void setQuality(String quality) {
		this.quality = quality;
	}
	public String getTech() {
		return tech;
	}
	public void setTech(String tech) {
		this.tech = tech;
	}
	public String getObtain() {
		return obtain;
	}
	public void setObtain(String obtain) {
		this.obtain = obtain;
	}
	public String getQuamger() {
		return quamger;
	}
	public void setQuamger(String quamger) {
		this.quamger = quamger;
	}
	public String getAward() {
		return award;
	}
	public void setAward(String award) {
		this.award = award;
	}
	@Temporal(TemporalType.DATE)
	public Date getWdate() {
		return wdate;
	}
	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}
	@Temporal(TemporalType.DATE)
	public Date getCheckdate() {
		return checkdate;
	}
	public void setCheckdate(Date checkdate) {
		this.checkdate = checkdate;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	public String getItemname() {
		return itemname;
	}
	public void setItemname(String itemname) {
		this.itemname = itemname;
	}
	public String getItemtypename() {
		return itemtypename;
	}
	public void setItemtypename(String itemtypename) {
		this.itemtypename = itemtypename;
	}
	public Integer getOutput() {
		return output;
	}
	public void setOutput(Integer output) {
		this.output = output;
	}
	public String getQsituation() {
		return qsituation;
	}
	public void setQsituation(String qsituation) {
		this.qsituation = qsituation;
	}
	public String getMuser() {
		return muser;
	}
	public void setMuser(String muser) {
		this.muser = muser;
	}
	public String getAvailability() {
		return availability;
	}
	public void setAvailability(String availability) {
		this.availability = availability;
	}
	public String getSupcycle() {
		return supcycle;
	}
	public void setSupcycle(String supcycle) {
		this.supcycle = supcycle;
	}
	
	
}
