package com.fjsdfx.starerp.sales.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


import com.fjsdfx.starerp.item.model.Item;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.persons.model.Employee;
@Entity
@Table(name="taxboard")
public class Taxboard implements Serializable{

	@Id
	@GeneratedValue
	public Integer getTax_id() {
		return tax_id;
	}

	public void setTax_id(Integer taxId) {
		tax_id = taxId;
	}

@ManyToOne(cascade=CascadeType.REFRESH)
@JoinColumn(name="inspector_emp")
	public Employee getInspector() {
		return inspector;
	}

	public void setInspector(Employee inspector) {
		this.inspector = inspector;
	}
	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="rper_emp")
	public Employee getRper() {
		return rper;
	}

	public void setRper(Employee rper) {
		this.rper = rper;
	}

	public String getUserf() {
		return userf;
	}

	public void setUserf(String userf) {
		this.userf = userf;
	}

	public String getBatchno() {
		return batchno;
	}

	public void setBatchno(String batchno) {
		this.batchno = batchno;
	}

	public Integer getGoodstotal() {
		return goodstotal;
	}

	public void setGoodstotal(Integer goodstotal) {
		this.goodstotal = goodstotal;
	}

	public String getOuterchk() {
		return outerchk;
	}

	public void setOuterchk(String outerchk) {
		this.outerchk = outerchk;
	}

	public String getIctchk() {
		return ictchk;
	}

	public void setIctchk(String ictchk) {
		this.ictchk = ictchk;
	}

	public String getServicingchk() {
		return servicingchk;
	}

	public void setServicingchk(String servicingchk) {
		this.servicingchk = servicingchk;
	}

	public String getPackingchk() {
		return packingchk;
	}

	public void setPackingchk(String packingchk) {
		this.packingchk = packingchk;
	}

	public String getLineno() {
		return lineno;
	}

	public void setLineno(String lineno) {
		this.lineno = lineno;
	}

	public String getCresult() {
		return cresult;
	}

	public void setCresult(String cresult) {
		this.cresult = cresult;
	}

	public String getDetfinally() {
		return detfinally;
	}

	public void setDetfinally(String detfinally) {
		this.detfinally = detfinally;
	}

	@Temporal(TemporalType.DATE)
	public Date getRdate() {
		return rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

	@Temporal(TemporalType.DATE)
	public Date getWdate() {
		return wdate;
	}

	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}

	public String getLineno2() {
		return lineno2;
	}

	public void setLineno2(String lineno2) {
		this.lineno2 = lineno2;
	}

	public String getCresult2() {
		return cresult2;
	}

	public void setCresult2(String cresult2) {
		this.cresult2 = cresult2;
	}

	public Integer getChecknum() {
		return checknum;
	}

	public void setChecknum(Integer checknum) {
		this.checknum = checknum;
	}
	
	/**
	 * 卡板出荷单号
	 */
	private Integer tax_id;
	
	/**
	 * 检验员
	 */
	private Employee inspector;
	
	/**
	 * 负责人
	 */
	private Employee rper;
	
	/**
	 * 产品号
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
	 * 品管确认
	 */
	private Employee quaconfirm;
	
	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="quaconfirm_emp")
	
	public Employee getQuaconfirm() {
		return quaconfirm;
	}

	public void setQuaconfirm(Employee quaconfirm) {
		this.quaconfirm = quaconfirm;
	}

	/**
	 * 适用机型
	 */
	private  String userf;
	
	/**
	 * 批号
	 */
	private String batchno;
	
	
	/**
	 * 出货总量
	 */
	private Integer goodstotal;
	
	/**
	 * 外观检验 
	 */
	private String outerchk;
	
	/**
	 * ICT测试
	 */
	private String ictchk;
	
	/**
	 * 性能检查
	 */
	private String servicingchk;
	
	/**
	 * 包装检查
	 */
	private String packingchk;
	
	/**
	 * 条形码号1
	 */
	private String lineno;
	
	/**
	 * 检验结果1
	 */
	private String cresult;
	
	/**
	 * 最终判定
	 */
	private  String detfinally;
	
	/**
	 * 报告时间
	 */
	private Date rdate;
	
	/**
	 * 时间 
	 */
	private Date wdate;
	
	/**
	 * 条形码号2
	 */
	private String lineno2;
	
	/**
	 * 检验结果2
	 */
	private String cresult2;

	/**
	 * 检查数量
	 */
	private Integer checknum;

    private Shi1good shi1good;

	public void setShi1good(Shi1good shi1good) {
		this.shi1good = shi1good;
	}

	@OneToOne
	@JoinColumn(name="shi1gid")
	public Shi1good getShi1good() {
		return shi1good;
	}
	
	
}
