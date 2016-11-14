package com.fjsdfx.starerp.persons.model;

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

import com.fjsdfx.starerp.produce.model.Accredition;
import com.fjsdfx.starerp.produce.model.Discardreviewf;
import com.fjsdfx.starerp.produce.model.Discardreviews;
import com.fjsdfx.starerp.produce.model.Discardreviewt;
import com.fjsdfx.starerp.produce.model.Discardverify;
import com.fjsdfx.starerp.produce.model.Preparation;
import com.fjsdfx.starerp.produce.model.ProductionSchdul;
import com.fjsdfx.starerp.produce.model.Prscheck;
import com.fjsdfx.starerp.produce.model.Shortm;
import com.fjsdfx.starerp.produce.model.Trackingtest;
/**
 * 员工信息
 *
 */
@Entity
@Table(name="employee")
public class Employee implements Serializable {
	private Set<Discardverify> discardverifies=new HashSet<Discardverify>();
	private Set<Preparation> preparations2 = new HashSet<Preparation>();

	private Set<Preparation> preparations = new HashSet<Preparation>();

	private Set<ProductionSchdul> productionSchduls4 = new HashSet<ProductionSchdul>();

	private Set<ProductionSchdul> productionSchduls3 = new HashSet<ProductionSchdul>();

	private Set<ProductionSchdul> productionSchduls2 = new HashSet<ProductionSchdul>();

	private Set<ProductionSchdul> productionSchduls = new HashSet<ProductionSchdul>();

	private Set<Prscheck> prschecks3 = new HashSet<Prscheck>();

	private Set<Prscheck> prschecks2 = new HashSet<Prscheck>();

	private Set<Prscheck> prschecks = new HashSet<Prscheck>();

	private Set<Shortm> shortms2 = new HashSet<Shortm>();

	private Set<Shortm> shortms = new HashSet<Shortm>();

	private Set<Trackingtest> trackingtests6 = new HashSet<Trackingtest>();

	private Set<Trackingtest> trackingtests5 = new HashSet<Trackingtest>();

	private Set<Trackingtest> trackingtests4 = new HashSet<Trackingtest>();

	private Set<Trackingtest> trackingtests3 = new HashSet<Trackingtest>();

	private Set<Trackingtest> trackingtests2 = new HashSet<Trackingtest>();

	private Set<Trackingtest> trackingtests = new HashSet<Trackingtest>();

	private Set<Discardreviews> discardreviews = new HashSet<Discardreviews>();

	private Set<Discardreviewt> discardreviewts = new HashSet<Discardreviewt>();

	private Set<Discardreviewf> discardreviewfs = new HashSet<Discardreviewf>();

	private Set<EmployeeRap> employeeRaps = new HashSet<EmployeeRap>();

	private Set<Accredition> accreditions = new HashSet<Accredition>();

	/**
	 * 数据库ID
	 */
	private Integer empId;

	/**
	 * 员工号ID
	 */
	private String empSn;

	/**
	 * 职位ID
	 */
	private Jobs jobs;

	/**
	 * 部门ID
	 */
	private Department department;

	/**
	 *培训ID
	 */
	private Training  training;

	/**
	 *员工姓名
	 */
	private String empName;

	/**
	 *出生年月
	 */
	private Date birdate;

	/**
	 *性别
	 */
	private String sex;

	/**
	 *状态
	 */
	
	private String status;

	/**
	 *政治面貌
	 */
	private String political;

	/**
	 *宿舍号
	 */
	private String dormitory;

	/**
	 *文化程度
	 */
	private String education;

	/**
	 *员工性质
	 */
	private String nature;

	/**
	 *进入公司时间
	 */
	private Date eDate;

	/**
	 *离开公司时间
	 */
	private Date lDate;

	/**
	 * 头像
	 */
	private String pic;
	private Integer isdel;

	

	public Integer getIsdel() {
		return isdel;
	}

	public void setIsdel(Integer isdel) {
		this.isdel = isdel;
	}

	//	/**
//	 *奖惩名称
//	 */
//	private String rapName;
//
//	/**
//	 *奖惩时间
//	 */
//	private Date rapDate;
//
//	/**
//	 *奖惩原因
//	 */
//	private String rapReason;
	/**
	 *身份证号
	 */
	private String idCardNo;

