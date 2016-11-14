package com.fjsdfx.starerp.purchase.action;

import com.fjsdfx.starerp.security.model.User;
import org.springframework.security.context.SecurityContextHolder;

import java.awt.print.Printable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ItemTypeService;
import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.model.Employee;
import com.fjsdfx.starerp.persons.service.DepartmentService;
import com.fjsdfx.starerp.persons.service.EmployeeService;
import com.fjsdfx.starerp.purchase.service.SamidentifiedService;
import com.fjsdfx.starerp.purchase.service.SupplierinfoService;
import com.fjsdfx.starerp.purchase.model.Samidentified;
import com.fjsdfx.starerp.purchase.model.Supplierinfo;

/**
 * @author Lu_Zhongchao
 *
 */
@Controller
@Scope("prototype")
public class SamidentifiedAction {
	
	private Logger logger=LoggerFactory.getLogger(SamidentifiedAction.class);
	private Samidentified samidentified;
	private SamidentifiedService samidentifiedService;
	private Integer resperId;
	private Integer samidentifiedId;
	private Integer supplierinfoId;
	private Integer itemtypeId;
	private Integer departmentId;
	private Integer step;
	private List<Department> departmentList;
	private DepartmentService departmentService;
	private User auditUser;

	private SupplierinfoService supplierinfoService;
	
	private ItemTypeService itemtypeService;
	
	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	public Integer getStep() {
		return step;
	}

	public void setStep(Integer step) {
		this.step = step;
	}

	public Integer getResperId() {
		return resperId;
	}

	public void setResperId(Integer resperId) {
		this.resperId = resperId;
	}

	public User getAuditUser() {
		return auditUser;
	}

	public void setAuditUser(User auditUser) {
		this.auditUser = auditUser;
	}

	public Samidentified getSamidentified() {
		return samidentified;
	}

	public void setSamidentified(Samidentified samidentified) {
		this.samidentified = samidentified;
	}

	public SamidentifiedService getSamidentifiedService() {
		return samidentifiedService;
	}
	
	@Resource
	public void setSamidentifiedService(SamidentifiedService samidentifiedService) {
		this.samidentifiedService = samidentifiedService;
	}
	

	public Integer getSamidentifiedId() {
		return samidentifiedId;
	}

	public void setSamidentifiedId(Integer samidentifiedId) {
		this.samidentifiedId = samidentifiedId;
	}
	
	public SupplierinfoService getSupplierinfoService() {
		return supplierinfoService;
	}
	
	@Resource
	public void setSupplierinfoService(SupplierinfoService supplierinfoService) {
		this.supplierinfoService = supplierinfoService;
	}
	public Integer getSupplierinfoId() {
		return supplierinfoId;
	}

	public void setSupplierinfoId(Integer supplierinfoId) {
		this.supplierinfoId = supplierinfoId;
	}

	public ItemTypeService getItemtypeService() {
		return itemtypeService;
	}
	
	@Resource
	public void setItemtypeService(ItemTypeService itemtypeService) {
		this.itemtypeService = itemtypeService;
	}

	public Integer getItemtypeId() {
		return itemtypeId;
	}

	public void setItemtypeId(Integer itemtypeId) {
		this.itemtypeId = itemtypeId;
	}

