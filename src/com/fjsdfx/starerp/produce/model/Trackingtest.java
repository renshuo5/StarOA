package com.fjsdfx.starerp.produce.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.model.Employee;
import com.fjsdfx.starerp.purchase.model.Testnotes;

/*
 * author JonneyChan
 * 
 * */

@Entity
public class Trackingtest  implements Serializable {
/*
 * 
 * 缺少量试通知单
 * */
	/*
     * 计划日期
     * */
	private Integer id;
	/*
	 * 六个签名人员
	 * */
	private Employee empwsr1;
	private Employee examiner1;
	private Employee empwsr2;
	private Employee examiner2;
	private Employee tryper;
	private Employee manger;
	
	/*
	 * 三个部门流程
	 * 
	 * */
	private Department whDepartment;
	private Department wsDepartment1;
	private Department wsDepartment2;
	/*
	 * 计划量试日期
	 * */
	
	private Date testdate;
  /*
   * 部件编号
   * */
	private String itempsn;
	/*
	 * 部件检验结果
	 * */
	private String examineresult;
	/*
	 * 生产过程质量情况
	 * */
	private String qualitySituation;
	
	/*
	 * 整机成品编号
	 * 
	 * */
	
	private  String propsn;
	/*
	 * 车间记录时间
	 * */
	private Date whrecordate;
	/*
	 * 车间检验时间
	 * */
	private Date whexamineDate;
	/*
	 * 成品检验情况
	 * */
	
	private String proexasitudation;
	/*
	 * 成品质量情况
	 * */
	private String proquasitudation;
	/*
	 * 成品记录时间
	 * */
	
	private Date prorecdate;
	
	/*
	 * 成品检验时间
	 * */
	private Date proexadate;
	/*
	 * 
	 * 实验机号
	 * */
	
	private String trypsn;
	/*
	 * 实验内容
	 * 
	 * */
	private String psncontent;
	/*
	 * 试验记录
	 * */
	private String prorecord;
	/*
	 * 试验日期
	 * */
	private Date trydate;
	/*
	 * 试验过程建议
	 * */
	private String tryadvice;
	/*
	 * 主管试验日期
	 * */
	private Date trymanagerdate;
	/**
	 * 
	 * 量试通知单
	 * */
	private Testnotes testnotes;
	
	/*
	 * 應適機種
	 * 
	 * */
	private ItemType itemType;
	
	@ManyToOne
	@JoinColumn(name="ite_id")
	public ItemType getItemType() {
		return itemType;
	}
	public void setItemType(ItemType itemType) {
		this.itemType = itemType;
	}
	@OneToOne
	@JoinColumn(name="notesID")
	public Testnotes getTestnotes() {
		return testnotes;
	}
	public void setTestnotes(Testnotes testnotes) {
		this.testnotes = testnotes;
	}
	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@ManyToOne
	@JoinColumn(name="wsr1_empId")
	public Employee getEmpwsr1() {
		return empwsr1;
	}
	public void setEmpwsr1(Employee empwsr1) {
		this.empwsr1 = empwsr1;
	}
	@ManyToOne
	@JoinColumn(name="exa1_empId")
	public Employee getExaminer1() {
		return examiner1;
	}
	public void setExaminer1(Employee examiner1) {
		this.examiner1 = examiner1;
	}
	@ManyToOne
	@JoinColumn(name="wsr2_empId")
	public Employee getEmpwsr2() {
		return empwsr2;
	}
	public void setEmpwsr2(Employee empwsr2) {
		this.empwsr2 = empwsr2;
	}
	@ManyToOne
	@JoinColumn(name="exa2_empId")
	public Employee getExaminer2() {
		return examiner2;
	}
	public void setExaminer2(Employee examiner2) {
		this.examiner2 = examiner2;
	}
	@ManyToOne
	@JoinColumn(name="try_empId")
	public Employee getTryper() {
		return tryper;
	}
	public void setTryper(Employee tryper) {
		this.tryper = tryper;
	}
	@ManyToOne
	@JoinColumn(name="man_empId")
	public Employee getManger() {
		return manger;
	}
	public void setManger(Employee manger) {
		this.manger = manger;
	}
	@ManyToOne
	@JoinColumn(name="wh_dptId")
	public Department getWhDepartment() {
		return whDepartment;
	}
	public void setWhDepartment(Department whDepartment) {
		this.whDepartment = whDepartment;
	}
	@ManyToOne
	@JoinColumn(name="ws1_dptId")
	public Department getWsDepartment1() {
		return wsDepartment1;
	}
	public void setWsDepartment1(Department wsDepartment1) {
		this.wsDepartment1 = wsDepartment1;
	}
	@ManyToOne
	@JoinColumn(name="ws2_dpt")
		public Department getWsDepartment2() {
		return wsDepartment2;
	}
	public void setWsDepartment2(Department wsDepartment2) {
		this.wsDepartment2 = wsDepartment2;
	}
	@Temporal(TemporalType.DATE)
	public Date getTestdate() {
		return testdate;
	}