	/**
	 *培训情况
	 */
	private String trStatus;

	/**
	 *默认菜单
	 */
	private String defaultMenu;

	/**
	 *婚姻状况
	 */
	private String marStatus;

	/**
	 *联系方式
	 */
	private String phoneNo;

	/**
	 *职称
	 */
	private String jobTitle;

	@OneToMany(mappedBy = "employee", cascade = { CascadeType.ALL })
	public Set<Accredition> getAccreditions() {
		return accreditions;
	}

	@JoinColumn(name="birdate")
	public Date getBirdate() {
		return birdate;
	}

	@JoinColumn(name="defaultmenu")
	public String getDefaultMenu() {
		return defaultMenu;
	}

	@ManyToOne//persist更新  merge新建
	@JoinColumn(name="dpt_id",nullable=true)
	public Department getDepartment() {
		return department;
	}

	@OneToMany(mappedBy = "manager", cascade = { CascadeType.ALL })
	public Set<Discardreviewf> getDiscardreviewfs() {
		return discardreviewfs;
	}

	@OneToMany(mappedBy = "manager", cascade = { CascadeType.ALL })
	public Set<Discardreviews> getDiscardreviews() {
		return discardreviews;
	}

	@OneToMany(mappedBy = "manager", cascade = { CascadeType.ALL })
	public Set<Discardreviewt> getDiscardreviewts() {
		return discardreviewts;
	}

	@OneToMany(mappedBy="emp_id",cascade={CascadeType.ALL})
	public Set<Discardverify> getDiscardverifies() {
		return discardverifies;
	}

	@JoinColumn(name="dormitory")
	public String getDormitory() {
		return dormitory;
	}

	@JoinColumn(name="edate")
	public Date geteDate() {
		return eDate;
	}

	@JoinColumn(name="education")
	public String getEducation() {
		return education;
	}

	@Id
	@GeneratedValue
	@JoinColumn(name="emp_id")
	public Integer getEmpId() {
		return empId;
	}

	@OneToMany(mappedBy = "employee", cascade = { CascadeType.ALL })
	public Set<EmployeeRap> getEmployeeRaps() {
		return employeeRaps;
	}

	@JoinColumn(name="emp_name")
	public String getEmpName() {
		return empName;
	}

	@JoinColumn(name="emp_sn")
	public String getEmpSn() {
		return empSn;
	}

	@JoinColumn(name="idcardno")
	public String getIdCardNo() {
		return idCardNo;
	}

	@ManyToOne(cascade=CascadeType.PERSIST.MERGE)//persist更新  merge新建
	@JoinColumn(name="jobs_id",nullable=true)
	public Jobs getJobs() {
		return jobs;
	}

	@JoinColumn(name="jobtile")
	public String getJobTitle() {
		return jobTitle;
	}

	@JoinColumn(name="ldate")
	public Date getlDate() {
		return lDate;
	}

	@JoinColumn(name="marstatus")
	public String getMarStatus() {
		return marStatus;
	}

	@JoinColumn(name="nature")
	public String getNature() {
		return nature;
	}

	@JoinColumn(name="emp_phoneno")
	public String getPhoneNo() {
		return phoneNo;
	}

	public String getPic() {
		return pic;
	}

	@JoinColumn(name="political")
	public String getPolitical() {
		return political;
	}
	@OneToMany(mappedBy = "pleader", cascade = { CascadeType.ALL })
	public Set<Preparation> getPreparations() {
		return preparations;
	}
	@OneToMany(mappedBy = "person", cascade = { CascadeType.ALL })
	public Set<Preparation> getPreparations2() {
		return preparations2;
	}
	
	@OneToMany(mappedBy = "wssign", cascade = { CascadeType.ALL })
	public Set<ProductionSchdul> getProductionSchduls() {
		return productionSchduls;
	}
	

	@OneToMany(mappedBy = "whsign", cascade = { CascadeType.ALL })
	public Set<ProductionSchdul> getProductionSchduls2() {
		return productionSchduls2;
	}
	
