package com.fjsdfx.starerp.purchase.action;

import com.fjsdfx.starerp.security.model.User;
import org.springframework.security.context.SecurityContextHolder;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.hibernate.mapping.Array;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.service.DepartmentService;
import com.fjsdfx.starerp.produce.model.Trackingtest;
import com.fjsdfx.starerp.produce.service.TrackingtestService;
import com.fjsdfx.starerp.purchase.model.Samidentified;
import com.fjsdfx.starerp.purchase.model.Supidentified;
import com.fjsdfx.starerp.purchase.model.Supplierinfo;
import com.fjsdfx.starerp.purchase.model.Testnotes;
import com.fjsdfx.starerp.purchase.service.SamidentifiedService;
import com.fjsdfx.starerp.purchase.service.SupidentifiedService;
import com.fjsdfx.starerp.purchase.service.SupplierinfoService;
import com.fjsdfx.starerp.purchase.service.TestnotesService;
import com.sun.org.apache.bcel.internal.generic.NEW;

/**
 * @author Lu_Zhongchao
 *
 */
@Controller
@Scope("prototype")
public class SupidentifiedAction {
	
	private Logger logger=LoggerFactory.getLogger(SupidentifiedAction.class);
	private Supidentified supidentified;
	private SupidentifiedService supidentifiedService;
	private DepartmentService departmentService;
	private SupplierinfoService supplierinfoService;
	private Samidentified samidentified;
	private List<Samidentified> samidentifieds=new ArrayList<Samidentified>();
	private List<Department> departmentList=new ArrayList<Department>();
	private SamidentifiedService samidentifiedService;
	private TestnotesService testnotesService;
	private List<Testnotes> testnotess;
	private Integer supidentifiedId;
	private Integer supplierinfoId;
	private Integer reqdptId;
	private Integer recdptId;
	private Integer step;
	private Integer samidentifiedId;
	private User auditUser;
	private Supplierinfo supplier;
	private List<Trackingtest> trackingtest;
	private TrackingtestService trackingtestService;
	
	

	public List<Trackingtest> getTrackingtest() {
		return trackingtest;
	}
	public void setTrackingtest(List<Trackingtest> trackingtest) {
		this.trackingtest = trackingtest;
	}
	public TrackingtestService getTrackingtestService() {
		return trackingtestService;
	}
@Resource
	public void setTrackingtestService(TrackingtestService trackingtestService) {
		this.trackingtestService = trackingtestService;
	}

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

	public Supplierinfo getSupplier() {
		return supplier;
	}

	public void setSupplier(Supplierinfo supplier) {
		this.supplier = supplier;
	}

	public User getAuditUser() {
		return auditUser;
	}

	public void setAuditUser(User auditUser) {
		this.auditUser = auditUser;
	}

	public Supidentified getSupidentified() {
		return supidentified;
	}

	public void setSupidentified(Supidentified supidentified) {
		this.supidentified = supidentified;
	}

	public SupidentifiedService getSupidentifiedService() {
		return supidentifiedService;
	}

	@Resource
	public void setSupidentifiedService(SupidentifiedService supidentifiedService) {
		this.supidentifiedService = supidentifiedService;
	}

	public DepartmentService getDepartmentService() {
		return departmentService;
	}