	public void setTestdate(Date testdate) {
		this.testdate = testdate;
	}
	public String getItempsn() {
		return itempsn;
	}
	public void setItempsn(String itempsn) {
		this.itempsn = itempsn;
	}
	public String getExamineresult() {
		return examineresult;
	}
	public void setExamineresult(String examineresult) {
		this.examineresult = examineresult;
	}
	public String getQualitySituation() {
		return qualitySituation;
	}
	public void setQualitySituation(String qualitySituation) {
		this.qualitySituation = qualitySituation;
	}
	public String getPropsn() {
		return propsn;
	}
	public void setPropsn(String propsn) {
		this.propsn = propsn;
	}
	@Temporal(TemporalType.DATE)
	public Date getWhrecordate() {
		return whrecordate;
	}
	public void setWhrecordate(Date whrecordate) {
		this.whrecordate = whrecordate;
	}
	@Temporal(TemporalType.DATE)
	public Date getWhexamineDate() {
		return whexamineDate;
	}
	public void setWhexamineDate(Date whexamineDate) {
		this.whexamineDate = whexamineDate;
	}
	public String getProexasitudation() {
		return proexasitudation;
	}
	public void setProexasitudation(String proexasitudation) {
		this.proexasitudation = proexasitudation;
	}
	public String getProquasitudation() {
		return proquasitudation;
	}
	public void setProquasitudation(String proquasitudation) {
		this.proquasitudation = proquasitudation;
	}
	@Temporal(TemporalType.DATE)
	public Date getProrecdate() {
		return prorecdate;
	}
	public void setProrecdate(Date prorecdate) {
		this.prorecdate = prorecdate;
	}
	@Temporal(TemporalType.DATE)
	public Date getProexadate() {
		return proexadate;
	}
	public void setProexadate(Date proexadate) {
		this.proexadate = proexadate;
	}
	public String getTrypsn() {
		return trypsn;
	}
	public void setTrypsn(String trypsn) {
		this.trypsn = trypsn;
	}
	public String getPsncontent() {
		return psncontent;
	}
	public void setPsncontent(String psncontent) {
		this.psncontent = psncontent;
	}
	public String getProrecord() {
		return prorecord;
	}
	public void setProrecord(String prorecord) {
		this.prorecord = prorecord;
	}
	@Temporal(TemporalType.DATE)
	public Date getTrydate() {
		return trydate;
	}
	public void setTrydate(Date trydate) {
		this.trydate = trydate;
	}
	public String getTryadvice() {
		return tryadvice;
	}
	public void setTryadvice(String tryadvice) {
		this.tryadvice = tryadvice;
	}
	@Temporal(TemporalType.DATE)
	public Date getTrymanagerdate() {
		return trymanagerdate;
	}
	public void setTrymanagerdate(Date trymanagerdate) {
		this.trymanagerdate = trymanagerdate;
	}
	
	
}