	@OneToMany(mappedBy = "exsign", cascade = { CascadeType.ALL })
	public Set<ProductionSchdul> getProductionSchduls3() {
		return productionSchduls3;
	}

	@OneToMany(mappedBy = "menumake", cascade = { CascadeType.ALL })
	public Set<ProductionSchdul> getProductionSchduls4() {
		return productionSchduls4;
	}

	@OneToMany(mappedBy = "employeeAudit", cascade = { CascadeType.ALL })
	public Set<Prscheck> getPrschecks() {
		return prschecks;
	}
	
	@OneToMany(mappedBy = "employeeApprove", cascade = { CascadeType.ALL })
	public Set<Prscheck> getPrschecks2() {
		return prschecks2;
	}
		
	@OneToMany(mappedBy = "employeeEdit", cascade = { CascadeType.ALL })
	public Set<Prscheck> getPrschecks3() {
		return prschecks3;
	}

	@JoinColumn(name="sex")
	public String getSex() {
		return sex;
	}
	
	@OneToMany(mappedBy = "employee2", cascade = { CascadeType.ALL })
	public Set<Shortm> getShortms() {
		return shortms;
	}
	
	@OneToMany(mappedBy = "employee1", cascade = { CascadeType.ALL })
	public Set<Shortm> getShortms2() {
		return shortms2;
	}

	@JoinColumn(name="status")
	public String getStatus() {
		return status;
	}

	@OneToMany(mappedBy = "manger", cascade = { CascadeType.ALL })
	public Set<Trackingtest> getTrackingtests() {
		return trackingtests;
	}
	
	@OneToMany(mappedBy = "tryper", cascade = { CascadeType.ALL })
	public Set<Trackingtest> getTrackingtests2() {
		return trackingtests2;
	}
	
	@OneToMany(mappedBy = "examiner2", cascade = { CascadeType.ALL })
	public Set<Trackingtest> getTrackingtests3() {
		return trackingtests3;
	}
	
//	/**
//	 * 员工奖惩信息
//	 */
//	private EmployeeRap employeeRap;



	@OneToMany(mappedBy = "empwsr2", cascade = { CascadeType.ALL })
	public Set<Trackingtest> getTrackingtests4() {
		return trackingtests4;
	}
	

	@OneToMany(mappedBy = "examiner1", cascade = { CascadeType.ALL })
	public Set<Trackingtest> getTrackingtests5() {
		return trackingtests5;
	}

	@OneToMany(mappedBy = "empwsr1", cascade = { CascadeType.ALL })
	public Set<Trackingtest> getTrackingtests6() {
		return trackingtests6;
	}
	@ManyToOne(cascade=CascadeType.PERSIST.MERGE)
	@JoinColumn(name="training",nullable=true)
	public Training getTraining() {
		return training;
	}
	
	@JoinColumn(name="trstatus")
	public String getTrStatus() {
		return trStatus;
	}
	
	public void setAccreditions(Set<Accredition> accreditions) {
		this.accreditions = accreditions;
	}

	public void setBirdate(Date birdate) {
		this.birdate = birdate;
	}

	public void setDefaultMenu(String defaultMenu) {
		this.defaultMenu = defaultMenu;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public void setDiscardreviewfs(Set<Discardreviewf> discardreviewfs) {
		this.discardreviewfs = discardreviewfs;
	}


	public void setDiscardreviews(Set<Discardreviews> discardreviews) {
		this.discardreviews = discardreviews;
	}

	public void setDiscardreviewts(Set<Discardreviewt> discardreviewts) {
		this.discardreviewts = discardreviewts;
	}

	public void setDiscardverifies(Set<Discardverify> discardverifies) {
		this.discardverifies = discardverifies;
	}

	public void setDormitory(String dormitory) {
		this.dormitory = dormitory;
	}

	public void seteDate(Date eDate) {
		this.eDate = eDate;
	}

	public void setEducation(String education) {
		this.education = education;
	}
	
	public void setEmpId(Integer empId) {
		this.empId = empId;
	}

	public void setEmployeeRaps(Set<EmployeeRap> employeeRaps) {
		this.employeeRaps = employeeRaps;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}



	public void setEmpSn(String empSn) {
		this.empSn = empSn;
	}

	public void setIdCardNo(String idCardNo) {
		this.idCardNo = idCardNo;
	}

	public void setJobs(Jobs jobs) {
		this.jobs = jobs;
	}

	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}

