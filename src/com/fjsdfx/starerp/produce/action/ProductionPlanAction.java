package com.fjsdfx.starerp.produce.action;

import com.fjsdfx.starerp.security.model.User;
import org.springframework.security.context.SecurityContextHolder;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.hql.ast.tree.FromClause;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.item.model.Item;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ItemService;
import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.model.Employee;
import com.fjsdfx.starerp.persons.service.DepartmentService;
import com.fjsdfx.starerp.persons.service.EmployeeService;
import com.fjsdfx.starerp.produce.model.Pergood;
import com.fjsdfx.starerp.produce.model.Pro_schedule;
import com.fjsdfx.starerp.produce.model.Prscheck;
import com.fjsdfx.starerp.produce.service.PergoodService;
import com.fjsdfx.starerp.produce.service.Pro_scheduleService;
import com.fjsdfx.starerp.produce.service.PrscheckService;

import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;


import com.opensymphony.xwork2.ActionSupport;

/*
 * 
 * author Jonney Chan
 * 
 * */



@Controller
@Scope("prototype")

public class ProductionPlanAction extends ActionSupport{
	
	private Integer isSelectItemType;
	private Integer partnumber;
	private ItemService itemService;
	public ItemService getItemService() {
		return itemService;
	}
	@Resource
	public void setItemService(ItemService itemService) {
		this.itemService = itemService;
	}
	public Integer getIsSelectItemType() {
		return isSelectItemType;
	}
	public void setIsSelectItemType(Integer isSelectItemType) {
		this.isSelectItemType = isSelectItemType;
	}
	public Integer getPartnumber() {
		return partnumber;
	}
	public void setPartnumber(Integer partnumber) {
		this.partnumber = partnumber;
	}

	private Logger logger = LoggerFactory.getLogger(ProductionPlanAction.class);
	private Pro_scheduleService proScheduleService;
	private Pro_schedule proSchedule;
	private List<Pro_schedule> proSchedules;
	private PagerModel pm;
	private Department department;
	private DepartmentService departmentService;
    private List<Department> departments;
    private User auditUser;
    private Employee employee;
    private EmployeeService employeeService;
    

	private List<String> pcontents;
	private List<String> pnotes;
    private List<String> punits;
	private List<Date> cdates;
	private List<Integer> pnumbers;
    private Integer employeeEditId;
	private PrscheckService prscheckService;
	private Prscheck prscheck;
	private Integer prscheckId;
	private Integer proScheduleId;
	private List<Integer> employeeIds;
	private String monString;
	
	private Integer addplan;
	
private List<Pergood> pergoods;

private PergoodService pergoodService;

private List<Integer> itemTypeids;

	
	public List<Pergood> getPergoods() {
	return pergoods;
}
public void setPergoods(List<Pergood> pergoods) {
	this.pergoods = pergoods;
}
public PergoodService getPergoodService() {
	return pergoodService;
}
@Resource
public void setPergoodService(PergoodService pergoodService) {
	this.pergoodService = pergoodService;
}

