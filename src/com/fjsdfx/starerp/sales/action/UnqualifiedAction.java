package com.fjsdfx.starerp.sales.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.security.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;

import com.fjsdfx.starerp.security.model.User;
import org.springframework.security.context.SecurityContextHolder;
import com.fjsdfx.starerp.annoucement.model.Annoucement;
import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.item.model.Item;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ItemService;
import com.fjsdfx.starerp.item.service.ItemTypeService;
import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.model.Employee;
import com.fjsdfx.starerp.persons.service.DepartmentService;
import com.fjsdfx.starerp.persons.service.EmployeeService;
import com.fjsdfx.starerp.sales.service.RetgoodService;
import com.fjsdfx.starerp.sales.service.ReturnedService;
import com.fjsdfx.starerp.sales.service.Shi2goodService;
import com.fjsdfx.starerp.sales.service.Shinote2Service;
import com.fjsdfx.starerp.sales.service.UnqmessageService;
import com.fjsdfx.starerp.sales.service.UnqualifiedService;
import com.fjsdfx.starerp.sales.model.Retgood;
import com.fjsdfx.starerp.sales.model.Returned;
import com.fjsdfx.starerp.sales.model.Shi1good;
import com.fjsdfx.starerp.sales.model.Shi2good;
import com.fjsdfx.starerp.sales.model.Shinote2;
import com.fjsdfx.starerp.sales.model.Shippingnote1;
import com.fjsdfx.starerp.sales.model.Unqmessage;
import com.fjsdfx.starerp.sales.model.Unqualified;
import com.fjsdfx.starerp.security.model.User;

/**
 * @author Chen_Shaojian
 * 
 */
@Controller
@Scope("prototype")
public class UnqualifiedAction {

	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	public UnqualifiedService getUnqualifiedService() {
		return unqualifiedService;
	}

	@Resource
	public void setUnqualifiedService(UnqualifiedService unqualifiedService) {
		this.unqualifiedService = unqualifiedService;
	}

	public Unqualified getUnqualified() {
		return unqualified;
	}

	public void setUnqualified(Unqualified unqualified) {
		this.unqualified = unqualified;
	}

	public PagerModel getPm() {
		return pm;
	}

	public void setPm(PagerModel pm) {
		this.pm = pm;
	}

	public Retgood getRetgood() {
		return retgood;
	}

	public void setRetgood(Retgood retgood) {
		this.retgood = retgood;
	}

	public Integer getRetgoodId() {
		return retgoodId;
	}

	public void setRetgoodId(Integer retgoodId) {
		this.retgoodId = retgoodId;
	}

	public RetgoodService getRetgoodService() {
		return retgoodService;
	}

	@Resource
	public void setRetgoodService(RetgoodService retgoodService) {
		this.retgoodService = retgoodService;
	}

	public ItemTypeService getItemtypeService() {
		return itemtypeService;
	}

	@Resource
	public void setItemtypeService(ItemTypeService itemtypeService) {
		this.itemtypeService = itemtypeService;
	}

	public Integer getItemTypeId() {
		return itemTypeId;
	}

	public void setItemTypeId(Integer itemTypeId) {
		this.itemTypeId = itemTypeId;
	}

	public Integer getUnqualifiedId() {
		return unqualifiedId;
	}

	public void setUnqualifiedId(Integer unqualifiedId) {
		this.unqualifiedId = unqualifiedId;
	}

	public List<Retgood> getRetgoods() {
		return retgoods;
	}

	public void setRetgoods(List<Retgood> retgoods) {
		this.retgoods = retgoods;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public List<Department> getDepartments() {
		return departments;
	}

	public void setDepartments(List<Department> departments) {
		this.departments = departments;
	}

	public DepartmentService getDepartmentService() {
		return departmentService;
	}

	@Resource
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}

	public Unqmessage getUnqmessage() {
		return unqmessage;
	}

	public void setUnqmessage(Unqmessage unqmessage) {
		this.unqmessage = unqmessage;
	}

	public UnqmessageService getUnqmessageService() {
		return unqmessageService;
	}

	@Resource
	public void setUnqmessageService(UnqmessageService unqmessageService) {
		this.unqmessageService = unqmessageService;
	}

	public List<Unqmessage> getUnqmessages() {
		return unqmessages;
	}

	public void setUnqmessages(List<Unqmessage> unqmessages) {
		this.unqmessages = unqmessages;
	}

	public Returned getReturned() {
		return returned;
	}

	public void setReturned(Returned returned) {
		this.returned = returned;
	}

	public ReturnedService getReturnedService() {
		return returnedService;
	}

