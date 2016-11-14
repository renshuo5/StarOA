package com.fjsdfx.starerp.produce.action;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.fjsdfx.starerp.security.model.User;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.context.SecurityContextHolder;

import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.persons.action.DepartmentAction;
import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.model.Employee;
import com.fjsdfx.starerp.persons.service.DepartmentService;
import com.fjsdfx.starerp.persons.service.EmployeeService;
import com.fjsdfx.starerp.produce.model.Prscheck;
import com.fjsdfx.starerp.produce.model.Trackingtest;
import com.fjsdfx.starerp.produce.service.TrackingtestService;
import com.fjsdfx.starerp.purchase.model.Testnotes;
import com.fjsdfx.starerp.purchase.service.TestnotesService;
import com.mysql.jdbc.log.Log4JLogger;
import com.opensymphony.xwork2.ActionSupport;

public class TrackingtestAction  extends ActionSupport{

	private Department department;
	private DepartmentService departmentService;
	private List<Department> departments;
	private Trackingtest trackingtest;
	private TrackingtestService trackingtestService;
	private Employee employee;
	private EmployeeService employeeService;
	private PagerModel pm;
	private Testnotes testnotes;
	private TestnotesService testnotesService;
	private Integer trackingtestId;
	private Integer testnotesId;
	private String status;
	private List<String> strings;
	private Integer sl;
 
    
	private Logger logger=LoggerFactory.getLogger(TrackingtestAction.class);
	
	public Integer getSl() {
		return sl;
	}
	public void setSl(Integer sl) {
		this.sl = sl;
	}
	/*
	 * 三/五车间审核用到的字段
	 * */
	private String itempsn;
	private String qualitySituation;
	private String examineresult;
	private Date whexamineDate;
	private Date whrecordate;
	private User auditUser;
	private Integer empwsr1empId;
	private Integer examiner1empId;
private User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	
	/*
	 * 
	 * 一车间审核用到的字段
	 * 
	 * */
	private String propsn;
	private String proexasitudation;
	private String proquasitudation;
	private Date proexadate;
	private Date prorecdate;

	private Integer empwsr2empId;
	private Integer examiner2empId;

	/*
	 * 品工检验用到的字段
	 * */
	
	private String tryadvice;
	private String prorecord;
	private String psncontent;
	private Date trydate;
	private Date trymanagerdate;
	private String trypsn;
	
	private Integer tryerempId;
	private Integer mangerempId;
	
	
	public String getTryadvice() {
		return tryadvice;
	}
	public void setTryadvice(String tryadvice) {
		this.tryadvice = tryadvice;
	}
	public String getProrecord() {
		return prorecord;
	}
	public void setProrecord(String prorecord) {
		this.prorecord = prorecord;
	}
	public String getPsncontent() {
		return psncontent;
	}
	public void setPsncontent(String psncontent) {
		this.psncontent = psncontent;
	}
	public Date getTrydate() {
		return trydate;
	}
	public void setTrydate(Date trydate) {
		this.trydate = trydate;
	}
	public Date getTrymanagerdate() {
		return trymanagerdate;
	}
	public void setTrymanagerdate(Date trymanagerdate) {
		this.trymanagerdate = trymanagerdate;
	}
	public String getTrypsn() {
		return trypsn;
	}
	public void setTrypsn(String trypsn) {
		this.trypsn = trypsn;
	}
	public Integer getTryerempId() {
		return tryerempId;
	}
	public void setTryerempId(Integer tryerempId) {
		this.tryerempId = tryerempId;
	}
	public Integer getMangerempId() {
		return mangerempId;
	}
	public void setMangerempId(Integer mangerempId) {
		this.mangerempId = mangerempId;
	}
	public String getPropsn() {
		return propsn;
	}
	public void setPropsn(String propsn) {
		this.propsn = propsn;
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
	public Date getProexadate() {
		return proexadate;
	}
	public void setProexadate(Date proexadate) {
		this.proexadate = proexadate;
	}
	public Date getProrecdate() {
		return prorecdate;
	}
	public void setProrecdate(Date prorecdate) {
		this.prorecdate = prorecdate;
	}
	public Integer getEmpwsr2empId() {
		return empwsr2empId;
	}
	public void setEmpwsr2empId(Integer empwsr2empId) {
		this.empwsr2empId = empwsr2empId;
	}
	public Integer getExaminer2empId() {
		return examiner2empId;
	}
	public void setExaminer2empId(Integer examiner2empId) {
		this.examiner2empId = examiner2empId;
	}
	public String getItempsn() {
		return itempsn;
	}
	public void setItempsn(String itempsn) {
		this.itempsn = itempsn;
	}
	public String getQualitySituation() {
		return qualitySituation;
	}
	public void setQualitySituation(String qualitySituation) {
		this.qualitySituation = qualitySituation;
	}
	public String getExamineresult() {
		return examineresult;
	}
	public void setExamineresult(String examineresult) {
		this.examineresult = examineresult;
	}
	public Date getWhexamineDate() {
		return whexamineDate;
	}
	public void setWhexamineDate(Date whexamineDate) {
		this.whexamineDate = whexamineDate;
	}
	public Date getWhrecordate() {
		return whrecordate;
	}
	public void setWhrecordate(Date whrecordate) {
		this.whrecordate = whrecordate;
	}
	public Integer getTestnotesId() {
		return testnotesId;
	}
	public void setTestnotesId(Integer testnotesId) {
		this.testnotesId = testnotesId;
	}
	public Integer getTrackingtestId() {
		return trackingtestId;
	}
	public void setTrackingtestId(Integer trackingtestId) {
		this.trackingtestId = trackingtestId;
	}
	public Testnotes getTestnotes() {
		return testnotes;
	}
	public void setTestnotes(Testnotes testnotes) {
		this.testnotes = testnotes;
	}
	public TestnotesService getTestnotesService() {
		return testnotesService;
	}
	@Resource
	public void setTestnotesService(TestnotesService testnotesService) {
		this.testnotesService = testnotesService;
	}
	public PagerModel getPm() {
		return pm;
	}
	public void setPm(PagerModel pm) {
		this.pm = pm;
	}
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	public DepartmentService getDepartmentService() {
		return departmentService;
	}
	@Resource
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}
	public Trackingtest getTrackingtest() {
		return trackingtest;
	}
	public void setTrackingtest(Trackingtest trackingtest) {
		this.trackingtest = trackingtest;
	}
	public TrackingtestService getTrackingtestService() {
		return trackingtestService;
	}
	@Resource
	public void setTrackingtestService(TrackingtestService trackingtestService) {
		this.trackingtestService = trackingtestService;
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public EmployeeService getEmployeeService() {
		return employeeService;
	}
	@Resource
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}
	
