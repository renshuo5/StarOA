package com.fjsdfx.starerp.produce.action;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.item.model.Item;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ItemService;
import com.fjsdfx.starerp.item.service.ItemTypeService;
import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.model.Employee;
import com.fjsdfx.starerp.persons.service.DepartmentService;
import com.fjsdfx.starerp.persons.service.EmployeeService;
import com.fjsdfx.starerp.produce.model.Pro_schedule;
import com.fjsdfx.starerp.produce.model.Prscheck;
import com.fjsdfx.starerp.produce.model.Shogood;
import com.fjsdfx.starerp.produce.model.Shortm;
import com.fjsdfx.starerp.produce.service.ShogoodService;
import com.fjsdfx.starerp.produce.service.ShortmService;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;

@Controller
@Scope("prototype")
public class ShortmAction {
	private Logger logger = LoggerFactory.getLogger(ShortmAction.class);
 private String  step;
	private ShortmService shortmService;
	private ShogoodService shogoodService;
	private ItemService itemService;
	private DepartmentService departmentService;
	private EmployeeService employeeService;
    private ItemTypeService itemTypeService;
    
    
    
    private ItemType itemType;
	private Employee employee;
	private Shortm shortm;
	private Shogood shogood;
	private Department department;
	private List<Department> departments;
	private List<Shortm> shortms;
	private List<Shogood> shogoods;
	
	private List<Employee> employees;
    private List<String> status;
	private  Integer tatol;
   /**
	 * 分页的pagermodel
	 */
	private PagerModel pm;
	private List<String> item_names;
	private List<String> units;
	private List<Integer> nums;
	private List<String> userfs;
	private List<Float> prices;
	private List<Float> uprices;
	private List<Integer> itemIds;
	private List<Integer> itemTypeIds;
	private Integer shogoodID;
	
	private String state;
    private char check_String;
    private char approv_String;
     public char getCheck_String() {
		return check_String;
	}

	public void setCheck_String(char checkString) {
		check_String = checkString;
	}

	public char getApprov_String() {
		return approv_String;
	}

	public void setApprov_String(char approvString) {
		approv_String = approvString;
	}

	public String getStep() {
		return step;
	}

	public void setStep(String step) {
		this.step = step;
	}

	public List<String> getStatus() {
		return status;
	}

	public void setStatus(List<String> status) {
		this.status = status;
	}



	
    public PagerModel getPm() {
		return pm;
	}

	public void setPm(PagerModel pm) {
		this.pm = pm;
	}

	
	
	
	public Integer getTatol() {
		return tatol;
	}

	public void setTatol(Integer tatol) {
		this.tatol = tatol;
	}

	public List<Shogood> getShogoods() {
		return shogoods;
	}

	public void setShogoods(List<Shogood> shogoods) {
		this.shogoods = shogoods;
	}




	
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	

	

	public List<Employee> getEmployees() {
		return employees;
	}

	public void setEmployees(List<Employee> employees) {
		this.employees = employees;
	}

	public Integer getShogoodID() {
		return shogoodID;
	}

	public void setShogoodID(Integer shogoodID) {
		this.shogoodID = shogoodID;
	}



	private List<String> notes;
	public List<String> getNotes() {
		return notes;
	}

	public void setNotes(List<String> notes) {
		this.notes = notes;
	}



	private Date cdate;
	private Integer shortmID;
	
	public List<Shortm> getShortms() {
		return shortms;
	}

	public void setShortms(List<Shortm> shortms) {
		this.shortms = shortms;
	}

   public String getShocheck() {
		return shocheck;
	}

	public void setShocheck(String shocheck) {
		this.shocheck = shocheck;
	}

	public String getApprove() {
		return approve;
	}

	public void setApprove(String approve) {
		this.approve = approve;
	}



private String shocheck;
	private String approve;
	
	public Integer getShortmID() {
		return shortmID;
	}

	public void setShortmID(Integer shortmID) {
		this.shortmID = shortmID;
	}

	public ShortmService getShortmService() {
		return shortmService;
	}

	@Resource
	public void setShortmService(ShortmService shortmService) {
		this.shortmService = shortmService;
	}

	public ShogoodService getShogoodService() {
		return shogoodService;
	}

	@Resource
	public void setShogoodService(ShogoodService shogoodService) {
		this.shogoodService = shogoodService;
	}

	public DepartmentService getDepartmentService() {
		return departmentService;
	}

