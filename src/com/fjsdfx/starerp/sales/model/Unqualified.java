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

import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.model.Employee;
@Entity
@Table(name="unqualified")
public class Unqualified implements Serializable{
	private Set<Unqmessage> unqmessages = new HashSet<Unqmessage>();
	@OneToMany(mappedBy="unqualified",cascade={CascadeType.ALL})
	public Set<Unqmessage> getUnqmessages() {
		return unqmessages;
	}

	public void setUnqmessages(Set<Unqmessage> unqmessages) {
		this.unqmessages = unqmessages;
	}

	@Id
	@GeneratedValue
	public Integer getUnq_id() {
		return unq_id;
	}

	public void setUnq_id(Integer unqId) {
		unq_id = unqId;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	
	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="inspector_emp")
	public Employee getInspector() {
		return inspector;
	}

	public void setInspector(Employee inspector) {
		this.inspector = inspector;
	}

	@Temporal(TemporalType.DATE)
	public Date getInsdate() {
		return insdate;
	}

	public void setInsdate(Date insdate) {
		this.insdate = insdate;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	/**
	 * 不合格单号（主键）
	 */
	private Integer unq_id;	
	
	/**
	 * 检验人
	 */
	private Employee inspector; 
	
	/**
	 * 不合格数量
	 */
	private Integer num;
	
	/**
	 * 报告人
	 */
	private Employee  reportper;
	
	/**
	 * 接收人
	 */
	private Employee  recper;
	
	/**
	 * 负责人
	 */
	private Employee  rebper;

	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="reportper_emp")
	public Employee getReportper() {
		return reportper;
	}

	public void setReportper(Employee reportper) {
		this.reportper = reportper;
	}

	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="recper_emp")
	public Employee getRecper() {
		return recper;
	}

	public void setRecper(Employee recper) {
		this.recper = recper;
	}

	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="rebper_emp")	
	public Employee getRebper() {
		return rebper;
	}

	public void setRebper(Employee rebper) {
		this.rebper = rebper;
	}

	/**
	 * 接受日期
	 */
	private Date recedate;

	/**
	 * 检验日期
	 */
	private Date insdate;


	/**
	 * 处理结果复查
	 */
	private String review;
	
	
    @Temporal(TemporalType.DATE)
	public Date getRecedate() {
		return recedate;
	}

	public void setRecedate(Date recedate) {
		this.recedate = recedate;
	}

	/**
	 * 接受部门
	 */
	private	Department departmentRec;
	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="recdpt")
	
	public Department getDepartmentRec() {
		return departmentRec;
	}

	public void setDepartmentRec(Department departmentRec) {
		this.departmentRec = departmentRec;
	}
	
	/**
	 * 报告部门
	 */
	private Department departmentRep;
	
	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="rdpt")
	public Department getDepartmentRep() {
		return departmentRep;
	}

	public void setDepartmentRep(Department departmentRep) {
		this.departmentRep = departmentRep;
	}

	
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
	
	/**
	 * 退货单号
	 */	
	public Returned returned;

	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="retid")
	public Returned getReturned() {
		return returned;
	}

	public void setReturned(Returned returned) {
		this.returned = returned;
	}
	
	private Employee recheckper;
	
	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="recheckper_emp")
	public Employee getRecheckper() {
		return recheckper;
	}

	public void setRecheckper(Employee recheckper) {
		this.recheckper = recheckper;
	}
     @Temporal(TemporalType.DATE)
	public Date getRechecktime() {
		return rechecktime;
	}

	public void setRechecktime(Date rechecktime) {
		this.rechecktime = rechecktime;
	}

	private Date rechecktime;
}