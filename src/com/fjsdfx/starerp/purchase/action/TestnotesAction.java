package com.fjsdfx.starerp.purchase.action;

import com.fjsdfx.starerp.security.model.User;
import org.springframework.security.context.SecurityContextHolder;

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
import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.service.DepartmentService;
import com.fjsdfx.starerp.purchase.model.Samidentified;
import com.fjsdfx.starerp.purchase.model.Supplierinfo;
import com.fjsdfx.starerp.purchase.model.Testnotes;
import com.fjsdfx.starerp.purchase.service.SamidentifiedService;
import com.fjsdfx.starerp.purchase.service.SupplierinfoService;
import com.fjsdfx.starerp.purchase.service.TestnotesService;

/**
 * @author Lu_Zhongchao
 *
 */
@Controller
@Scope("prototype")
public class TestnotesAction {
	
	private Logger logger=LoggerFactory.getLogger(TestnotesAction.class);
	private Testnotes testnotes;
	private TestnotesService testnotesService;
	private Integer testnotesId;
	private SamidentifiedService samidentifiedService;
	private Samidentified samidentified;
	private Integer samidentifiedId;
	private Integer departmentId;
	private Integer supplierinfoId;
	private Integer step;
	private SupplierinfoService supplierinfoService;
	private List<Department> departmentList;
	private DepartmentService departmentService;
	private User auditUser;
	
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

	public User getAuditUser() {
		return auditUser;
	}