	public List<Department> getDepartments() {
		return departments;
	}
	public void setDepartments(List<Department> departments) {
		this.departments = departments;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
	public String getStatus() {
		return status;
	}
	public void setStrings(List<String> strings) {
		this.strings = strings;
	}
	public List<String> getStrings() {
		return strings;
	}
	public void setAuditUser(User auditUser) {
		this.auditUser = auditUser;
	}
	public User getAuditUser() {
		return auditUser;
	}
	public void setExaminer1empId(Integer examiner1empId) {
		this.examiner1empId = examiner1empId;
	}
	public Integer getExaminer1empId() {
		return examiner1empId;
	}
	public void setEmpwsr1empId(Integer empwsr1empId) {
		this.empwsr1empId = empwsr1empId;
	}
	public Integer getEmpwsr1empId() {
		return empwsr1empId;
	}
	public void setLogger(Logger logger) {
		this.logger = logger;
	}
	public Logger getLogger() {
		return logger;
	}

	
	//添加量试跟踪单
	public String add(){
		
	
		//testnotes=testnotesService.findById(Testnotes.class, 1);
		//System.out.println("---------"+testnotes.getSupplierinfo().getItemtypename()+"------========"+testnotes.getSupplierinfo().getItemname()+"-=-=-=-=-=-=-=--"+testnotes.getSupplierinfo().getSupcname());
	/*	trackingtestService.saveAndRefresh(trackingtest);
		testnotes=trackingtest.getTestnotes();
		testnotes.setTracktestId(1);
		testnotesService.saveOrUpdate(testnotes);*/
		
		trackingtestService.savetrackingtestAndupdatetestnotes(trackingtest);
		logger.warn("User ="+currentUser.getId()+"add trackingtest"+trackingtest.getId());
		return "pub_add_success";
	}
	public String add_input(){
		
		
		testnotes=testnotesService.findById(Testnotes.class, testnotesId);
		departments=departmentService.findByHql("from Department o where o.dptType<>1");
	
		return "add_input";	
	}
	//全部列表
	public String list(){

	
		pm=trackingtestService.getPagerDesc(Trackingtest.class);
		return "list";
	}
	//审核列表
	public String audit_list(){
		
		
		pm=trackingtestService.getPagerDesc(Trackingtest.class, "where o.examiner1.empId is  null or o.examiner2.empId is  null or o.manger.empId is null");
		System.out.println("-------------"+pm.getDatas().size());
		
		return "audit_list";
	}
	public String quaudit_list(){
		
		//pm=trackingtestService.findByHql("frome Trackingtest o where o.examiner1.empId is null , o.examiner2.empId and o.tryper.empId is not null");
		pm=trackingtestService.getPagerDesc(Trackingtest.class, "where o.examiner1.empId is not null and o.examiner2.empId is not null and o.tryper.empId is null");
		return "audit_list";
	}
	//用于跳转至整机审核页面
	public String proaudit_input(){
		 
			auditUser=currentUser;
		  trackingtest=trackingtestService.findById(Trackingtest.class, trackingtestId);
		
		return "proaudit_input";
	}
	//添加整机审核信息
	public String proaudit(){
		
		trackingtest=trackingtestService.findById(Trackingtest.class, trackingtestId);
		if (empwsr2empId!=null) {
			trackingtest.setEmpwsr2(employeeService.findById(Employee.class, empwsr2empId));
		}
		if (examiner2empId!=null) {
			trackingtest.setExaminer2(employeeService.findById(Employee.class, examiner2empId));
		}
		trackingtest.setProexadate(proexadate);
		trackingtest.setProexasitudation(proexasitudation);
		trackingtest.setPropsn(propsn);
		trackingtest.setProquasitudation(proquasitudation);
	//	trackingtest.setProrecord(prorecord);
		trackingtest.setProrecdate(prorecdate);
		trackingtestService.update(trackingtest);
		logger.warn("ws1 audit trackingtest.id="+trackingtestId+"and pro audit user="+empwsr2empId+"exa audit user"+examiner2empId);
		return "return_audit_list";
	}
	//跳转至半成品审核
	public String wsaudit_input(){
		 
		  auditUser=currentUser;
		//	System.out.println(" audit empName====="+auditUser.getEmployee().getEmpName());
		 trackingtest=trackingtestService.findById(Trackingtest.class, trackingtestId);
		
		return "wsaudit_input";
	}
	//添加半成品审核信息
	public String wsaudit(){

		trackingtest=trackingtestService.findById(Trackingtest.class, trackingtestId);
		if (empwsr1empId!=null) {
			trackingtest.setEmpwsr1(employeeService.findById(Employee.class, empwsr1empId));
		}
		if (examiner1empId!=null) {
			trackingtest.setExaminer1(employeeService.findById(Employee.class, examiner1empId));
		}
		
		trackingtest.setQualitySituation(qualitySituation);
		trackingtest.setItempsn(itempsn);
		trackingtest.setWhexamineDate(whexamineDate);
		trackingtest.setWhrecordate(whrecordate);
		trackingtest.setExamineresult(examineresult);
		trackingtestService.update(trackingtest);
	
		logger.warn("ws2 audit trackingtest.id="+trackingtestId+"and warehouse  user="+empwsr1empId+"warehouse examine user"+examiner1empId);
      
		return "return_audit_list";
	}
	//显示全表
	

	
   public String show(){
	   
	 
	   
	   trackingtest=trackingtestService.findById(Trackingtest.class, trackingtestId);
	   
	   return "show";
	   
   }
   
   
   //跳转至品工审核
public String quaudit_input(){
	auditUser=currentUser;
	trackingtest=trackingtestService.findById(Trackingtest.class, trackingtestId);
	return "quaudit_input";
}   
//添加品工审核情况
public String quaudit(){
	

	
	trackingtest=trackingtestService.findById(Trackingtest.class, trackingtestId);
	if (tryerempId!=null) {
		trackingtest.setTryper(employeeService.findById(Employee.class, tryerempId));
	}
	if (mangerempId!=null) {
		trackingtest.setManger(employeeService.findById(Employee.class, mangerempId));
	}
	trackingtest.setTryadvice(tryadvice);
	trackingtest.setTrymanagerdate(trymanagerdate);
	trackingtest.setTrydate(trydate);
	trackingtest.setProrecord(prorecord);
	trackingtest.setPsncontent(psncontent);
	trackingtest.setTrypsn(trypsn);
	trackingtestService.update(trackingtest);
	logger.warn("qua audit trackingtest.id="+trackingtestId+"and user="+"tryer"+tryerempId+"manger"+mangerempId);
	return "return_audit_list";
}
//删除量试跟踪单
public String del(){
	
	
	testnotes=testnotesService.findById(Testnotes.class,trackingtestService.findById(Trackingtest.class, trackingtestId).getTestnotes().getId() );
	testnotes.setTracktestId(null);
	testnotesService.saveOrUpdate(testnotes);
	trackingtestService.deleteById(Trackingtest.class, trackingtestId);
	
	logger.warn("User Name ="+currentUser.getId()+"del success trackingtest.id="+trackingtestId);
	return "pub_del_success";
}
//更新量试跟踪单
public String update(){
	

	trackingtestService.update(trackingtest);
	logger.warn("User name ="+currentUser.getId()+"update success trackingtest.id="+trackingtest.getId());
	return "pub_update_success";
}
public String edit_input(){
	departments=departmentService.findByHql("from Department o where o.dptType<>1");
	trackingtest=trackingtestService.findById(Trackingtest.class, trackingtestId);
	logger.warn("UserName="+currentUser.getId()+"enter to edit_input");
	return "edit_input";
}
public String wsshow(){
	
	trackingtest=trackingtestService.findById(Trackingtest.class, trackingtestId);
	
	
	return "wsshow";
}
public String search(){
	
	Map<String,String> like=new HashMap<String,String>();
    
	like.put("testnotes.supplierinfo.itemname", trackingtest.getTestnotes().getSupplierinfo().getItemname());
    try {
		like.put("id", trackingtest.getId().toString());
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	pm=trackingtestService.fuzzyQuery(Trackingtest.class, like);
	
	return "list";
}

}