	@Resource
	public void setReturnedService(ReturnedService returnedService) {
		this.returnedService = returnedService;
	}

	public List<Returned> getReturneds() {
		return returneds;
	}

	public void setReturneds(List<Returned> returneds) {
		this.returneds = returneds;
	}

	public Integer getReturnedId() {
		return returnedId;
	}

	public void setReturnedId(Integer returnedId) {
		this.returnedId = returnedId;
	}

	public List<Unqualified> getUnqualifieds() {
		return unqualifieds;
	}

	public void setUnqualifieds(List<Unqualified> unqualifieds) {
		this.unqualifieds = unqualifieds;
	}

	private Logger logger = LoggerFactory.getLogger(UnqualifiedAction.class);

	private UnqualifiedService unqualifiedService;

	private Unqualified unqualified;

	private PagerModel pm;

	private Retgood retgood;

	private Integer retgoodId;

	private RetgoodService retgoodService;

	private ItemTypeService itemtypeService;

	private Integer itemTypeId;

	private Integer unqualifiedId;

	private List<Retgood> retgoods;

	private Department department;

	private DepartmentService departmentService;

	private List<Department> departments;

	private Unqmessage unqmessage;

	private UnqmessageService unqmessageService;

	private List<Unqmessage> unqmessages;

	private Returned returned;

	private ReturnedService returnedService;

	private List<Returned> returneds;

	private Integer returnedId;

	private List<Unqualified> unqualifieds;

	private List<Integer> itemTypeIds;

	private List<String> unmcode;

	private List<String> unmstatus;

	private List<String> bdepartment;

	private List<Date> fdate;

	private User currentUser = (User) SecurityContextHolder.getContext()
			.getAuthentication().getPrincipal();

	/**
	 * 检验人
	 */
	private User inspector;

	public User getInspector() {
		return inspector;
	}

	public void setInspector(User inspector) {
		this.inspector = inspector;
	}

	public User getCurrentUser() {
		return currentUser;
	}

	public void setCurrentUser(User currentUser) {
		this.currentUser = currentUser;
	}

	public List<Integer> getItemTypeIds() {
		return itemTypeIds;
	}

	public void setItemTypeIds(List<Integer> itemTypeIds) {
		this.itemTypeIds = itemTypeIds;
	}

	public List<String> getUnmcode() {
		return unmcode;
	}

	public void setUnmcode(List<String> unmcode) {
		this.unmcode = unmcode;
	}

	public List<String> getUnmstatus() {
		return unmstatus;
	}

	public void setUnmstatus(List<String> unmstatus) {
		this.unmstatus = unmstatus;
	}

	public List<String> getBdepartment() {
		return bdepartment;
	}

	public void setBdepartment(List<String> bdepartment) {
		this.bdepartment = bdepartment;
	}

	public List<Date> getFdate() {
		return fdate;
	}

	public void setFdate(List<Date> fdate) {
		this.fdate = fdate;
	}

	/**
	 * 列表
	 * 
	 * @return
	 * @throws Exception
	 */
	public String list() {
		// TODO Auto-generated method stub
		pm = returnedService.getPager(Returned.class);

		unqualifieds = unqualifiedService.findByHql("from Unqualified");
		return "list";
	}

	public String addInput() {
		returned = returnedService.findById(Returned.class, returnedId);
		// User currentUser=(User)
		// SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		// inspector= currentUser;
		System.out.print("---------------------" + returnedId
				+ "------------------");
		departments = departmentService
				.findByHql("from Department o where o.dptType=1");
		retgoods = retgoodService.findByHql("from Retgood");

		return "add_input";
	}

	/**
	 * 是否提交不合格单
	 */
	private String buhege;

	public String getBuhege() {
		return buhege;
	}

	public void setBuhege(String buhege) {
		this.buhege = buhege;
	}

	public String add() throws ParseException {
		returned = returnedService.findById(Returned.class, returnedId);
		returned.setBuhege(buhege);
		returnedService.saveOrUpdate(returned);
		unqualified.setReturned(returned);
		unqualifiedService.saveAndRefresh(unqualified);
		unqmessageService.saveunqumessages(unqualified, unmcode, unmstatus,
				fdate, bdepartment);
		logger.warn("add unqualified id" + unqualified.getUnq_id()
				+ "user Id =" + currentUser.getId());
		return "pub_add_success";
	}

	public String show() {

		unqualified = unqualifiedService.findById(Unqualified.class,
				unqualifiedId);

		System.out.print("--------------------" + unqualifiedId
				+ "---------------------");
		unqmessages = unqmessageService.getPager(Unqmessage.class,
				"where o.unqualified.unq_id=" + unqualifiedId).getDatas();

		return "show";
	}