	@Resource
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public Shortm getShortm() {
		return shortm;
	}

	public void setShortm(Shortm shortm) {
		this.shortm = shortm;
	}

	public Shogood getShogood() {
		return shogood;
	}

	public void setShogood(Shogood shogood) {
		this.shogood = shogood;
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

	public List<String> getItem_names() {
		return item_names;
	}

	public void setItem_names(List<String> itemNames) {
		item_names = itemNames;
	}

	public List<String> getUnits() {
		return units;
	}

	public void setUnits(List<String> units) {
		this.units = units;
	}

	public List<Integer> getNums() {
		return nums;
	}

	public void setNums(List<Integer> nums) {
		this.nums = nums;
	}

	public List<String> getUserfs() {
		return userfs;
	}

	public void setUserfs(List<String> userfs) {
		this.userfs = userfs;
	}

	public List<Float> getPrices() {
		return prices;
	}

	public void setPrices(List<Float> prices) {
		this.prices = prices;
	}

	public List<Float> getUprices() {
		return uprices;
	}

	public void setUprices(List<Float> uprices) {
		this.uprices = uprices;
	}

	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}
	public List<Integer> getItemIds() {
		return itemIds;
	}

	public void setItemIds(List<Integer> itemIds) {
		this.itemIds = itemIds;
	}

