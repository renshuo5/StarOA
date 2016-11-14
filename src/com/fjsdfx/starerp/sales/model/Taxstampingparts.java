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
import javax.security.auth.callback.ConfirmationCallback;


import com.fjsdfx.starerp.item.model.Item;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.persons.model.Employee;
@Entity
@Table(name="taxstampingparts")
public class Taxstampingparts implements Serializable{
	
	@Id
	@GeneratedValue
	public Integer getTas_id() {
		return tas_id;
	}
	public void setTas_id(Integer tasId) {
		tas_id = tasId;
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
	public String getSizecheckaql() {
		return sizecheckaql;
	}
	public void setSizecheckaql(String sizecheckaql) {
		this.sizecheckaql = sizecheckaql;
	}
	public Integer getSizechecknum() {
		return sizechecknum;
	}
	public void setSizechecknum(Integer sizechecknum) {
		this.sizechecknum = sizechecknum;
	}
	public Integer getVischecknum1() {
		return vischecknum1;
	}
	public void setVischecknum1(Integer vischecknum1) {
		this.vischecknum1 = vischecknum1;
	}
	public Integer getVischecknum2() {
		return vischecknum2;
	}
	public void setVischecknum2(Integer vischecknum2) {
		this.vischecknum2 = vischecknum2;
	}
	public String getCheckresult1() {
		return checkresult1;
	}
	public void setCheckresult1(String checkresult1) {
		this.checkresult1 = checkresult1;
	}
	public String getCheckresult2() {
		return checkresult2;
	}
	public void setCheckresult2(String checkresult2) {
		this.checkresult2 = checkresult2;
	}
	public String getConfirm() {
		return confirm;
	}
	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
	@Temporal(TemporalType.DATE)
	public Date getRepdate() {
		return repdate;
	}
	public void setRepdate(Date repdate) {
		this.repdate = repdate;
	}
	@Temporal(TemporalType.DATE)
	public Date getMakdate() {
		return makdate;
	}
	public void setMakdate(Date makdate) {
		this.makdate = makdate;
	}
	public String getChenkresult3() {
		return chenkresult3;
	}
	public void setChenkresult3(String chenkresult3) {
		this.chenkresult3 = chenkresult3;
	}


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
	 * 冷冲件出荷单号
	 */
	private Integer tas_id;
	/**
	 * 检查员
	 */
	private Employee inspector;
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
	 * 负责人
	 */
	private Employee rper;
	
	/**
	 * 批号
	 */
	private  String batchno;
	
	/**
	 * 出货总量
	 */
    private Integer goodstotal;
    
    /**
     * 尺寸检查
     */
    private String sizecheckaql;
    
    /**
     * 尺寸检查数量
     */
    private Integer sizechecknum;
    
    /**
     * 外观检查1
     */
    private Integer vischecknum1; 
    
    /**
     * 外观检查2
     */
    private Integer vischecknum2;  
    
    /**
     * 检查结果1
     */
    private String checkresult1;
    
    /**
     * 检查结果2
     */
    private String checkresult2;
    
    /**
     * 最终判定
     */
    private String confirm;
    
    /**
     * 报告时间
     */
    private Date repdate;
    
    /**
     * 时间
     */
    private Date makdate;
    
    /**
     * 检验结果3
     */
    private String chenkresult3;
    
    private Shi1good shi1good;

	public void setShi1good(Shi1good shi1good) {
		this.shi1good = shi1good;
	}

	@OneToOne
	@JoinColumn(name="shi1gid")
	public Shi1good getShi1good(){
		return shi1good;
	}
    
}