	// 跳转到返工送检页面
	public String recheck() {
		unqualified = unqualifiedService.findById(Unqualified.class,
				unqualifiedId);
		unqmessages = unqmessageService.getPager(Unqmessage.class,
				"where o.unqualified.unq_id=" + unqualifiedId).getDatas();
		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		inspector = currentUser;
		return "recheck";
	}

	// 提交至品工部复检
	private Date insdate;

	public Date getInsdate() {
		return insdate;
	}

	public void setInsdate(Date insdate) {
		this.insdate = insdate;
	}

	/**
	 * 品工部复查人
	 * 
	 */
	private EmployeeService employeeService;
	private Employee employee;

	public EmployeeService getEmployeeService() {
		return employeeService;
	}

	@Resource
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	private int inspector_1;

	public int getInspector_1() {
		return inspector_1;
	}

	public void setInspector_1(int inspector_1) {
		this.inspector_1 = inspector_1;
	}

	/**
	 * 车间送检方法
	 * 
	 * @return
	 */
	private String buhegeid;

	public String getBuhegeid() {
		return buhegeid;
	}

	public void setBuhegeid(String buhegeid) {
		this.buhegeid = buhegeid;
	}

	public String torecheck() {

		returned = returnedService.findById(Returned.class, returnedId);
		returned.setBuhege(buhege);
		returned.setUnqualify_id(buhegeid);
		returnedService.saveOrUpdate(returned);

		unqualified = unqualifiedService.findById(Unqualified.class,
				unqualifiedId);
		unqualified.setInspector(employeeService.findById(Employee.class,
				inspector_1));
		unqualified.setInsdate(insdate);
		unqualifiedService.saveOrUpdate(unqualified);
		unqmessages = unqmessageService
				.findByHql("from Unqmessage o where o.unqualified="
						+ unqualifiedId);
		for (int i = 0; i < unqmessages.size(); i++) {
			unqmessage = unqmessages.get(i);
			unqmessageService.saveOrUpdate(unqmessage);
		}

		return "torechcek";
	}

	/**
	 * 跳转至品工部复检
	 * 
	 * @return
	 */
	public String recheckpgb() {

		unqualified = unqualifiedService.findById(Unqualified.class,
				unqualifiedId);
		unqmessages = unqmessageService.getPager(Unqmessage.class,
				"where o.unqualified.unq_id=" + unqualifiedId).getDatas();
		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		inspector = currentUser;

		return "recheckpgb";
	}

	/**
	 * 品工部复检方法
	 */

	private String deal;

	public String getDeal() {
		return deal;
	}

	public void setDeal(String deal) {
		this.deal = deal;
	}

	private String review;//复查结果说明

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}
	
	private Integer recheckper;//复查人

	
	public Integer getRecheckper() {
		return recheckper;
	}

	public void setRecheckper(Integer recheckper) {
		this.recheckper = recheckper;
	}

	private Date rechecktime;//复查时间

	public Date getRechecktime() {
		return rechecktime;
	}

	public void setRechecktime(Date rechecktime) {
		this.rechecktime = rechecktime;
	}

	public String torecheckpgb() {

		returned = returnedService.findById(Returned.class, returnedId);
		returned.setBuhege(buhege);
		returned.setDeals(deal);
		returnedService.saveOrUpdate(returned);
		unqualified = unqualifiedService.findById(Unqualified.class,
				unqualifiedId);
		unqualified.setRecheckper(employeeService.findById(Employee.class,
				recheckper));
		unqualified.setRechecktime(rechecktime);
		unqualified.setReview(review);
		unqualifiedService.saveOrUpdate(unqualified);
		unqmessages = unqmessageService
				.findByHql("from Unqmessage o where o.unqualified="
						+ unqualifiedId);
		for (int i = 0; i < unqmessages.size(); i++) {
			unqmessage = unqmessages.get(i);
			unqmessageService.saveOrUpdate(unqmessage);
		}

		return "torecheckpgb";
	}

	public String del() {
		unqmessages = unqmessageService
				.findByHql("from Unqmessage un where un.unqualified.unq_id ="
						+ unqualifiedId);
		unqmessageService.deleteunqmessages(unqmessages);
		unqualifiedService.deleteById(Unqualified.class, unqualifiedId);
		logger.warn("add unqualified id" + unqualifiedId + "user Id ="
				+ currentUser.getId());
		return "return_list";
	}

}