	public Date getCdate() {
		return cdate;
	}

	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}

	public ItemService getItemService() {
		return itemService;
	}

	@Resource
	public void setItemService(ItemService itemService) {
		this.itemService = itemService;
	}

	public EmployeeService getEmployeeService() {
		return employeeService;
	}

	@Resource
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	public List<Integer> getItemTypeIds() {
		return itemTypeIds;
	}

	public void setItemTypeIds(List<Integer> itemTypeIds) {
		this.itemTypeIds = itemTypeIds;
	}
	
	public ItemTypeService getItemTypeService() {
		return itemTypeService;
	}
	@Resource
	public void setItemTypeService(ItemTypeService itemTypeService) {
		this.itemTypeService = itemTypeService;
	}

	public ItemType getItemType() {
		return itemType;
	}

	public void setItemType(ItemType itemType) {
		this.itemType = itemType;
	}

	/************************************* 处理 ************************************/
	  public void saveshogoods(Shortm shortm,List<Integer> itemTypeIds,List<String> units,List<Integer> nums,
				 List<String> userfs,
				 List<Float> prices,
				 List<Float> uprices,List<String> notes){
		 
		
			for (int i = 0; i < itemTypeIds.size(); i++) {
				System.out.println("itemTypeIds["+i+"] = "+itemTypeIds.get(i));
				 Shogood shogood=new Shogood();
			     itemType=itemTypeService.findById(ItemType.class,itemTypeIds.get(i));
				 shogood.setShortm(shortm);
				 shogood.setItemType(itemType);
				 shogood.setUnit(units.get(i));
				 shogood.setNum(nums.get(i));
				 shogood.setUserf(userfs.get(i));
				shogood.setPrice(uprices.get(i)*nums.get(i));
				shogood.setUprice(uprices.get(i));
				shogood.setNote(notes.get(i));
				shogoodService.save(shogood);
			
		 }
	  }
	  
	  
	  public void updateshogoods(Shortm shortm,Shogood shogood,List<Integer> itemTypeIds,List<String> units,List<Integer> nums,
				 List<String> userfs,
				 List<Float> prices,
				 List<Float> uprices,List<String> notes){
		 
			 System.out.println("itemTypeIds.size() = "+itemTypeIds.size());
			for (int i = 0; i < itemTypeIds.size(); i++) {
				System.out.println("itemTypeIds["+i+"] = "+itemTypeIds.get(i));
			     itemType=itemTypeService.findById(ItemType.class,itemTypeIds.get(i));
				 shogood.setShortm(shortm);
				 shogood.setItemType(itemType);
				 shogood.setUnit(units.get(i));
				 shogood.setNum(nums.get(i));
				 shogood.setUserf(userfs.get(i));
				 shogood.setPrice(uprices.get(i)*nums.get(i));
				shogood.setUprice(uprices.get(i));
				shogood.setNote(notes.get(i));
				shogoodService.saveOrUpdate(shogood);
			}
			
	  }
	  
	
	  
	public String list() {
	pm=shortmService.getPagerDesc(Shortm.class,"where o.state='0'");
	employees=employeeService.findByHql("from Employee");
	departments=departmentService.findByHql("from Department");
		return "list";
	}

	public String register_add() {
		departments = departmentService.findByHql("from Department");
		employees=employeeService.findByHql("from Employee");
		
		return "register_add";

	}
	/**模糊查询**/
	public String search(){
		Map<String,String> like=new HashMap<String,String>();
		like.put("employee2.empName",shortm.getEmployee2().getEmpName());
		like.put("department1.dptName",shortm.getDepartment1().getDptName());
		like.put("state",shortm.getState());
		pm=shortmService.fuzzyQuery(Shortm.class, like);
		departments=departmentService.findByHql("from Department");
		employees=employeeService.findByHql("from Employee");
	  return "list";
		
	}

	/**添加缺料单**/
	public String add() {

	 shortm.setState("0");
	   shortmService.save(shortm);
		System.out.println("----------------userfs.size() = "+userfs.size());
		System.out.println("----------------itemTypeIds.size = "+itemTypeIds.size());
        saveshogoods(shortm, itemTypeIds, units, nums, userfs, prices, uprices,notes);
   
		
      logger.warn("add shortm id"+shortm.getId());
		return "pub_add_success";
	}

	/**审核表单页面**/
	public String shortm_approve() {
		System.out.println("shortmID"+shortmID);
		System.out.println("step===="+step);
        shortm=shortmService.findById(Shortm.class,shortmID);
        pm=shogoodService.getPagerDesc(Shogood.class,"where o.shortm.id="+shortmID);
		System.out.println("shortm.getId()="+shortm.getId());
		return "shortm_approve";
	}
	
	
	/**添加审核信息**/
	public String check_approve(){
	
		System.out.println(shortmID);
		  shortm=shortmService.findById(Shortm.class,shortmID);
		  System.out.println("step====="+step);
		  if("1".equals(step))
		  {
			  shortm.setSho_check(shocheck);
			  
			  
		  }
		 if("2".equals(step)&&approve.length()!=0){
			 shortm.setState("1");
		 }else{
			 shortm.setState("0");
		 }
		if ("2".equals(step)) {
			
		  shortm.setApprove(approve);
		}
		shortmService.saveOrUpdate(shortm);
		return "pub_add_success";
	}
	


	
	/**更新缺料单信息**/
	public String edit_input(){
		shortm=shortmService.findById(Shortm.class,shortmID);
		System.out.println("------------------------shortmID="+shortmID);
		   pm=shogoodService.getPagerDesc(Shogood.class,"where o.shortm.id="+shortmID);
		return "edit_input";
	}
	/** 删除整个缺料单**/
	public String shortm_del(){
		shortm=shortmService.findById(Shortm.class,shortmID);
		System.out.println("------------------------shortmID="+shortmID);
		shogoods=shogoodService.getPagerDesc(Shogood.class,"where o.shortm.id="+shortmID).getDatas();
		System.out.println("shogoods==========="+shogoods.size());
		for(int i=0;i<shogoods.size();i++){
		shogoodService.deleteById(Shogood.class,shogoods.get(i).getShog_id());
		}
		
		
		
	  shortmService.deleteById(Shortm.class,shortmID);
		return "pub_del_success";
		
	}
	/** 删除缺料单里的单项**/
	public String shogood_del(){
		System.out.println("------------------------shogoodID="+shogoodID);
		shogoodService.deleteById(Shogood.class,shogoodID);
		return "pub_del_success";
	}
	
	/**编辑缺料单里的缺料品**/
	public String edit_shogood(){
		shortm=shortmService.findById(Shortm.class,shortmID);
		shogood=shogoodService.findById(Shogood.class,shogoodID);
		return "edit_shogood";
		
	}
	/**更新*/
	public String update(){
			System.out.println("----------------userfs.size() = "+userfs.size());
			System.out.println("----------------itemTypeIds.size = "+itemTypeIds.size());
			shortm=shortmService.findById(Shortm.class, shortmID);
			shogood=shogoodService.findById(Shogood.class,shogoodID);
	      updateshogoods(shortm,shogood, itemTypeIds, units, nums, userfs, prices, uprices, notes);
		 return "pub_update_success";
	}
	public String make_list(){
		
		pm=shortmService.getPagerDesc(Shortm.class,"where o.state='1'");
		departments=departmentService.findByHql("from Department");
		employees=employeeService.findByHql("from Employee");
		return "make_list";
	}


}
