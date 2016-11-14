package com.fjsdfx.starerp.warehouse.action;

import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.model.Employee;
import com.fjsdfx.starerp.persons.service.DepartmentService;
import com.fjsdfx.starerp.persons.service.EmployeeService;
import com.fjsdfx.starerp.purchase.model.Purgood;
import com.fjsdfx.starerp.purchase.model.Purorder;
import com.fjsdfx.starerp.purchase.model.Requisitions;
import com.fjsdfx.starerp.purchase.model.Resgood;
import com.fjsdfx.starerp.purchase.model.Supplierinfo;
import com.fjsdfx.starerp.purchase.service.PurgoodService;
import com.fjsdfx.starerp.purchase.service.PurorderService;
import com.fjsdfx.starerp.purchase.service.RequisitionsService;
import com.fjsdfx.starerp.purchase.service.ResgoodService;
import com.fjsdfx.starerp.security.model.User;
import org.springframework.security.context.SecurityContextHolder;
import java.text.ParseException;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.annotations.Where;
import org.hibernate.hql.ast.tree.FromClause;
import org.hibernate.mapping.Array;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import sun.misc.Signal;

import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.common.dao.BaseDao;
import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.item.model.Item;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ItemService;
import com.fjsdfx.starerp.item.service.ItemTypeService;
import com.fjsdfx.starerp.warehouse.model.Rewgood;
import com.fjsdfx.starerp.warehouse.model.Rewinder;
import com.fjsdfx.starerp.warehouse.model.Warehouse;
import com.fjsdfx.starerp.warehouse.service.RewgoodService;
import com.fjsdfx.starerp.warehouse.service.RewinderService;
import com.fjsdfx.starerp.warehouse.service.impl.RewgoodServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;
import com.sun.org.apache.commons.digester.rss.Image;

/**
 * @author Chen_Luqiang
 * 
 */
@Controller
@Scope("prototype")
public class RewinderAction {

	private List<Integer> bsnos;

	private List<Integer> factnos;

	private Integer itemTypeId;

	private List<Integer> itemTypeIds;

	private List<ItemType> itemTypes;

	private ItemTypeService itemTypeService;

	private Logger logger = LoggerFactory.getLogger(RewinderAction.class);

	private PagerModel pm;

	private PagerModel pm1;

	private List<Boolean> rewexamines;

	private Rewgood rewgood;
	private Integer rewgoodId;

	private List<Rewgood> rewgoods;

	private RewgoodService rewgoodService;

	private Rewinder rewinder;

	private Integer rewinderId;

	private RewinderService rewinderService;

	private List<Integer> rewnos;

	private List<String> rewnotes;

	private List<Float> rewprices;

	private List<String> rewunits;

	private List<Float> rewuprices;

	private String whmanager;

	private User buyerEmployee;

	private Employee rewinspector;

	private Integer requisitionsId;

	private Requisitions requisitions;

	private ResgoodService resgoodService;

	private RequisitionsService requisitionsService;

	private List<Department> departments;

	private Department department;

	private List<Employee> rewinspectors;

	private EmployeeService employeeService;

	private DepartmentService departmentService;

	private Integer employeeId;

	private Integer shownum;

	private List<Resgood> resgoods;

	private Purorder purorder;

	private List<Purgood> purgoods;

	private PurorderService purorderService;

	private PurgoodService purgoodService;

	private Integer purorderId;

	public Integer getShownum() {
		return shownum;
	}

	public void setShownum(Integer shownum) {
		this.shownum = shownum;
	}

