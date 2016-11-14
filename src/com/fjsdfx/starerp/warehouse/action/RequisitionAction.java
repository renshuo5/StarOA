package com.fjsdfx.starerp.warehouse.action;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.security.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;

import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ItemTypeService;
import com.fjsdfx.starerp.persons.model.Employee;
import com.fjsdfx.starerp.persons.service.EmployeeService;
import com.fjsdfx.starerp.security.model.User;
import com.fjsdfx.starerp.warehouse.model.Feedexamine;
import com.fjsdfx.starerp.warehouse.model.Picgood;
import com.fjsdfx.starerp.warehouse.model.Requisition;
import com.fjsdfx.starerp.warehouse.model.Rewgood;
import com.fjsdfx.starerp.warehouse.model.Rewinder;
import com.fjsdfx.starerp.warehouse.service.PicgoodService;
import com.fjsdfx.starerp.warehouse.service.RequisitionService;
import com.fjsdfx.starerp.warehouse.service.RewgoodService;
import com.jsptags.navigation.pager.parser.ParseException;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;

@Controller
@Scope("prototype")
public class RequisitionAction {

	private List<String> calunits;

	private User confirmper;

	private Integer dptmanager;

	private Integer itemTypeId;

	private List<Integer> itemTypeIds;

	private ItemTypeService itemTypeService;

	Logger logger = LoggerFactory.getLogger(RequisitionAction.class);

	private Picgood picgood;

	private Integer picgoodId;

	private List<Picgood> picgoods;

	private PicgoodService picgoodService;

	private PagerModel pm;

	private List<Integer> reqnums;

	private Requisition requisition;

	private Integer requisitionId;

	private RequisitionService requisitionService;

	private List<Float> rprices;

	private List<Float> ruprices;

	private List<String> userfs;

	private Date deliverDate;

	private List<Integer> factnums;

	private User pickingper;
	
	private List<Employee> dptmanagers;
	
	private EmployeeService employeeService;

	/**
	 * 添加
	 * 
	 * @return
	 * @throws ParseException
	 */
	public String add() throws ParseException {
		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		/*pickingper = currentUser;
		requisition.setPickingper(pickingper.getEmployee());*/
		picgoodService.savepicgoods(requisition, itemTypeIds, calunits,
				reqnums, ruprices, userfs);
		logger.warn(currentUser.getId() + " save requisition "
				+ requisition.getReq_id());
		return "pub_add_success";
	}

	public String addInput() {

		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		pickingper = currentUser;
		dptmanagers = employeeService.findByHql("from Employee e where e.department.dptType="+2);
		return "add_input";
	}

	/**
	 * 删除
	 * 
	 * @return
	 */
	public String del() {
		picgoodService.delpicgoods(requisitionId);
		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		logger.warn(currentUser.getId() + " delete requisition "
				+ requisitionId);
		return "pub_del_success";
	}

	public String editInput() {
		requisition = requisitionService.findById(Requisition.class,
				requisitionId);
		picgoods = picgoodService
				.findByHql("from Picgood pg where pg.requisition.req_id="
						+ requisitionId);
		dptmanagers = employeeService.findByHql("from Employee e where e.department.dptType="+2);
		return "edit_input";
	}

	/**
	 * 检验
	 * 
	 * @return
	 */
	public String examine() {
		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		confirmper = currentUser;
		picgoodService
				.examine(requisitionId, factnums, confirmper, deliverDate);
		logger.warn("examine id="
				+ requisitionService.findById(Requisition.class, requisitionId)
						.getReq_id());
		return "pub_update_success";
	}

	public String examineInput() {
		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		confirmper = currentUser;
		requisition = requisitionService.findById(Requisition.class,
				requisitionId);
		picgoods = picgoodService
				.findByHql("from Picgood pg where pg.requisition.req_id="
						+ requisitionId);
		return "examine_input";
	}

	/**
	 * 待检验列表
	 * 
	 * @return
	 */
	public String examineList() {
		// TODO Auto-generated method stub
		pm = requisitionService.getPagerDesc(Requisition.class,
				"where o.confirmper is null or o.dptmanager is null");
		return "examine_list";
	}

	/**
	 * 待检验列表查询
	 * 
	 * @return
	 */
	public String examinesearch() {
		/*
		 * Map<String, String> likeMap = new HashMap<String, String>();
		 * likeMap.put("company", requisition.getCompany());
		 * 
		 * pm = requisitionService.fuzzyQuery(Requisition.class, likeMap);;
		 */
		pm = requisitionService.getPagerDesc(Requisition.class,
				"where o.confirmper is null and o.company like '%"
						+ requisition.getCompany()
						+ "%'  or o.dptmanager is null ");
		return "examine_list";
	}

	/**
	 * 显示
	 * 
	 * @return
	 */
	public String show() {

		requisition = requisitionService.findById(Requisition.class,
				requisitionId);
		picgoods = picgoodService
				.findByHql("from Picgood pg where pg.requisition.req_id = "
						+ requisitionId);
		return "show";
	}

