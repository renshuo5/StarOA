package com.fjsdfx.starerp.purchase.model;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.model.Employee;
import com.fjsdfx.starerp.produce.model.Trackingtest;

@Entity
@Table(name="testnotes")
public class Testnotes  implements Serializable{
	private Trackingtest trackingtest;
	
	@OneToOne(mappedBy="testnotes",cascade={CascadeType.ALL})
	public Trackingtest getTrackingtest() {
		return trackingtest;
	}
	public void setTrackingtest(Trackingtest trackingtest) {
		this.trackingtest = trackingtest;
	}
	/**
	 * ID
	 */
	private Integer id;
	/**
	 * 制定部门
	 */
	private Department department;
	/**
	 * 第几次提出
	 */
	private Integer tiems;
	/**
	 * 发出日期
	 */
	private Date senddate;
	/*=======================================修改=======================================*/
	/**
	 * 供应商
	 */
	private Supplierinfo supplierinfo;
	/**
	 * 品牌
	 */
	private String brand;
	/**
	 * 数量
	 */
	private Integer num;
	/*=======================================修改=======================================*/
	/**
	 * 采购经办
	 */
	private Employee purper;
	/**
	 * 经办日期
	 */
	private Date purdate;
	/**
	 * 采购要求和量试依据
	 */
	private String basis;
	/**
	 * 采购主管
	 */
	private Employee purmanper;
	

	/**
	 * 采购日期
	 */
	private Date purmdate;
	
	/**
	 * 工艺部门意见
	 
	private String quadvice;

	 * 工艺经办
	
	private Employee quaper;
	*/
	/**
	 * 工艺主管
	 */
	private Employee quamanper;
	/**
	 * 工艺日期
	 */
	private Date quadate;
	/**
	 * 检验结果
	 */
	private Boolean result;
	/**
	 * 检验报告单
	 */
	private String checkreport;
	/**
	 * 检验员
	 */
	private Employee examiner;
	/**
	 * 备注
	 */
	private String note;
	/**
	 * 样品认定ID
	 */
	private Integer samid;
	/**
	 * 是否添加了量试通知单
	 * 
	 * */
	private Integer tracktestId;
	public Integer getTracktestId() {
		return tracktestId;
	}
	public void setTracktestId(Integer tracktestId) {
		this.tracktestId = tracktestId;
	}
	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@ManyToOne(cascade=CascadeType.REFRESH)
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	public Integer getTiems() {
		return tiems;
	}
	public void setTiems(Integer tiems) {
		this.tiems = tiems;
	}
	
	@Temporal(TemporalType.DATE)
	public Date getSenddate() {
		return senddate;
	}
	public void setSenddate(Date senddate) {
		this.senddate = senddate;
	}
	
	@ManyToOne(cascade=CascadeType.REFRESH)
	public Employee getPurper() {
		return purper;
	}
	public void setPurper(Employee purper) {
		this.purper = purper;
	}
	public String getBasis() {
		return basis;
	}
	public void setBasis(String basis) {
		this.basis = basis;
	}
	
	@ManyToOne(cascade=CascadeType.REFRESH)
	public Employee getPurmanper() {
		return purmanper;
	}
	public void setPurmanper(Employee purmanper) {
		this.purmanper = purmanper;
	}
	@Temporal(TemporalType.DATE)
	public Date getPurmdate() {
		return purmdate;
	}
	public void setPurmdate(Date purmdate) {
		this.purmdate = purmdate;
	}
	@Temporal(TemporalType.DATE)
	public Date getPurdate() {
		return purdate;
	}
	public void setPurdate(Date purdate) {
		this.purdate = purdate;
	}
	/*public String getQuadvice() {
		return quadvice;
	}
	public void setQuadvice(String quadvice) {
		this.quadvice = quadvice;
	}
	
	@ManyToOne(cascade=CascadeType.REFRESH)
	public Employee getQuaper() {
		return quaper;
	}
	public void setQuaper(Employee quaper) {
		this.quaper = quaper;
	}*/
	
	@ManyToOne(cascade=CascadeType.REFRESH)
	public Employee getQuamanper() {
		return quamanper;
	}
	public void setQuamanper(Employee quamanper) {
		this.quamanper = quamanper;
	}
	
	@Temporal(TemporalType.DATE)
	public Date getQuadate() {
		return quadate;
	}
	public void setQuadate(Date quadate) {
		this.quadate = quadate;
	}
	public Boolean getResult() {
		return result;
	}
	public void setResult(Boolean result) {
		this.result = result;
	}
	public String getCheckreport() {
		return checkreport;
	}
	public void setCheckreport(String checkreport) {
		this.checkreport = checkreport;
	}
	
	@ManyToOne(cascade=CascadeType.REFRESH)
	public Employee getExaminer() {
		return examiner;
	}
	public void setExaminer(Employee examiner) {
		this.examiner = examiner;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	@ManyToOne(cascade=CascadeType.REFRESH)
	public Supplierinfo getSupplierinfo() {
		return supplierinfo;
	}
	public void setSupplierinfo(Supplierinfo supplierinfo) {
		this.supplierinfo = supplierinfo;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public Integer getSamid() {
		return samid;
	}
	public void setSamid(Integer samid) {
		this.samid = samid;
	}

}