	public Integer getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
	}

	/**
	 * 请购单添加物料
	 * 
	 * @return
	 * @throws ParseException
	 */
	public String add() throws ParseException {

		requisitions = requisitionsService.findById(Requisitions.class,
				requisitionsId);
		requisitions.setEnter(true);
		requisitionsService.update(requisitions);
		rewgoodService.saverewgoods(rewinder, bsnos, itemTypeIds, rewunits,
				rewnos, rewuprices, rewprices, rewnotes);
		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		logger.warn(currentUser.getId() + " save rewinder from requisitions "
				+ rewinder.getRew_id());
		return "pub_add_success";

	}

	/**
	 * 添加半成品进仓单
	 */
	public String add2() throws ParseException {
		/*rewinder.setRewinspector(employeeService.findById(Employee.class,
				employeeId));*/
		User currentUser = (User) SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal();

	//	buyerEmployee = currentUser;
		
		rewgoodService.saverewgoods2(rewinder, itemTypeIds, rewunits, factnos,
				 rewnotes);
		
		logger.warn(currentUser.getId() + " save rewinder " + rewinder.getRew_id());
		return "pub_add_success";

	}

	/**
	 * 采购订单添加物料
	 * 
	 * @return
	 * @throws ParseException
	 */
	public String add3() throws ParseException {

		purorder = purorderService.findById(Purorder.class, purorderId);
		purorder.setEnter(true);
		purorderService.update(purorder);
		rewgoodService.saverewgoods(rewinder, bsnos, itemTypeIds, rewunits,
				rewnos, rewuprices, rewprices, rewnotes);
		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		logger.warn(currentUser.getId() + " save rewinder from purorder "
				+ rewinder.getRew_id());
		return "pub_add_success";

	}

	/**
	 * 删除
	 * 
	 * @return
	 */
	public String del() {

		rewgoods = rewgoodService
				.findByHql("from Rewgood rg where rg.rewinder.rew_id ="
						+ rewinderId);
		rewgoodService.delrewgoods(rewinderId);
		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		logger.warn(currentUser.getId() + " delete rewinder " + rewinderId);
		return "pub_del_success";
	}

	/**
	 * 品工部检验
	 * 
	 * @return
	 */
	public String examinepgb() {
		rewinder = rewinderService.findById(Rewinder.class, rewinderId);
		rewgoods = rewgoodService
				.findByHql("from Rewgood r where r.rewinder.rew_id="
						+ rewinderId);
		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		rewinspector = currentUser.getEmployee();

		rewgoodService.examinerewgoods(rewinder, rewgoods, rewinspector,
				rewexamines);

		logger.warn("examine id=" + rewinder.getRew_id());
		return "pub_update_success";
	}

	/**
	 * 显示
	 * 
	 * @return
	 */
	public String show() {
		rewinder = rewinderService.findById(Rewinder.class, rewinderId);
		rewgoods = rewgoodService
				.findByHql("from Rewgood rg where rg.rewinder.rew_id="
						+ rewinderId);
		shownum = 0;
		return "show";
	}

	/**
	 * 显示不合格
	 */
	public String showUnqualify() {
		rewinder = rewinderService.findById(Rewinder.class, rewinderId);
		rewgoods = rewgoodService
				.findByHql("from Rewgood rg where rg.rewinder.rew_id="
						+ rewinderId + "and rg.rewexamine=false");
		shownum = 2;
		return "show";
	}

	/**
	 * 显示合格
	 */
	public String showQualify() {
		rewinder = rewinderService.findById(Rewinder.class, rewinderId);
		rewgoods = rewgoodService
				.findByHql("from Rewgood rg where rg.rewinder.rew_id="
						+ rewinderId + "and rg.rewexamine=true");
		shownum = 1;
		return "show";
	}

	/**
	 * 更新
	 * 
	 * @return
	 */
	public String update() {

		rewgoodService.updaterewgoods(rewinder, itemTypeIds, rewunits,
				rewnos, rewnotes);
		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		logger.warn(currentUser.getId()+ " edit rewinder " + rewinderId);
		return "pub_update_success";
	}

	/**
	 * Input
	 * 
	 * @return
	 */
	public String addInput() {
		/*
		 * User currentUser = (User) SecurityContextHolder.getContext()
		 * .getAuthentication().getPrincipal(); buyerEmployee = currentUser;
		 */
		requisitions = requisitionsService.findById(Requisitions.class,
				requisitionsId);
		resgoods = resgoodService
				.findByHql("from Resgood rs where rs.requisitions.id="
						+ requisitionsId);
		return "add_input";
	}

	public String addInput2() {
		rewinspectors = employeeService
				.findByHql("from Employee e where e.department.id=" + 1);
		departments = departmentService
				.findByHql("from Department d where d.dptType=" + 2);
		User currentUser = (User) SecurityContextHolder.getContext()
		  .getAuthentication().getPrincipal(); 
		buyerEmployee = currentUser;
		return "add_input2";
	}

	public String addInput3() {
		purorder = purorderService.findById(Purorder.class, purorderId);
		purgoods = purgoodService
				.findByHql("from Purgood pg where pg.purorder.id=" + purorderId);
		return "add_input3";
	}

	public String editInput() {

		rewinder = rewinderService.findById(Rewinder.class, rewinderId);
		rewgoods = rewgoodService
				.findByHql("from Rewgood rg where rg.rewinder.rew_id = "
						+ rewinderId + " and rg.rewexamine = false");

		return "edit_input";
	}

	public String examineEditInput() {
		rewinder = rewinderService.findById(Rewinder.class, rewinderId);
		rewgoods = rewgoodService
				.findByHql("from Rewgood rg where rg.rewinder.rew_id = "
						+ rewinderId);

		return "edit_input";
	}

	public String examineInput() {
		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		// String sstring;
		rewinspector = currentUser.getEmployee();
		/*
		 * if (rewinspector.getDepartment().getId().equals(
		 * departmentService.findById(Department.class, 1).getId())) {
		 */
		rewinder = rewinderService.findById(Rewinder.class, rewinderId);
		rewgoods = rewgoodService
				.findByHql("from Rewgood r where r.rewinder.rew_id="
						+ rewinderId);
		/*
		 * sstring = "examine_input"; } else { sstring = "pub_exception"; }
		 * return sstring;
		 */
		return "examine_input";
	}

	/**
	 * List
	 */
	/**
	 * 质量控制待审核列表
	 * 
	 * @return
	 */
	public String examineList() {
		// TODO Auto-generated method stub
		pm = rewinderService.getPagerDesc(Rewinder.class,
				"where o.rewinspector is null and o.whmanager is null");
		rewgoods = rewgoodService.findByHql("from Rewgood");
		return "examine_list";
	}

	/**
	 * 列表
	 * 
	 * @return
	 * @throws Exception
	 */
	public String list() {
		// TODO Auto-generated method stub

		pm = rewinderService
				.getPagerDesc(
						Rewinder.class,
						"where o.rewinspector is not null and o.rew_id in(select rg.rewinder.rew_id from Rewgood rg where rg.rewexamine = true)");

		return "list";
	}

	/**
	 *待入库列表 
	 */
	public String warehouseList() {
		// TODO Auto-generated method stub

		pm = rewinderService
				.getPagerDesc(
						Rewinder.class,
						"where o.rewinspector is not null and o.whmanager is null and o.rew_id in(select rg.rewinder.rew_id from Rewgood rg where rg.rewexamine = true)");

		return "list";
	}
	/**
	 * 材料退回收料列表
	 */
	public String unqualifylist() {
		// TODO Auto-generated method stub

		pm = rewinderService
				.getPagerDesc(
						Rewinder.class,
						"where o.rewinspector is not null and o.rew_id in(select rg.rewinder.rew_id from Rewgood rg where rg.rewexamine = 'false')");
		return "unqualify_list";
	}

	/**
	 * search
	 */
	/**
	 * 列表查询
	 */
	public String search() {

		pm = rewinderService
				.getPagerDesc(
						Rewinder.class,
						"where o.rewinspector is not null and o.rew_id in(select rg.rewinder.rew_id from Rewgood rg where rg.rewexamine = true)"
								+ " and o.suplyu like '%"
								+ rewinder.getSuplyu() + "%'");

		return "list";
	}

	/**
	 * 待审核列表查询
	 */
	public String examineSearch() {

		pm = rewinderService.getPagerDesc(Rewinder.class,
				"where o.rewinspector is null and o.whmanager is null and o.suplyu like '%"
						+ rewinder.getSuplyu() + "%'");

		return "examine_list";
	}

	/**
	 * 不合格品查询
	 * 
	 * @return
	 */
	public String unqualifysearch() {

		pm = rewinderService
				.getPagerDesc(
						Rewinder.class,
						"where o.rewinspector is not null and o.rew_id in(select rg.rewinder.rew_id from Rewgood rg where rg.rewexamine = false)"
								+ " and  and o.suplyu like '%"
								+ rewinder.getSuplyu() + "%'");

		return "unqualify_list";
	}

	public List<Integer> getBsnos() {
		return bsnos;
	}

	public User getBuyerEmployee() {
		return buyerEmployee;
	}

	public Department getDepartment() {
		return department;
	}

	public DepartmentService getDepartmentService() {
		return departmentService;
	}

	public List<Integer> getFactnos() {
		return factnos;
	}

	public Integer getItemTypeId() {
		return itemTypeId;
	}

	public List<Integer> getItemTypeIds() {
		return itemTypeIds;
	}

	public List<ItemType> getItemTypes() {
		return itemTypes;
	}

	public ItemTypeService getItemTypeService() {
		return itemTypeService;
	}

	public Logger getLogger() {
		return logger;
	}

	public PagerModel getPm() {
		return pm;
	}

	public PagerModel getPm1() {
		return pm1;
	}

	public List<Boolean> getRewexamines() {
		return rewexamines;
	}

	public Rewgood getRewgood() {
		return rewgood;
	}

	public Integer getRewgoodId() {
		return rewgoodId;
	}

	public List<Rewgood> getRewgoods() {
		return rewgoods;
	}

	public RewgoodService getRewgoodService() {
		return rewgoodService;
	}

	public Rewinder getRewinder() {
		return rewinder;
	}

	public Integer getRewinderId() {
		return rewinderId;
	}

	public RewinderService getRewinderService() {
		return rewinderService;
	}

	public List<Integer> getRewnos() {
		return rewnos;
	}

	public List<String> getRewnotes() {
		return rewnotes;
	}

	public List<Float> getRewprices() {
		return rewprices;
	}

	public List<String> getRewunits() {
		return rewunits;
	}

	public List<Float> getRewuprices() {
		return rewuprices;
	}

	public String getWhmanager() {
		return whmanager;
	}

	public void setBsnos(List<Integer> bsnos) {
		this.bsnos = bsnos;
	}

	public void setBuyerEmployee(User buyerEmployee) {
		this.buyerEmployee = buyerEmployee;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	@Resource
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}

	public void setFactnos(List<Integer> factnos) {
		this.factnos = factnos;
	}

	public void setItemTypeId(Integer itemTypeId) {
		this.itemTypeId = itemTypeId;
	}

	public void setItemTypeIds(List<Integer> itemTypeIds) {
		this.itemTypeIds = itemTypeIds;
	}

	public void setItemTypes(List<ItemType> itemTypes) {
		this.itemTypes = itemTypes;
	}

	@Resource
	public void setItemTypeService(ItemTypeService itemTypeService) {
		this.itemTypeService = itemTypeService;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	public void setPm(PagerModel pm) {
		this.pm = pm;
	}

	public void setPm1(PagerModel pm1) {
		this.pm1 = pm1;
	}

	public void setRewexamines(List<Boolean> rewexamines) {
		this.rewexamines = rewexamines;
	}

	public void setRewgood(Rewgood rewgood) {
		this.rewgood = rewgood;
	}

	public void setRewgoodId(Integer rewgoodId) {
		this.rewgoodId = rewgoodId;
	}

	public void setRewgoods(List<Rewgood> rewgoods) {
		this.rewgoods = rewgoods;
	}

	@Resource
	public void setRewgoodService(RewgoodService rewgoodService) {
		this.rewgoodService = rewgoodService;
	}

	public void setRewinder(Rewinder rewinder) {
		this.rewinder = rewinder;
	}

	public void setRewinderId(Integer rewinderId) {
		this.rewinderId = rewinderId;
	}

	@Resource
	public void setRewinderService(RewinderService rewinderService) {
		this.rewinderService = rewinderService;
	}

	public void setRewnos(List<Integer> rewnos) {
		this.rewnos = rewnos;
	}

	public void setRewnotes(List<String> rewnotes) {
		this.rewnotes = rewnotes;
	}

	public void setRewprices(List<Float> rewprices) {
		this.rewprices = rewprices;
	}

	public void setRewunits(List<String> rewunits) {
		this.rewunits = rewunits;
	}

	public List<Employee> getRewinspectors() {
		return rewinspectors;
	}

	public void setRewinspectors(List<Employee> rewinspectors) {
		this.rewinspectors = rewinspectors;
	}

	public EmployeeService getEmployeeService() {
		return employeeService;
	}

	@Resource
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	public void setRewuprices(List<Float> rewuprices) {
		this.rewuprices = rewuprices;
	}

	public void setWhmanager(String whmanager) {
		this.whmanager = whmanager;
	}

	public List<Department> getDepartments() {
		return departments;
	}

	public void setDepartments(List<Department> departments) {
		this.departments = departments;
	}

	public Integer getRequisitionsId() {
		return requisitionsId;
	}

	public void setRequisitionsId(Integer requisitionsId) {
		this.requisitionsId = requisitionsId;
	}

	public RequisitionsService getRequisitionsService() {
		return requisitionsService;
	}

	@Resource
	public void setRequisitionsService(RequisitionsService requisitionsService) {
		this.requisitionsService = requisitionsService;
	}

	public Requisitions getRequisitions() {
		return requisitions;
	}

	public void setRequisitions(Requisitions requisitions) {
		this.requisitions = requisitions;
	}

	public ResgoodService getResgoodService() {
		return resgoodService;
	}

	@Resource
	public void setResgoodService(ResgoodService resgoodService) {
		this.resgoodService = resgoodService;
	}

	public List<Resgood> getResgoods() {
		return resgoods;
	}

	public void setResgoods(List<Resgood> resgoods) {
		this.resgoods = resgoods;
	}

	public Purorder getPurorder() {
		return purorder;
	}

	public void setPurorder(Purorder purorder) {
		this.purorder = purorder;
	}

	public List<Purgood> getPurgoods() {
		return purgoods;
	}

	public void setPurgoods(List<Purgood> purgoods) {
		this.purgoods = purgoods;
	}

	public PurorderService getPurorderService() {
		return purorderService;
	}

	@Resource
	public void setPurorderService(PurorderService purorderService) {
		this.purorderService = purorderService;
	}

	public PurgoodService getPurgoodService() {
		return purgoodService;
	}

	@Resource
	public void setPurgoodService(PurgoodService purgoodService) {
		this.purgoodService = purgoodService;
	}

	public Integer getPurorderId() {
		return purorderId;
	}

	public void setPurorderId(Integer purorderId) {
		this.purorderId = purorderId;
	}

	public Employee getRewinspector() {
		return rewinspector;
	}

	public void setRewinspector(Employee rewinspector) {
		this.rewinspector = rewinspector;
	}

}