	public Integer getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}

	private String newitem;
	private String newsup;
	private String techchange;
	private String redcost;
	private String entest;

	public String getNewitem() {
		return newitem;
	}

	public void setNewitem(String newitem) {
		this.newitem = newitem;
	}


	public String getNewsup() {
		return newsup;
	}

	public void setNewsup(String newsup) {
		this.newsup = newsup;
	}

	public String getTechchange() {
		return techchange;
	}

	public void setTechchange(String techchange) {
		this.techchange = techchange;
	}

	public String getRedcost() {
		return redcost;
	}

	public void setRedcost(String redcost) {
		this.redcost = redcost;
	}

	public String getEntest() {
		return entest;
	}

	public void setEntest(String entest) {
		this.entest = entest;
	}

	public List<Department> getDepartmentList() {
		return departmentList;
	}

	public void setDepartmentList(List<Department> departmentList) {
		this.departmentList = departmentList;
	}

	public DepartmentService getDepartmentService() {
		return departmentService;
	}

	@Resource
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}


	/**
	 * 分页的pagermodel
	 */
	private PagerModel pm;
	public PagerModel getPm() {
		return pm;
	}

	public void setPm(PagerModel pm) {
		this.pm = pm;
	}
	
	/*==============各种Action===========================================*/
	/**
	 * 添加
	 */
	public String add() throws Exception
	{

		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		if(null!=newitem)samidentified.setNewitem(true);
		if(null!=newsup)samidentified.setNewsup(true);
		if(null!=techchange)samidentified.setTechchange(true);
		if(null!=redcost)samidentified.setRedcost(true);
		if(null!=entest)samidentified.setEntest(true);
		if(null!=departmentId&&null!=supplierinfoId&&null!=itemtypeId&&null!=samidentified.getHangding().getEmpId()
				&&null!=samidentified.getSamdate()&&null!=samidentified.getReqtime()&&null!=samidentified.getMcodename()
				&&null!=samidentified.getBrand()&&null!=samidentified.getNum()&&null!=samidentified.getUprice())
		{
			Supplierinfo supplierinfo=supplierinfoService.findById(Supplierinfo.class, supplierinfoId);
			ItemType itemtype=itemtypeService.findById(ItemType.class, itemtypeId);
			Department department=departmentService.findById(Department.class, departmentId);
			samidentified.setSupplierinfo(supplierinfo);
			samidentified.setItemtype(itemtype);
			samidentified.setDepartment(department);
			samidentifiedService.saveAndRefresh(samidentified);
			logger.warn(auditUser.getId()+"add id="+samidentified.getId());
			return "pub_add_success";
		}
		throw new Exception("add error!");
		
	}
	
	/**
	 * 更新
	 */
	public String update() throws Exception
	{
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		if(null!=newitem)samidentified.setNewitem(true);
		if(null!=newsup)samidentified.setNewsup(true);
		if(null!=techchange)samidentified.setTechchange(true);
		if(null!=redcost)samidentified.setRedcost(true);
		if(null!=entest)samidentified.setEntest(true);
		if(null!=departmentId)samidentified.setDepartment(departmentService.findById(Department.class, departmentId));

		if(null!=departmentId&&null!=supplierinfoId&&null!=itemtypeId&&null!=samidentified.getHangding().getEmpId()
				&&null!=samidentified.getSamdate()&&null!=samidentified.getReqtime()&&null!=samidentified.getMcodename()
				&&null!=samidentified.getBrand()&&null!=samidentified.getNum()&&null!=samidentified.getUprice())
		{
			Supplierinfo supplierinfo=supplierinfoService.findById(Supplierinfo.class, supplierinfoId);
			ItemType itemtype=itemtypeService.findById(ItemType.class, itemtypeId);
			samidentified.setSupplierinfo(supplierinfo);
			samidentified.setDepartment(departmentService.findById(Department.class, departmentId));
			samidentified.setItemtype(itemtype);
		
		samidentifiedService.update(samidentified);
		logger.warn(auditUser.getId()+"update id="+samidentified.getId());
		return "pub_update_success";
		}
	   throw new Exception("update error!");
	}
	/**
	 * 未审核列表
	 */
	public String list()
	{
		pm=samidentifiedService.getPagerDesc(Samidentified.class);
		return "list";
	}
	/**
	 * 需审核列表
	 */
	public String examlist()
	{
		pm=samidentifiedService.getPagerDesc(Samidentified.class, "where o.resper.empId is not null and o.opiniondate is null");
		return "examine_list";
	}
	/**
	 * 未审核列表查询
	 */
	public String search()
	{
		Map<String,String> like=new HashMap<String,String>();
		like.put("supplierinfo.supcname", samidentified.getSupplierinfo().getSupcname());
		pm=samidentifiedService.fuzzyQuery(Samidentified.class, like);
		return "list";
	}
	/**
	 * 需审核列表查询
	 */
	public String searchlist()
	{
		Map<String,String> like=new HashMap<String,String>();
		like.put("supplierinfo.supcname", samidentified.getSupplierinfo().getSupcname());
		pm=samidentifiedService.fuzzyQuery(Samidentified.class, like);
		return "examine_list";
	}
	/**
	 * 删除
	 */
	public String del()
	{
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		samidentifiedService.deleteById(Samidentified.class, samidentifiedId);
		logger.warn(auditUser.getId()+"del id="+samidentifiedId);
		return "pub_del_success";
	}
	/**
	 * 负责人签名
	 */
	public String resperexam()
	{
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		samidentified=samidentifiedService.findById(Samidentified.class, samidentifiedId);
		logger.warn("del id="+samidentifiedId);
		return "resper_exam";
	}
	
	/*==============Input页面===========================================*/
	/**
	 * 跳转添加页面
	 */
	public String addInput()
	{
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		departmentList=departmentService.findByHql("from Department");
		return "add_input";
	}
	/**
	 * 查看样品认定报告单
	 */
	public String show()
	{
		samidentified=samidentifiedService.findById(Samidentified.class, samidentifiedId);
		return "show";
	}
	/**
	 * 准备添加量试通知
	 */
	public String showTest()
	{
		samidentified=samidentifiedService.findById(Samidentified.class, samidentifiedId);
		return "show_test";
	}
	/**
	 * 跳转审核页面
	 */
	public String examine()
	{
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		samidentified=samidentifiedService.findById(Samidentified.class, samidentifiedId);
		return "examine";
	}
	/**
	 * 跳转让编辑页面
	 */
	public String editInput()
	{
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		samidentified=samidentifiedService.findById(Samidentified.class, samidentifiedId);
		departmentList=departmentService.findByHql("from Department");
		return "edit_input";
	}

}