	public void setAuditUser(User auditUser) {
		this.auditUser = auditUser;
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
	
	public SamidentifiedService getSamidentifiedService() {
		return samidentifiedService;
	}
	
	@Resource
	public void setSamidentifiedService(SamidentifiedService samidentifiedService) {
		this.samidentifiedService = samidentifiedService;
	}

	public Integer getTestnotesId() {
		return testnotesId;
	}

	public void setTestnotesId(Integer testnotesId) {
		this.testnotesId = testnotesId;
	}
	


	public Samidentified getSamidentified() {
		return samidentified;
	}

	public void setSamidentified(Samidentified samidentified) {
		this.samidentified = samidentified;
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


	public Integer getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
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
	 * 跳转到编辑页面
	 */
	public String show()
	{
		testnotes=testnotesService.findById(Testnotes.class, testnotesId);
		return "show";
	}
	/**
	 * 未审核列表
	 */
	public String list()
	{
		pm=testnotesService.getPagerDesc(Testnotes.class);
		return "list";
	}
	/**
	 * 添加量试过程列表
	 */
	public String trackingtestaddlist()
	{
		
		pm=testnotesService.getPagerDesc(Testnotes.class,"where o.tracktestId is  null");
		return "trackingtest_addlist";
	}
	
	/**
	 * 显示可添加列表
	 */
	public String samidList()
	{
		pm=samidentifiedService.getPagerDesc(Samidentified.class,"where o.entest is null and o.charge.empId is not null");
		return "samid_list";
	}
	
	/**
	 * 需审核列表
	 */
	public String examlist()
	{
		pm=testnotesService.getPagerDesc(Testnotes.class, "where o.quamanper.empId is null");
		return "examine_list";
	}
	
	/**
	 * 添加
	 */
	public String add() throws Exception
	{
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		if(null!=departmentId&&null!=samidentifiedId&&null!=testnotes.getTiems()&&null!=testnotes.getSamid()
				&&null!=testnotes.getPurdate()&&null!=testnotes.getPurdate())
		{

			Department department=departmentService.findById(Department.class, departmentId);
			Samidentified samidentified=samidentifiedService.findById(Samidentified.class, samidentifiedId);
			samidentified.setEntest(true);
			samidentifiedService.update(samidentified);
			testnotes.setSupplierinfo(samidentified.getSupplierinfo());
			testnotes.setDepartment(department);
			testnotesService.saveAndRefresh(testnotes);
			logger.warn(auditUser.getId()+"add id="+testnotes.getId());
			return "pub_add_success";
		}
		throw new Exception(" add error!");
	}
	/**
	 * 更新
	 */
	public String update()
	{
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		if(null!=departmentId&&null!=testnotes.getTiems()&&null!=testnotes.getSamid()
				&&null!=testnotes.getPurdate()&&null!=testnotes.getPurmdate())
		{
		Department department=departmentService.findById(Department.class, departmentId);
		Supplierinfo supplierinfo=supplierinfoService.findById(Supplierinfo.class, supplierinfoId);
		testnotes.setSupplierinfo(supplierinfo);
		testnotes.setDepartment(department);
		testnotesService.update(testnotes);
		logger.warn(auditUser.getId()+"add id="+testnotes.getId());
		return "pub_update_success";
		}

		return "pub_exception";
		
	}
	
	/**
	 * 未审核列表查询
	 */
	public String search()
	{
		Map<String,String> like=new HashMap<String,String>();
		like.put("supplierinfo.supcname", testnotes.getSupplierinfo().getSupcname());
		pm=testnotesService.fuzzyQuery(Testnotes.class, like);
		return "list";
	}
	/**
	 * 添加量试过程列表查询
	 */
	public String searchaddlist()
	{
		Map<String,String> like=new HashMap<String,String>();
		like.put("supplierinfo.supcname", testnotes.getSupplierinfo().getSupcname());
		pm=testnotesService.fuzzyQuery(Testnotes.class, like);
		return "trackingtest_addlist";
	}
	
	/**
	 * 需审核列表查询
	 */
	public String searchlist()
	{
		Map<String,String> like=new HashMap<String,String>();
		like.put("supplierinfo.supcname", testnotes.getSupplierinfo().getSupcname());
		pm=testnotesService.fuzzyQuery(Testnotes.class, like);
		return "examine_list";
	}
	/**
	 * 添加量试列表查询
	 */
	public String searchtest()
	{
		Map<String,String> like=new HashMap<String,String>();
		like.put("supplierinfo.supcname", samidentified.getSupplierinfo().getSupcname());
		pm=samidentifiedService.fuzzyQuery(Samidentified.class, like);
		return "samid_list";
	}
	
	/**
	 * 删除
	 */
	public String del()
	{
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		testnotesService.deleteById(Testnotes.class, testnotesId);
		logger.warn(auditUser.getName()+"del id="+testnotesId);
		return "pub_del_success";
	}
	
	/**
	 * 采购主管签名
	 */
	public String purexam()
	{
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		testnotes=testnotesService.findById(Testnotes.class, testnotesId);
		logger.warn("del id="+samidentifiedId);
		return "pur_exam";
	}
	
	/*==============Input页面===========================================*/
	public String updateInput()
	{
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		if(null!=departmentId&&null!=testnotes.getTiems()&&null!=testnotes.getSamid()
				&&null!=testnotes.getPurdate())
		{
		Department department=departmentService.findById(Department.class, departmentId);
		Supplierinfo supplierinfo=supplierinfoService.findById(Supplierinfo.class, supplierinfoId);
		testnotes.setSupplierinfo(supplierinfo);
		testnotes.setDepartment(department);
		testnotesService.update(testnotes);
		logger.warn(auditUser.getId()+"add id="+testnotes.getId());
		return "pub_update_success";
		}

		return "pub_exception";
		
	}
	
	
	/**
	 * 跳转到添加页面
	 */
	public String addInput()
	{
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		samidentified=samidentifiedService.findById(Samidentified.class, samidentifiedId);
		departmentList=departmentService.findByHql("from Department");
		return "add_input";
	}
	
	/**
	 * 跳转到编辑页面
	 */
	public String editInput()
	{
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		testnotes=testnotesService.findById(Testnotes.class, testnotesId);
		departmentList=departmentService.findByHql("from Department");
		return "edit_input";
	}
	
	/**
	 * 跳转让审核页面
	 */
	public String examine()
	{
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		testnotes=testnotesService.findById(Testnotes.class, testnotesId);
		return "examine";
	}

	public String notesshow(){
		
		
		testnotes=testnotesService.findById(Testnotes.class, testnotesId);
		return "shownotes";
	}
}