	@Resource
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}

	public SupplierinfoService getSupplierinfoService() {
		return supplierinfoService;
	}

	@Resource
	public void setSupplierinfoService(SupplierinfoService supplierinfoService) {
		this.supplierinfoService = supplierinfoService;
	}

	public Integer getSupidentifiedId() {
		return supidentifiedId;
	}

	public void setSupidentifiedId(Integer supidentifiedId) {
		this.supidentifiedId = supidentifiedId;
	}

	public Integer getSupplierinfoId() {
		return supplierinfoId;
	}

	public void setSupplierinfoId(Integer supplierinfoId) {
		this.supplierinfoId = supplierinfoId;
	}

	public Integer getReqdptId() {
		return reqdptId;
	}

	public void setReqdptId(Integer reqdptId) {
		this.reqdptId = reqdptId;
	}

	public Integer getRecdptId() {
		return recdptId;
	}

	public void setRecdptId(Integer recdptId) {
		this.recdptId = recdptId;
	}

	public List<Samidentified> getSamidentifieds() {
		return samidentifieds;
	}

	public void setSamidentifieds(List<Samidentified> samidentifieds) {
		this.samidentifieds = samidentifieds;
	}

	public SamidentifiedService getSamidentifiedService() {
		return samidentifiedService;
	}

	@Resource
	public void setSamidentifiedService(SamidentifiedService samidentifiedService) {
		this.samidentifiedService = samidentifiedService;
	}

	public TestnotesService getTestnotesService() {
		return testnotesService;
	}

	@Resource
	public void setTestnotesService(TestnotesService testnotesService) {
		this.testnotesService = testnotesService;
	}

	public List<Testnotes> getTestnotess() {
		return testnotess;
	}

	public void setTestnotess(List<Testnotes> testnotess) {
		this.testnotess = testnotess;
	}

	public Integer getSamidentifiedId() {
		return samidentifiedId;
	}

	public void setSamidentifiedId(Integer samidentifiedId) {
		this.samidentifiedId = samidentifiedId;
	}

	public Samidentified getSamidentified() {
		return samidentified;
	}

	public void setSamidentified(Samidentified samidentified) {
		this.samidentified = samidentified;
	}

	public List<Department> getDepartmentList() {
		return departmentList;
	}

	public void setDepartmentList(List<Department> departmentList) {
		this.departmentList = departmentList;
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
	public String list()
	{
		pm=supidentifiedService.getPagerDesc(Supidentified.class);
		return "list";
	}
	/**
	 * 需审核列表
	 */
	public String examlist()
	{
		pm=supidentifiedService.getPagerDesc(Supidentified.class,"where o.purresper.empId is not null and o.manper.empId is null");
		return "examine_list";
	}
	/**
	 * 查询
	 */
	public String search()
	{
		Map<String,String> like=new HashMap<String,String>();
		like.put("supplierinfo.supcname", supidentified.getSupplierinfo().getSupcname());
		pm=supidentifiedService.fuzzyQuery(Supidentified.class, like);
		return "list";
	}
	/**
	 * 可添加列表查询
	 */
	public String searchadd()
	{
		pm=supidentifiedService.getPagerDesc(Supidentified.class);
		List<Supidentified> sups=pm.getDatas();
		List<Samidentified> ss=new ArrayList<Samidentified>();
		List<Samidentified> sr=new ArrayList<Samidentified>();
/*		testnotess=testnotesService.findByHql("from Testnotes");
		for(Testnotes ts:testnotess){
			Samidentified samidentified=samidentifiedService.findById(Samidentified.class, ts.getSamid());
			ss.add(samidentified);
		}*/
        trackingtest=trackingtestService.findByHql("from Trackingtest t where t.manger.empId is not null");
		
		for(Trackingtest ts:trackingtest){
			Samidentified samidentified=samidentifiedService.findById(Samidentified.class, ts.getTestnotes().getSamid());
			ss.add(samidentified);
		}
		for(Supidentified sup:sups){
			Samidentified sam=samidentifiedService.findById(Samidentified.class, sup.getSamid());
			ss.remove(sam);
		}
		
		Map<String,String> like=new HashMap<String,String>();
		like.put("supplierinfo.supcname", samidentified.getSupplierinfo().getSupcname());
		pm=samidentifiedService.fuzzyQuery(Samidentified.class, like);
		sr=pm.getDatas();
		for(Samidentified s1:ss){
			for(Samidentified s2:sr){
				if (s1.getId()==s2.getId()) {
					samidentifieds.add(s1);
				}
			}
		}
		return "toadd";
	}
	/**
	 * 需审核列表查询
	 */
	public String searchlist()
	{
		Map<String,String> like=new HashMap<String,String>();
		like.put("supplierinfo.supcname", supidentified.getSupplierinfo().getSupcname());
		pm=supidentifiedService.fuzzyQuery(Supidentified.class, like);
		return "examine_list";
	}
	/**
	 * 可添加列表
	 */
	public String showsamidentified()
	{
		samidentified=samidentifiedService.findById(Samidentified.class, samidentifiedId);
		return "show_samidentified";
	}
	
	/**
	 * 可添加列表
	 */
	public String toadd()
	{
		pm=supidentifiedService.getPagerDesc(Supidentified.class);
		List<Supidentified> sups=pm.getDatas();
		//testnotess=testnotesService.findByHql("from Testnotes o where o.quamanper.empId is not null");
	    trackingtest=trackingtestService.findByHql("from Trackingtest t where t.manger.empId is not null");
		
		for(Trackingtest ts:trackingtest){
			Samidentified samidentified=samidentifiedService.findById(Samidentified.class, ts.getTestnotes().getSamid());
			samidentifieds.add(samidentified);
		}
//		samidentifieds=samidentifiedService.findByHql("from Samidentified s where s.id in (select tk.testnotes.samid from Trackingtest tk)");
	
		
		for(Supidentified sup:sups){
			Samidentified sam=samidentifiedService.findById(Samidentified.class, sup.getSamid());
			samidentifieds.remove(sam);
		}
		return "toadd";
	}
	
	public String add() throws ParseException
	{
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		Department department;
		if(null!=reqdptId&&null!=recdptId&&null!=supplierinfoId&&null!=supidentified.getReqper().getEmpId()
				&&null!=supidentified.getReqdate()&&null!=supidentified.getRecper()&&null!=supidentified.getRecdate()
				&&null!=supidentified.getDirectosales())
		{
			department=departmentService.findById(Department.class, reqdptId);
			supidentified.setReqdpt(department);
			department=departmentService.findById(Department.class, recdptId);
			supidentified.setRecdpt(department);
			Supplierinfo supplierinfo=supplierinfoService.findById(Supplierinfo.class, supplierinfoId);
			supidentified.setSupplierinfo(supplierinfo);
		
		supidentifiedService.saveAndRefresh(supidentified);
		logger.warn(auditUser.getId()+"add id="+supidentified.getId());
		return "pub_add_success";
		}
		return "pub_exception";
	}
	
	public String update() 
	{
		
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		Department department;
		if(null!=reqdptId&&null!=recdptId&&null!=supplierinfoId&&null!=supidentified.getReqper().getEmpId()
				&&null!=supidentified.getReqdate()&&null!=supidentified.getRecper()&&null!=supidentified.getRecdate()
				&&null!=supidentified.getDirectosales())
		{
			department=departmentService.findById(Department.class, reqdptId);
			supidentified.setReqdpt(department);
			department=departmentService.findById(Department.class, recdptId);
			supidentified.setRecdpt(department);
			Supplierinfo supplierinfo=supplierinfoService.findById(Supplierinfo.class, supplierinfoId);
			supidentified.setSupplierinfo(supplierinfo);
		supidentifiedService.update(supidentified);
		logger.warn(auditUser.getId()+"update id="+supidentified.getId());
		
	if(null!=supidentified.getManper()){
			supplier=supplierinfoService.findById(Supplierinfo.class, supplierinfoId);
		return "addTo_quaplist";
		//	return "p"
	}
		return "pub_update_success";
		}
		return "pub_exception";
	}
	
	public String show()
	{
		supidentified=supidentifiedService.findById(Supidentified.class, supidentifiedId);
		return "show";
	}
	
	public String del()
	{
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		supidentifiedService.deleteById(Supidentified.class, supidentifiedId);
		logger.warn(auditUser.getId()+"del id="+supidentifiedId);
		return "pub_del_success";
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
		samidentified=samidentifiedService.findById(Samidentified.class, samidentifiedId);
		return "add_input";
	}
	/**
	 * 跳转审核页面
	 */
	public String examine()
	{
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		supidentified=supidentifiedService.findById(Supidentified.class, supidentifiedId);
		return "examine";
	}
	/**
	 * 采购认定页面
	 */
	public String purexamine()
	{
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		supidentified=supidentifiedService.findById(Supidentified.class, supidentifiedId);
		return "pur_examine";
	}
	/**
	 * 跳转编辑页面
	 */
	public String editInput()
	{
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		departmentList=departmentService.findByHql("from Department");
		supidentified=supidentifiedService.findById(Supidentified.class, supidentifiedId);
		return "edit_input";
	}

}
