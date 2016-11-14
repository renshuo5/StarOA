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

import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.model.Employee;
@Entity
@Table(name="shinote2")
public class Shinote2 implements Serializable{

	private Set<Shi2good> shi2goods = new HashSet<Shi2good>();
	@OneToMany(mappedBy="shinote2",cascade={CascadeType.ALL})
	public Set<Shi2good> getShi2goods() {
		return shi2goods;
	}

	public void setShi2goods(Set<Shi2good> shi2goods) {
		this.shi2goods = shi2goods;
	}

	@Id
	@GeneratedValue
	public Integer getShi2id() {
		return shi2id;
	}

	public void setShi2id(Integer shi2Id) {
		shi2id = shi2Id;
	}

	
	@Temporal(TemporalType.DATE)
	public Date getShi2date() {
		return shi2date;
	}

	public void setShi2date(Date shi2date) {
		this.shi2date = shi2date;
	}

	public String getSbranch1() {
		return sbranch1;
	}

	public void setSbranch1(String sbranch1) {
		this.sbranch1 = sbranch1;
	}

	public String getSbranch2() {
		return sbranch2;
	}

	public void setSbranch2(String sbranch2) {
		this.sbranch2 = sbranch2;
	}

	public String getSbranch3() {
		return sbranch3;
	}

	public void setSbranch3(String sbranch3) {
		this.sbranch3 = sbranch3;
	}

	public String getRecunit() {
		return recunit;
	}

	public void setRecunit(String recunit) {
		this.recunit = recunit;
	}

	public String getRecper() {
		return recper;
	}

	public void setRecper(String recper) {
		this.recper = recper;
	}

	public String getLetrecper() {
		return letrecper;
	}

	public void setLetrecper(String letrecper) {
		this.letrecper = letrecper;
	}

	public String getRecstyle() {
		return recstyle;
	}

	public void setRecstyle(String recstyle) {
		this.recstyle = recstyle;
	}

	public String getTostation() {
		return tostation;
	}

	public void setTostation(String tostation) {
		this.tostation = tostation;
	}
	
	public Integer getTotals() {
		return totals;
	}

	public void setTotals(Integer totals) {
		this.totals = totals;
	}
	
	public String getShi2note() {
		return shi2note;
	}

	public void setShi2note(String shi2note) {
		this.shi2note = shi2note;
	}

	public String getSchper() {
		return schper;
	}

	public void setSchper(String schper) {
		this.schper = schper;
	}

	public String getStorageper() {
		return storageper;
	}

	public void setStorageper(String storageper) {
		this.storageper = storageper;
	}

	public String getSn() {
		return sn;
	}

	public void setSn(String sn) {
		this.sn = sn;
	}

	public String getRaddress() {
		return raddress;
	}

	public void setRaddress(String raddress) {
		this.raddress = raddress;
	}

	public String getRcode() {
		return rcode;
	}

	public void setRcode(String rcode) {
		this.rcode = rcode;
	}

	public String getTrno() {
		return trno;
	}

	public void setTrno(String trno) {
		this.trno = trno;
	}
	
	@Temporal(TemporalType.DATE)
	public Date getMakeDate() {
		return makeDate;
	}

	public void setMakeDate(Date makeDate) {
		this.makeDate = makeDate;
	}

	/**
	 * 发货单号
	 */
	private Integer shi2id;
	
	/**
	 * 填表人
	 */
	private Employee wper;
	
	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="wper")
	public Employee getWper() {
		return wper;
	}

	public void setWper(Employee wper) {
		this.wper = wper;
	}

	/**
	 * 实际发货时间
	 */
	private Date shi2date;
	
	/**
	 * 分公司1
	 */
	private String sbranch1;
	
	/**
	 * 分公司2
	 */
	private String sbranch2;
	
	/**
	 * 分公司3
	 */
	private  String sbranch3;
	
	/**
	 * 收货单位
	 */
	private String recunit;
	
	/**
	 * 收货人
	 */
	private String recper;
	/**
	 * 收涵人
	 */
	private String letrecper;
	
	/**
	 * 收货方式
	 */
	private String recstyle;
	/**
	 * 到站名
	 */
	private String tostation;
	
	/**
	 * 总件数
	 */
	private Integer totals;


	/**
	 * 备注
	 */
	private String shi2note;
	
	/**
	 * 调度
	 */
	private String schper;
	
	/**
	 * 储运
	 */
	private String storageper;
	
	/**
	 * 仓管
	 */
	private Employee whmger;

	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="whmget_emp")
	public Employee getWhmger() {
		return whmger;
	}

	public void setWhmger(Employee whmger) {
		this.whmger = whmger;
	}

	/**
	 * 提货人
	 */
	private  Employee delper;
	
 @ManyToOne(cascade=CascadeType.REFRESH)
 @JoinColumn(name="delper")
	public Employee getDelper() {
		return delper;
	}

	public void setDelper(Employee delper) {
		this.delper = delper;
	}

	/**
	 * 制表
	 */
	private Employee mtab;
	
	 @ManyToOne(cascade=CascadeType.REFRESH)
	 @JoinColumn(name="mtab")
	public Employee getMtab() {
		return mtab;
	}

	public void setMtab(Employee mtab) {
		this.mtab = mtab;
	}

	/**
	 * 编号
	 */
	private  String sn;
	/**
	 * 收货地址
	 */
	private String raddress;
	
	/**
	 * 邮政编码
	 */
	private String rcode;

	/**
	 * 货运单号
	 */
	private String trno;

	/**
	 * 制表时间
	 */
	private Date makeDate;

	/**
	 * 仓库名
	 */
    private Department whname;
    
    @ManyToOne(cascade=CascadeType.REFRESH)
    @JoinColumn(name="whname")
	public Department getWhname() {
		return whname;
	}

	public void setWhname(Department whname) {
		this.whname = whname;
	}
    
    
	
}