	public void setlDate(Date lDate) {
		this.lDate = lDate;
	}

	public void setMarStatus(String marStatus) {
		this.marStatus = marStatus;
	}

	public void setNature(String nature) {
		this.nature = nature;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}
//	public EmployeeRap getEmployeeRap() {
//		return employeeRap;
//	}
//
//	public void setEmployeeRap(EmployeeRap employeeRap) {
//		this.employeeRap = employeeRap;
//	}

	public void setPolitical(String political) {
		this.political = political;
	}

	public void setPreparations(Set<Preparation> preparations) {
		this.preparations = preparations;
	}

	public void setPreparations2(Set<Preparation> preparations2) {
		this.preparations2 = preparations2;
	}

	public void setProductionSchduls(Set<ProductionSchdul> productionSchduls) {
		this.productionSchduls = productionSchduls;
	}

	public void setProductionSchduls2(Set<ProductionSchdul> productionSchduls2) {
		this.productionSchduls2 = productionSchduls2;
	}

	public void setProductionSchduls3(Set<ProductionSchdul> productionSchduls3) {
		this.productionSchduls3 = productionSchduls3;
	}

	public void setProductionSchduls4(Set<ProductionSchdul> productionSchduls4) {
		this.productionSchduls4 = productionSchduls4;
	}

	public void setPrschecks(Set<Prscheck> prschecks) {
		this.prschecks = prschecks;
	}

	public void setPrschecks2(Set<Prscheck> prschecks2) {
		this.prschecks2 = prschecks2;
	}

	public void setPrschecks3(Set<Prscheck> prschecks3) {
		this.prschecks3 = prschecks3;
	}

//	@JoinColumn(name="rapname")
//	public String getRapName() {
//		return rapName;
//	}
//
//	public void setRapName(String rapName) {
//		this.rapName = rapName;
//	}
//
//	@JoinColumn(name="rapdate")
//	public Date getRapDate() {
//		return rapDate;
//	}
//
//	public void setRapDate(Date rapDate) {
//		this.rapDate = rapDate;
//	}
//
//	@JoinColumn(name="rapreason")
//	public String getRapReason() {
//		return rapReason;
//	}
//	
//	public void setRapReason(String rapReason) {
//		this.rapReason = rapReason;
//	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public void setShortms(Set<Shortm> shortms) {
		this.shortms = shortms;
	}

	public void setShortms2(Set<Shortm> shortms2) {
		this.shortms2 = shortms2;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public void setTrackingtests(Set<Trackingtest> trackingtests) {
		this.trackingtests = trackingtests;
	}

	public void setTrackingtests2(Set<Trackingtest> trackingtests2) {
		this.trackingtests2 = trackingtests2;
	}
	public void setTrackingtests3(Set<Trackingtest> trackingtests3) {
		this.trackingtests3 = trackingtests3;
	}

	public void setTrackingtests4(Set<Trackingtest> trackingtests4) {
		this.trackingtests4 = trackingtests4;
	}
	
	public void setTrackingtests5(Set<Trackingtest> trackingtests5) {
		this.trackingtests5 = trackingtests5;
	}

	public void setTrackingtests6(Set<Trackingtest> trackingtests6) {
		this.trackingtests6 = trackingtests6;
	}

	public void setTraining(Training training) {
		this.training = training;
	}
	 //中单表的表名
	//设置自己方的主键名
	 //设置对方的主键名
//	@ManyToMany()
//	@JoinTable(
//			name="e_t",
//			joinColumns={@JoinColumn(name="employee_id")},
//			inverseJoinColumns={@JoinColumn(name="train_id")}
//			)
//	public Set<Training> getTraining() {
//		return training;
//	}
//
//	public void setTraining(Set<Training> training) {
//		this.training = training;
//	}

	public void setTrStatus(String trStatus) {
		this.trStatus = trStatus;
	}
	
	
}
