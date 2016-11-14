package com.fjsdfx.starerp.produce.action;

import java.text.SimpleDateFormat;




import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.persistence.Id;


import org.hibernate.hql.ast.tree.FromClause;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.security.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;

import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ItemTypeService;
import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.model.Employee;
import com.fjsdfx.starerp.persons.service.DepartmentService;
import com.fjsdfx.starerp.persons.service.EmployeeService;
import com.fjsdfx.starerp.produce.model.Discardproduction;
import com.fjsdfx.starerp.produce.model.Discardreviewf;
import com.fjsdfx.starerp.produce.model.Discardreviews;
import com.fjsdfx.starerp.produce.model.Discardreviewt;
import com.fjsdfx.starerp.produce.model.Discardverify;
import com.fjsdfx.starerp.produce.model.Shogood;
import com.fjsdfx.starerp.produce.model.Shortm;
import com.fjsdfx.starerp.produce.service.DiscardreviewfService;
import com.fjsdfx.starerp.produce.service.DiscardreviewsService;
import com.fjsdfx.starerp.produce.service.DiscardreviewtService;
import com.fjsdfx.starerp.produce.service.DiscardverifyService;
import com.fjsdfx.starerp.produce.service.DiscardverifyproductionService;
import com.fjsdfx.starerp.security.model.User;
import com.fjsdfx.starerp.security.service.UserService;
import com.fjsdfx.starerp.warehouse.model.Warehouse;
import com.fjsdfx.starerp.warehouse.service.WarehouseService;
import com.sun.org.apache.bcel.internal.generic.NEW;
import com.sun.org.apache.regexp.internal.recompile;

/**
 * @author Huang_Jian
 *
 */
@Controller
@Scope("prototype")
public class DiscardverifyAction {
	private List<Department> fdpts;
	private Logger logger=LoggerFactory.getLogger(DiscardverifyAction.class);
    private DepartmentService departmentService;
    private DiscardverifyproductionService discardverifyproductionService;
    private DiscardverifyService discardverifyService;
    private ItemTypeService itemTypeService;
    private EmployeeService employeeService;
    private DiscardreviewfService discardreviewfService;
    private DiscardreviewsService discardreviewsService;
    private DiscardreviewtService discardreviewtService;
    private Discardverify discardverify;
    private Discardproduction discardproduction;
    private Discardreviewf discardreviewf;
    private Discardreviews discardreviews;
    private Discardreviewt discardreviewt;
    private List<Discardreviewf> discardreviewfList;
    private List<Discardreviews> discardreviewsList;
    private List<Discardreviewt> discardreviewtList;
    
    private User pickingper;
    private ItemType itemType;
    private Department department;
    private Employee employee;
    private User rperString;
    private Integer partid;//机型id
    private Integer employeeId;
    private Integer departmentId;
    private Integer itemTypeId;
    private Integer scrId;
    private PagerModel pm;
    private Integer employeeId2;//检验员Id;
    private Integer employeeId3;//主管Id
    
    private Integer discardverifyId;
   // private Integer 
    private WarehouseService warehouseService;
    