	/**
	 * 编辑
	 * 
	 * @return
	 */
	public String update() {
		
		System.out.println("-----------"+dptmanager);
		if (dptmanager!=null) {
			requisition.setDptmanager(employeeService.findById(Employee.class, dptmanager));
			requisitionService.update(requisition);
		}
		
		
		
		picgoodService.updatepicgoods(requisition, itemTypeIds, calunits,
				reqnums, ruprices, rprices, userfs);
		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		logger.warn(currentUser.getId() + " edit requisition "
				+ requisition.getReq_id());
		return "pub_update_success";
	}

	
	public List<String> getCalunits() {
		return calunits;
	}

	public Date getDeliverDate() {
		return deliverDate;
	}

	public Integer getDptmanager() {
		return dptmanager;
	}

	public List<Integer> getFactnums() {
		return factnums;
	}

	public Integer getItemTypeId() {
		return itemTypeId;
	}

	public List<Integer> getItemTypeIds() {
		return itemTypeIds;
	}

	public ItemTypeService getItemTypeService() {
		return itemTypeService;
	}

	public Logger getLogger() {
		return logger;
	}

	public Picgood getPicgood() {
		return picgood;
	}

	public Integer getPicgoodId() {
		return picgoodId;
	}

	public List<Picgood> getPicgoods() {
		return picgoods;
	}

	public PicgoodService getPicgoodService() {
		return picgoodService;
	}

	public PagerModel getPm() {
		return pm;
	}

	public List<Integer> getReqnums() {
		return reqnums;
	}

	public Requisition getRequisition() {
		return requisition;
	}

	public Integer getRequisitionId() {
		return requisitionId;
	}

	public RequisitionService getRequisitionService() {
		return requisitionService;
	}

	public List<Float> getRprices() {
		return rprices;
	}

	public List<Float> getRuprices() {
		return ruprices;
	}

	public List<String> getUserfs() {
		return userfs;
	}

	public User getPickingper() {
		return pickingper;
	}

	public User getConfirmper() {
		return confirmper;
	}

	public void setConfirmper(User confirmper) {
		this.confirmper = confirmper;
	}

	public void setPickingper(User pickingper) {
		this.pickingper = pickingper;
	}

	public String list() {

		pm = requisitionService.getPagerDesc(Requisition.class);

		picgoods = picgoodService.findByHql("from Picgood");
		return "list";
	}

	public String search() {
		Map<String, String> likeMap = new HashMap<String, String>();
		likeMap.put("company", requisition.getCompany());

		pm = requisitionService.fuzzyQuery(Requisition.class, likeMap);
		;
		return "list";
	}

	
	
	public void setCalunits(List<String> calunits) {
		this.calunits = calunits;
	}

	public void setDeliverDate(Date deliverDate) {
		this.deliverDate = deliverDate;
	}

	public void setDptmanager(Integer dptmanager) {
		this.dptmanager = dptmanager;
	}

	public void setFactnums(List<Integer> factnums) {
		this.factnums = factnums;
	}

	public void setItemTypeId(Integer itemTypeId) {
		this.itemTypeId = itemTypeId;
	}

	public void setItemTypeIds(List<Integer> itemTypeIds) {
		this.itemTypeIds = itemTypeIds;
	}

	@Resource
	public void setItemTypeService(ItemTypeService itemTypeService) {
		this.itemTypeService = itemTypeService;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	public void setPicgood(Picgood picgood) {
		this.picgood = picgood;
	}

	public void setPicgoodId(Integer picgoodId) {
		this.picgoodId = picgoodId;
	}

	public void setPicgoods(List<Picgood> picgoods) {
		this.picgoods = picgoods;
	}

	@Resource
	public void setPicgoodService(PicgoodService picgoodService) {
		this.picgoodService = picgoodService;
	}

	public void setPm(PagerModel pm) {
		this.pm = pm;
	}

	public void setReqnums(List<Integer> reqnums) {
		this.reqnums = reqnums;
	}

	public void setRequisition(Requisition requisition) {
		this.requisition = requisition;
	}

	public void setRequisitionId(Integer requisitionId) {
		this.requisitionId = requisitionId;
	}

	@Resource
	public void setRequisitionService(RequisitionService requisitionService) {
		this.requisitionService = requisitionService;
	}

	public void setRprices(List<Float> rprices) {
		this.rprices = rprices;
	}

	public void setRuprices(List<Float> ruprices) {
		this.ruprices = ruprices;
	}

	public void setUserfs(List<String> userfs) {
		this.userfs = userfs;
	}

	public List<Employee> getDptmanagers() {
		return dptmanagers;
	}

	public void setDptmanagers(List<Employee> dptmanagers) {
		this.dptmanagers = dptmanagers;
	}

	public EmployeeService getEmployeeService() {
		return employeeService;
	}

	@Resource
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}
	
}