	private User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	public Integer getAddplan() {
		return addplan;
	}
	public void setAddplan(Integer addplan) {
		this.addplan = addplan;
	}
	public String getMonString() {
		return monString;
	}
	public void setMonString(String monString) {
		this.monString = monString;
	}
	public List<Integer> getEmployeeIds() {
		return employeeIds;
	}
	public void setEmployeeIds(List<Integer> employeeIds) {
		this.employeeIds = employeeIds;
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
	public User getAuditUser() {
		return auditUser;
	}
	public void setAuditUser(User auditUser) {
		this.auditUser = auditUser;
	}
	public Integer getProScheduleId() {
		return proScheduleId;
	}
	public void setProScheduleId(Integer proScheduleId) {
		this.proScheduleId = proScheduleId;
	}

private Integer employeeApproveId;
private Integer employeeAuditId;	
	public Integer getEmployeeEditId() {
	return employeeEditId;
}
public void setEmployeeEditId(Integer employeeEditId) {
	this.employeeEditId = employeeEditId;
}
public Integer getEmployeeApproveId() {
	return employeeApproveId;
}
public void setEmployeeApproveId(Integer employeeApproveId) {
	this.employeeApproveId = employeeApproveId;
}
	public Integer getPrscheckId() {
		return prscheckId;
	}
	public void setPrscheckId(Integer prscheckId) {
		this.prscheckId = prscheckId;
	}
	public PrscheckService getPrscheckService() {
		return prscheckService;
	}
@Resource
	public void setPrscheckService(PrscheckService prscheckService) {
		this.prscheckService = prscheckService;
	}

	public Prscheck getPrscheck() {
		return prscheck;
	}

	public void setPrscheck(Prscheck prscheck) {
		this.prscheck = prscheck;
	}

	



	
	public List<String> getPcontents() {
		return pcontents;
	}

	public void setPcontents(List<String> pcontents) {
		this.pcontents = pcontents;
	}

	public List<String> getPnotes() {
		return pnotes;
	}

	public void setPnotes(List<String> pnotes) {
		this.pnotes = pnotes;
	}



	public List<String> getPunits() {
		return punits;
	}

	public void setPunits(List<String> punits) {
		this.punits = punits;
	}

	public List<Date> getCdates() {
		return cdates;
	}

	public void setCdates(List<Date> cdates) {
		this.cdates = cdates;
	}

	public List<Integer> getPnumbers() {
		return pnumbers;
	}

	public void setPnumbers(List<Integer> pnumbers) {
		this.pnumbers = pnumbers;
	}


    public List<Pro_schedule> getProSchedules() {
		return proSchedules;
	}

	public void setProSchedules(List<Pro_schedule> proSchedules) {
		this.proSchedules = proSchedules;
	}

	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	public Pro_scheduleService getProScheduleService() {
		return proScheduleService;
	}

	@Resource
	public void setProScheduleService(Pro_scheduleService proScheduleService) {
		this.proScheduleService = proScheduleService;
	}

	public Pro_schedule getProSchedule() {
		return proSchedule;
	}

	public void setProSchedule(Pro_schedule proSchedule) {
		this.proSchedule = proSchedule;
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


	public PagerModel getPm() {
		return pm;
	}

	

	public void setPm(PagerModel pm) {
		this.pm = pm;
	}
	public List<Department> getDepartments() {
		return departments;
	}

	public void setDepartments(List<Department> departments) {
		this.departments = departments;
	}

   /**/
	public String Make() throws Exception
	{
		
		return "make";
		
	}
	/* 添加生产计划单, */
	public String add() throws Exception{
		


		proScheduleService.saveproschedules(prscheck, cdates, pcontents, pnotes, pnumbers, punits,addplan,itemTypeids);
		logger.warn("add prscheck id"+prscheck.getId()+"user name ="+currentUser.getName());
	    return "pub_add_success";
		
	}
	 /*读取审核页面的信息*/
	public String au_dit() throws Exception
	{
	
	
			auditUser=currentUser;


		prscheck=prscheckService.findById(Prscheck.class, prscheckId);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月");
		
		if (prscheck.getSdate()!=null) {
			monString=sdf.format(prscheck.getSdate());
		}
		
		pm=proScheduleService.getPagerDesc(Pro_schedule.class, "where o.prscheck.id ="+prscheckId);
		
		return "audit";
	}
	public String auditAgain() throws Exception
	{
	
	
			auditUser=currentUser;


		prscheck=prscheckService.findById(Prscheck.class, prscheckId);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月");
		
		if (prscheck.getSdate()!=null) {
			monString=sdf.format(prscheck.getSdate());
		}
		
		pm=proScheduleService.getPagerDesc(Pro_schedule.class, "where o.prscheck.id ="+prscheckId);
		
		return "auditAgain";
	}
	/*添加审核信息*/
	public String approve() throws Exception{
		
		prscheck=prscheckService.findById(Prscheck.class, prscheckId);


		if (employeeApproveId!=null) {

			prscheck.setEmployeeApprove(employeeService.findById(Employee.class, employeeApproveId));			
		}
		if (employeeAuditId!=null) {
			prscheck.setEmployeeAudit(employeeService.findById(Employee.class, employeeAuditId));
		}
		
		prscheckService.saveOrUpdate(prscheck);
	logger.warn("user name ="+currentUser.getName()+"audit prscheck.id"+prscheckId);
		return "return_audit_list";
	
	}
	/* 显示单个计划单信息 */
	public String show(){
		
		prscheck=prscheckService.findById(Prscheck.class, prscheckId);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月");
		if (prscheck.getSdate()!=null) {
			monString=sdf.format(prscheck.getSdate());
		}
		
		pm=proScheduleService.getPagerDesc(Pro_schedule.class, "where o.prscheck.id ="+prscheckId);
	
		return "show";
	}
	//更新计划信息
	public String edit_input(){
		
		prscheck=prscheckService.findById(Prscheck.class, prscheckId);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月");
		monString=sdf.format(prscheck.getSdate());
		pm=proScheduleService.getPagerDesc(Pro_schedule.class, "where o.prscheck.id ="+prscheckId);
		return "edit_input";
	}
public String edit(){

	proScheduleService.updateschedules(prscheck, cdates, pcontents, pnotes, pnumbers, punits,itemTypeids);
	logger.warn("update prscheck.id"+prscheck.getId()+"by user ="+currentUser.getId());
	return "pub_update_success";
}
	//整个计划单一并删除
	public String del(){

		System.out.println("-----------------prscheckId"+prscheckId);
		prscheck=prscheckService.findById(Prscheck.class, prscheckId);
		proScheduleService.delproschedules(prscheck);
		logger.warn("del prschect"+prscheckId+"by user name ="+currentUser.getId());
		return "pub_del_success";
	}


	public String tosearch() throws Exception
	{
		pm=prscheckService.getPagerDesc(Prscheck.class);
		return "tosearch";
	}
	//显示计划单列表
	public String list() throws Exception
	{
		pm=prscheckService.getPagerDesc(Prscheck.class);
	
		return "list";
	}
	public String search(){
		Map<String,String> like=new HashMap<String,String>();
     
		like.put("employeeEdit.empName", prscheck.getEmployeeEdit().getEmpName());
        like.put("psn", prscheck.getPsn());
		pm=prscheckService.fuzzyQuery(Prscheck.class, like);
		
		return "tosearch";
		
	}
	public String make_list() throws Exception
	{
		
		auditUser=currentUser;
		departments=departmentService.findByHql("from Department o where o.dptType=2");
	
	
		return "make_list";
	}
	
	public String selectItem()
	{
		currentUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(currentUser.getEmployee().getDepartment().getDptName().equals("生产部"))
		{
			pm = itemService.getPagerDesc(Item.class,"where o.name = '打印机'");
		}
		else
		{
			pm = itemService.getPagerDesc(Item.class,"where o.name != '打印机'");
		}
		return "selectItem";
	}
	
	/*跳转至审核页面*/
	public String audit_list() throws Exception
	{
		
		pm=prscheckService.getPagerDesc(Prscheck.class,"where  o.employeeApprove.empId is null or o.employeeAudit.empId is null ");
		return "audit_list";
	}
	public void setEmployeeAuditId(Integer employeeAuditId) {
		this.employeeAuditId = employeeAuditId;
	}
	public Integer getEmployeeAuditId() {
		return employeeAuditId;
	}
	public void setItemTypeids(List<Integer> itemTypeids) {
		this.itemTypeids = itemTypeids;
	}
	public List<Integer> getItemTypeids() {
		return itemTypeids;
	}
}