    public WarehouseService getWarehouseService() {
		return warehouseService;
	}
	public void setWarehouseService(WarehouseService warehouseService) {
		this.warehouseService = warehouseService;
	}
	/**
     * 审核状态
     */
    private List<String> statusList;
    
    
	public List<String> getStatusList() {
		return statusList;
	}
	public void setStatusList(List<String> statusList) {
		this.statusList = statusList;
	}
	public Integer getScrId() {
		return scrId;
	}
	public void setScrId(Integer scrId) {
		this.scrId = scrId;
	}
	public List<Department> getFdpts() {
		return fdpts;
	}
	public void setFdpts(List<Department> fdpts) {
		this.fdpts = fdpts;
	}
	public Logger getLogger() {
		return logger;
	}
	public void setLogger(Logger logger) {
		this.logger = logger;
	}
	public DepartmentService getDepartmentService() {
		return departmentService;
	}
	@Resource
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}
	public DiscardverifyproductionService getDiscardverifyproductionService() {
		return discardverifyproductionService;
	}
	@Resource
	public void setDiscardverifyproductionService(
			DiscardverifyproductionService discardverifyproductionService) {
		this.discardverifyproductionService = discardverifyproductionService;
	}

	public DiscardverifyService getDiscardverifyService() {
		return discardverifyService;
	}
	@Resource
	public void setDiscardverifyService(DiscardverifyService discardverifyService) {
		this.discardverifyService = discardverifyService;
	}
	
	public ItemTypeService getItemTypeService() {
		return itemTypeService;
	}
	@Resource
	public void setItemTypeService(ItemTypeService itemTypeService) {
		this.itemTypeService = itemTypeService;
	}
	public EmployeeService getEmployeeService() {
		return employeeService;
	}
	@Resource
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}
	public User getRperString() {
		return rperString;
	}
	public void setRperString(User rperString) {
		this.rperString = rperString;
	}
	
	
	
	public DiscardreviewfService getDiscardreviewfService() {
		return discardreviewfService;
	}
	@Resource
	public void setDiscardreviewfService(DiscardreviewfService discardreviewfService) {
		this.discardreviewfService = discardreviewfService;
	}
	public DiscardreviewsService getDiscardreviewsService() {
		return discardreviewsService;
	}
	@Resource
	public void setDiscardreviewsService(DiscardreviewsService discardreviewsService) {
		this.discardreviewsService = discardreviewsService;
	}
	public DiscardreviewtService getDiscardreviewtService() {
		return discardreviewtService;
	}
	@Resource
	public void setDiscardreviewtService(DiscardreviewtService discardreviewtService) {
		this.discardreviewtService = discardreviewtService;
	}
	public Integer getPartid() {
		return partid;
	}
	public void setPartid(Integer partid) {
		this.partid = partid;
	}
	
	public Integer getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
	}
	public Integer getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}
	public Discardverify getDiscardverify() {
		return discardverify;
	}
	public void setDiscardverify(Discardverify discardverify) {
		this.discardverify = discardverify;
	}
	public Discardproduction getDiscardproduction() {
		return discardproduction;
	}
	public void setDiscardproduction(Discardproduction discardproduction) {
		this.discardproduction = discardproduction;
	}

	
	public Discardreviewf getDiscardreviewf() {
		return discardreviewf;
	}
	public void setDiscardreviewf(Discardreviewf discardreviewf) {
		this.discardreviewf = discardreviewf;
	}
	
	public Discardreviews getDiscardreviews() {
		return discardreviews;
	}
	public void setDiscardreviews(Discardreviews discardreviews) {
		this.discardreviews = discardreviews;
	}
	public Discardreviewt getDiscardreviewt() {
		return discardreviewt;
	}
	public void setDiscardreviewt(Discardreviewt discardreviewt) {
		this.discardreviewt = discardreviewt;
	}
	public ItemType getItemType() {
		return itemType;
	}
	public void setItemType(ItemType itemType) {
		this.itemType = itemType;
	}
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
	public Integer getItemTypeId() {
		return itemTypeId;
	}
	public void setItemTypeId(Integer itemTypeId) {
		this.itemTypeId = itemTypeId;
	}
	
	public PagerModel getPm() {
		return pm;
	}
	public void setPm(PagerModel pm) {
		this.pm = pm;
	}
	public Integer getDiscardverifyId() {
		return discardverifyId;
	}
	public void setDiscardverifyId(Integer discardverifyId) {
		this.discardverifyId = discardverifyId;
	}
	
	
	public Integer getEmployeeId2() {
		return employeeId2;
	}
	public void setEmployeeId2(Integer employeeId2) {
		this.employeeId2 = employeeId2;
	}
	public Integer getEmployeeId3() {
		return employeeId3;
	}
	public void setEmployeeId3(Integer employeeId3) {
		this.employeeId3 = employeeId3;
	}
	
	public List<Discardreviewf> getDiscardreviewfList() {
		return discardreviewfList;
	}
	public void setDiscardreviewfList(List<Discardreviewf> discardreviewfList) {
		this.discardreviewfList = discardreviewfList;
	}
	public List<Discardreviews> getDiscardreviewsList() {
		return discardreviewsList;
	}
	public void setDiscardreviewsList(List<Discardreviews> discardreviewsList) {
		this.discardreviewsList = discardreviewsList;
	}
	public List<Discardreviewt> getDiscardreviewtList() {
		return discardreviewtList;
	}
	public void setDiscardreviewtList(List<Discardreviewt> discardreviewtList) {
		this.discardreviewtList = discardreviewtList;
	}
	
	public User getPickingper() {
		return pickingper;
	}
	public void setPickingper(User pickingper) {
		this.pickingper = pickingper;
	}
	/**
	 * 获取当前用户
	 * @return
	 */
	private User users(){
		rperString=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return rperString;
	}
	public String list(){
		itemType=itemTypeService.findById(ItemType.class, itemTypeId);
		fdpts=departmentService.findByHql("from Department ");
		rperString=this.users();
		return "list";
	}
	public String firstlist(){
		pm=discardverifyService.getPager(Discardverify.class);
		//discardreviewf=(discardreviewfService.findByHql("from Discardreviewf  where scaf_id="+discardverify.getScr_id())).get(0);
		//discardreviews=(discardreviewsService.findByHql("from Discardreviews where scas_id="+discardverify.getScr_id())).get(0);
		//discardreviewt=(discardreviewtService.findByHql("from Discardreviewt where scat_id="+discardverify.getScr_id())).get(0);
//		pm = discardreviewfService.getPagerDesc(Discardreviewf.class);
//		 discardreviewf=discardreviewfService.findById(Discardreviewf.class, id);
		//fdpts=departmentService.findByHql("from Department ");
		//rperString=this.users();
		return "first_list";
	}
	public String zjlist(){
		pm=discardverifyService.getPager(Discardverify.class);
		discardreviewfList=discardreviewfService.findByHql("from Discardreviewf");
		discardreviewsList=discardreviewsService.findByHql("from Discardreviews");
		discardreviewtList=discardreviewtService.findByHql("from Discardreviewt");
		
		statusList = new ArrayList<String>();
		System.out.println("step 1");
		for (Discardverify dicardverifyFor : (List<Discardverify>)pm.getDatas()) {
			String statusString="";
			Character disfCharacter='0';
			Character dissCharacter='0';
			Character distCharacter='0';
			dicardverifyFor.getScr_id();
			System.out.println("step 2");
//			List<Discardreviewf> discardreviewfs = discardreviewfService.findByHql("from Discardreviewf df where df.scaf_id=" + dicardverifyFor.getDiscardreviewf().getScaf_id());
//			List<Discardreviews> discardreviewss = discardreviewsService.findByHql("from Discardreviews ds where ds.scas_id=" + dicardverifyFor.getDiscardreviews().getScas_id());
//			List<Discardreviewt> discardreviewts = discardreviewtService.findByHql("from Discardreviewt dt where dt.scat_id=" + dicardverifyFor.getDiscardreviewt().getScat_id());
			disfCharacter=dicardverifyFor.getDiscardreviewf()!=null?'1':'0';
			dissCharacter=dicardverifyFor.getDiscardreviews()!=null?'1':'0';
			distCharacter=dicardverifyFor.getDiscardreviewt()!=null?'1':'0';
				System.out.println("step 3");
//			disfCharacter = discardreviewfs.isEmpty()?'0':'1';
//			dissCharacter = discardreviewss.isEmpty()?'0':'1';
//			distCharacter = discardreviewts.isEmpty()?'0':'1';
			System.out.println("step 4");
			statusString = "" + disfCharacter + dissCharacter + distCharacter;
			statusList.add(statusString);
		}
		
		
		//itemType=itemTypeService.findById(ItemType.class, itemTypeId);
		//fdpts=departmentService.findByHql("from Department ");
		//rperString=this.users();
		return "zj_list";
	}
	public String add() throws Exception{
		if(partid!=null&employeeId!=null&departmentId!=null&itemTypeId!=null){
			discardverify.setItemType(itemTypeService.findById(ItemType.class, partid));
			discardverify.setFdpt(departmentService.findById(Department.class, departmentId));
			discardverify.setEmp_id(employeeService.findById(Employee.class, employeeId));
			discardproduction.setIte_id(itemTypeService.findById(ItemType.class, itemTypeId));
			discardproduction.setScr_id(discardverify);
			//discardproduction.setScr_id(discardverifyService.findById(Discardverify.class, scrId));
		
		try {
			discardverifyService.saveAndRefresh(discardverify);
			discardverifyproductionService.saveAndRefresh(discardproduction);
		} catch (Exception e) {
			
		}
	}else {
		 throw new Exception("机型--或是--出废单位--或是--车间负责--为空!!!");
			//return "pub_exception";
		}
	return "pub_add_success";
	}

	/**
	 * 跳转到品工部审核页面
	 * @return
	 */
	public String inputf(){
		rperString=this.users();
		discardverify=discardverifyService.findById(Discardverify.class, discardverifyId);
		discardproduction=(discardverifyproductionService.findByHql("from Discardproduction where scr_id="+discardverifyId)).get(0);
	
		return "f_input";
	}
	/**
	 * 品工部审核
	 * @return
	 */
	public String fAdd(){
		//if(employeeId2!=null&&employeeId3!=null){
			if(employeeId3!=null){
			//discardreviewf.setInspector(employeeService.findById(Employee.class, employeeId2));
			discardreviewf.setManager((employeeService.findById(Employee.class, employeeId3)));
			Discardreviewf discardreviewf1= discardreviewfService.save(discardreviewf);
		    Discardverify discardverify1=discardverifyService.findById(Discardverify.class, scrId);
		    discardverify1.setDiscardreviewf(discardreviewf1);
		    discardverifyService.update(discardverify1);
		    
		}else {
			return "pub_exception";
		}
		return "return_zjlist";
	}
	/**
	 * 跳转到工艺审核页面
	 * @return
	 */
	public String inputs(){
		rperString=this.users();
		discardverify=discardverifyService.findById(Discardverify.class, discardverifyId);
		discardproduction=(discardverifyproductionService.findByHql("from Discardproduction where scr_id="+discardverifyId)).get(0);
		
		discardreviewf=(discardreviewfService.findByHql("from Discardreviewf  where scaf_id="+discardverify.getDiscardreviewf().getScaf_id())).get(0);
		return "s_input";
	}
	/**
	 * 工艺审核
	 * @return
	 */
	public String sAdd(){
		if(employeeId3!=null){
			//discardreviews.setInspector(employeeService.findById(Employee.class, employeeId2));
			discardreviews.setManager((employeeService.findById(Employee.class, employeeId3)));
			//discardreviews.setDiscardverify(discardverifyService.findById(Discardverify.class, scrId));
			Discardreviews discardreviews1=discardreviewsService.saveAndRefresh(discardreviews);
			  Discardverify discardverify2=discardverifyService.findById(Discardverify.class, scrId);
			  discardverify2.setDiscardreviews(discardreviews1);
			    discardverifyService.update(discardverify2);
		    
		}else {
			return "pub_exception";
		}
		
		return "return_zjlist";
	}
	/**
	 * 跳转到主管审核页面
	 * @return
	 */
	public String inputt(){
		
		rperString=this.users();
		discardverify=discardverifyService.findById(Discardverify.class, discardverifyId);
		discardproduction=(discardverifyproductionService.findByHql("from Discardproduction where scr_id="+discardverifyId)).get(0);
		discardreviewf=(discardreviewfService.findByHql("from Discardreviewf  where scaf_id="+discardverify.getDiscardreviewf().getScaf_id())).get(0);
		discardreviews=(discardreviewsService.findByHql("from Discardreviews where scas_id="+discardverify.getDiscardreviews().getScas_id())).get(0);
		return "t_input";
	}
	/**
	 * 主管审核
	 * @return
	 */
   public String tAdd(){
	   if(employeeId3!=null){
			//discardreviewt.setInspector(employeeService.findById(Employee.class, employeeId2));
			discardreviewt.setManager((employeeService.findById(Employee.class, employeeId3)));
			//discardreviewt.setDiscardverify(discardverifyService.findById(Discardverify.class, scrId));
			Discardreviewt discardreviewt1=discardreviewtService.saveAndRefresh(discardreviewt);
			Discardverify discardverify3=discardverifyService.findById(Discardverify.class, scrId);
			discardverify3.setDiscardreviewt(discardreviewt1);
			discardverifyService.update(discardverify3);
		   }else {
				return "pub_exception";
			}
		
		return "return_zjlist";
	}

}
