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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fjsdfx.starerp.persons.model.Employee;
@Entity
@Table(name="returned")
public class Returned implements Serializable{

	private Set<Unqualified> unqualifieds = new HashSet<Unqualified>();
	@OneToMany(mappedBy="returned",cascade={CascadeType.ALL})
	public Set<Unqualified> getUnqualifieds() {
		return unqualifieds;
	}

	public void setUnqualifieds(Set<Unqualified> unqualifieds) {
		this.unqualifieds = unqualifieds;
	}

	private Set<Retgood> retgoods = new HashSet<Retgood>();
	@OneToMany(mappedBy="returned",cascade={CascadeType.ALL})
	public Set<Retgood> getRetgoods() {
		return retgoods;
	}

	public void setRetgoods(Set<Retgood> retgoods) {
		this.retgoods = retgoods;
	}

	/**
	 * 不合格单填写   0：返工；1：填写不合格单；2：返工复检；3：复检合格
	 */
	private String buhege;

	/**
	 * 客户名称
	 */
	private String customern ;

	/**
	 * 品工部处理意见报废或返工 0:表示报废;1:表示返工;2:表示返工合格
	 */
	private String deals;


	/**
	 * 品工处理意见
	 */
	private String qualityadvice;

	/**
	 * 品工部验收时间
	 */
	private Date qualitydate;

	

	/**
	 * 主管
	 */
	private Employee qualitymanager;

	/**
	 * 备注
	 */
	private String qualitynote;


	
	/**
	 * 退货时间
	 */
	private Date retdate;

	/**
	 * 主键
	 */
	private Integer retid;

	/**
	 * 退货叙述
	 */
	private String retnote;

	/**
	 * 签收人
	 */
	private Employee signatory;

	/**
	 * 出单人
	 */
	private Employee signper;

	/**
	 * 编批号（退货单号）
	 */
	private String sn;

	/**
     * 用来记录退货单号
     */
	private String unqualify_id;

	/**
	 * 签收时间
	 */
	private Date whradate;
	
    /**
	 * 仓库接受
	 */
	private String whreceive;

	public String getBuhege() {
		return buhege;
	}

    public String getCustomern() {
		return customern;
	}

	public String getDeals() {
		return deals;
	}


	public String getQualityadvice() {
		return qualityadvice;
	}


	@Temporal(TemporalType.DATE)
	public Date getQualitydate() {
		return qualitydate;
	}
	@ManyToOne(cascade=CascadeType.REFRESH)
    @JoinColumn(name="qualitymanager")
	public Employee getQualitymanager() {
		return qualitymanager;
	}


	public String getQualitynote() {
		return qualitynote;
	}
	
	@Temporal(TemporalType.DATE)
	public Date getRetdate() {
		return retdate;
	}

	@Id
	@GeneratedValue
	public Integer getRetid() {
		return retid;
	}
	public String getRetnote() {
		return retnote;
	}

	@ManyToOne(cascade=CascadeType.REFRESH)
    @JoinColumn(name="signatory")
	public Employee getSignatory() {
		return signatory;
	}


	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="signper")
	public Employee getSignper() {
		return signper;
	}

	public String getSn() {
		return sn;
	}

	public String getUnqualify_id() {
		return unqualify_id;
	}

	@Temporal(TemporalType.DATE)
	public Date getWhradate() {
		return whradate;
	}

	public String getWhreceive() {
		return whreceive;
	}

	public void setBuhege(String buhege) {
		this.buhege = buhege;
	}

	public void setCustomern(String customern) {
		this.customern = customern;
	}

	public void setDeals(String deals) {
		this.deals = deals;
	}


	

	public void setQualityadvice(String qualityadvice) {
		this.qualityadvice = qualityadvice;
	}
	public void setQualitydate(Date qualitydate) {
		this.qualitydate = qualitydate;
	}
	
	public void setQualitymanager(Employee qualitymanager) {
		this.qualitymanager = qualitymanager;
	}

	public void setQualitynote(String qualitynote) {
		this.qualitynote = qualitynote;
	}


	public void setRetdate(Date retdate) {
		this.retdate = retdate;
	}
	public void setRetid(Integer retid) {
		this.retid = retid;
	}

	public void setRetnote(String retnote) {
		this.retnote = retnote;
	}
	public void setSignatory(Employee signatory) {
		this.signatory = signatory;
	}
	public void setSignper(Employee signper) {
		this.signper = signper;
	}

	public void setSn(String sn) {
		this.sn = sn;
	}

    public void setUnqualify_id(String unqualifyId) {
		unqualify_id = unqualifyId;
	}
	public void setWhradate(Date whradate) {
		this.whradate = whradate;
	}

	public void setWhreceive(String whreceive) {
		this.whreceive = whreceive;
	}
	
	
	
}