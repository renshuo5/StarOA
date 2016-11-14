package com.fjsdfx.starerp.produce.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.security.ui.savedrequest.SavedCookie;
import org.springframework.stereotype.Controller;


import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ItemTypeService;
import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.service.DepartmentService;
import com.fjsdfx.starerp.produce.model.Dailyproduction;
import com.fjsdfx.starerp.produce.model.Dailyproductionform;
import com.fjsdfx.starerp.produce.model.Shogood;
import com.fjsdfx.starerp.produce.model.Shortm;
import com.fjsdfx.starerp.produce.service.DailyproductionService;
import com.fjsdfx.starerp.produce.service.DailyproductionformService;
import com.googlecode.jsonplugin.annotations.JSON;
/**
 *
 * @author ledefe
 *
 */
@org.springframework.stereotype.Controller
@Scope("prototype")
public class DailyProductionAction {
	private Integer mresult;
	private Integer item_id;
	private Integer yresult;
	private Integer daily_num;
	private DailyproductionService dailyProductionService;
	private DailyproductionformService dailyproductionformService;
	private DepartmentService departmentService;
	private ItemTypeService itemTypeService;
	private PagerModel pm;
	private List<Department> departments;
	private Department department;
	private ItemType itemType;
	private Dailyproduction dailyProduction;
	private Dailyproductionform dailyproductionform;
	private List<Dailyproduction> dailyproductions;
	private List<Integer> itemTypeIds;
	private List<Integer> feedDailys;
	private List<Integer> feedMonths;
	private List<Integer> feedYears;
	private List<Integer> planDailys;
	private List<Float> planCompletes;
	private List<Integer> storeDailys;
	private List<Integer> storeMonths;
	private List<Integer> storeYears;
	private List<Float> rateDailys;
	private Integer form_id;
	
	public Integer getMresult() {
		return mresult;
	}
	public void setMresult(Integer mresult) {
		this.mresult = mresult;
	}
	public Integer getItem_id() {
		return item_id;
	}
	public void setItem_id(Integer itemId) {
		item_id = itemId;
	}
	public Integer getYresult() {
		return yresult;
	}
	public void setYresult(Integer yresult) {
		this.yresult = yresult;
	}
	public Integer getDaily_num() {
		return daily_num;
	}
	public void setDaily_num(Integer dailyNum) {
		daily_num = dailyNum;
	}
	@JSON(serialize=false)
	public DepartmentService getDepartmentService() {
		return departmentService;
	}
	@Resource
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}
	@JSON(serialize=false)
	public ItemTypeService getItemTypeService() {
		return itemTypeService;
	}
	@Resource
	public void setItemTypeService(ItemTypeService itemTypeService) {
		this.itemTypeService = itemTypeService;
	}
	@JSON(serialize=false)
	public DailyproductionService getDailyProductionService() {
		return dailyProductionService;
	}
@Resource
	public void setDailyProductionService(
			DailyproductionService dailyProductionService) {
		this.dailyProductionService = dailyProductionService;
	}
@JSON(serialize=false)
	public DailyproductionformService getDailyproductionformService() {
	return dailyproductionformService;
}
	@Resource
public void setDailyproductionformService(
		DailyproductionformService dailyproductionformService) {
	this.dailyproductionformService = dailyproductionformService;
}
	@JSON(serialize=false)
	public List<Dailyproduction> getDailyproductions() {
		return dailyproductions;
	}
	public void setDailyproductions(List<Dailyproduction> dailyproductions) {
		this.dailyproductions = dailyproductions;
	}
	public PagerModel getPm() {
	return pm;
}
public void setPm(PagerModel pm) {
	this.pm = pm;
}
@JSON(serialize=false)
	public List<Department> getDepartments() {
	return departments;
}
public void setDepartments(List<Department> departments) {
	this.departments = departments;
}
@JSON(serialize=false)
	public Department getDepartment() {
	return department;
}
public void setDepartment(Department department) {
	this.department = department;
}
@JSON(serialize=false)
public ItemType getItemType() {
	return itemType;
}
public void setItemType(ItemType itemType) {
	this.itemType = itemType;
}
@JSON(serialize=false)
public Dailyproduction getDailyProduction() {
	return dailyProduction;
}
public void setDailyProduction(Dailyproduction dailyProduction) {
	this.dailyProduction = dailyProduction;
}
@JSON(serialize=false)
public Dailyproductionform getDailyproductionform() {
	return dailyproductionform;
}
public void setDailyproductionform(Dailyproductionform dailyproductionform) {
	this.dailyproductionform = dailyproductionform;
}
@JSON(serialize=false)
public List<Integer> getItemTypeIds() {
	return itemTypeIds;
}
public void setItemTypeIds(List<Integer> itemTypeIds) {
	this.itemTypeIds = itemTypeIds;
}
@JSON(serialize=false)
public List<Integer> getFeedDailys() {
	return feedDailys;
}
public void setFeedDailys(List<Integer> feedDailys) {
	this.feedDailys = feedDailys;
}
@JSON(serialize=false)
public List<Integer> getFeedMonths() {
	return feedMonths;
}

public void setFeedMonths(List<Integer> feedMonths) {
	this.feedMonths = feedMonths;
}
@JSON(serialize=false)
public List<Integer> getFeedYears() {
	return feedYears;
}
public void setFeedYears(List<Integer> feedYears) {
	this.feedYears = feedYears;
}
@JSON(serialize=false)
public List<Integer> getPlanDailys() {
	return planDailys;
}
public void setPlanDailys(List<Integer> planDailys) {
	this.planDailys = planDailys;
}
@JSON(serialize=false)
public List<Float> getPlanCompletes() {
	return planCompletes;
}
public void setPlanCompletes(List<Float> planCompletes) {
	this.planCompletes = planCompletes;
}
@JSON(serialize=false)
public List<Integer> getStoreDailys() {
	return storeDailys;
}
public void setStoreDailys(List<Integer> storeDailys) {
	this.storeDailys = storeDailys;
}
@JSON(serialize=false)
public List<Integer> getStoreMonths() {
	return storeMonths;
}
public void setStoreMonths(List<Integer> storeMonths) {
	this.storeMonths = storeMonths;
}
@JSON(serialize=false)
public List<Integer> getStoreYears() {
	return storeYears;
}
public void setStoreYears(List<Integer> storeYears) {
	this.storeYears = storeYears;
}
@JSON(serialize=false)
public List<Float> getRateDailys() {
	return rateDailys;
}
public void setRateDailys(List<Float> rateDailys) {
	this.rateDailys = rateDailys;
}
public Integer getForm_id() {
	return form_id;
}
public void setForm_id(Integer formId) {
	form_id = formId;
}
/***************************************************************/
public void savedailyprodcution(Dailyproductionform dailyproductionform,List<Integer> itemTypeIds,
		List<Integer> feedDailys,List<Integer> feedMonths,List<Integer> feedYears,
		List<Integer> planDailys,List<Float> planCompletes,
		List<Integer> storeDailys,List<Integer> storeMonths,List<Integer> storeYears,List<Float> rateDailys){
	 System.out.println("itemTypeIds.size() = "+itemTypeIds.size());
	for(int i=0;i<itemTypeIds.size();i++){
	    Dailyproduction  dailyProduction=new Dailyproduction();
		System.out.println("itemTypeIds["+i+"] = "+itemTypeIds.get(i));
		itemType=itemTypeService.findById(ItemType.class,itemTypeIds.get(i));
		dailyProduction.setDailyproductionform(dailyproductionform);
		dailyProduction.setItemType(itemType);
		dailyProduction.setFeedDaily(feedDailys.get(i));
		dailyProduction.setFeedMonth(feedMonths.get(i));
		dailyProduction.setFeedYear(feedYears.get(i));
		dailyProduction.setPlanDaily(planDailys.get(i));
		dailyProduction.setPlanComplete(planCompletes.get(i));
		dailyProduction.setStoreDaily(storeDailys.get(i));
		dailyProduction.setStoreMonth(storeMonths.get(i));
		dailyProduction.setStoreYear(storeYears.get(i));
		dailyProduction.setRateDaily(rateDailys.get(i));
		dailyProductionService.saveOrUpdate(dailyProduction);
		
	}
}
	/**
	 * 生产日报表列表
	 * @return
	 */
  public String list() {
	  departments=departmentService.getAllDepartments();
	  pm=dailyproductionformService.getPagerDesc(Dailyproductionform.class);
	  return "list";
}
  public String add(){
	  departments=departmentService.getAllDepartments();
	  return "add";
  }
  /**
   * 添加生产日报表
   * @return
   */
  public String input(){
	  dailyproductionformService.saveAndRefresh(dailyproductionform);
	  savedailyprodcution(dailyproductionform, itemTypeIds, feedDailys, feedMonths, feedYears, planDailys, planCompletes, storeDailys, storeMonths, storeYears, rateDailys);
	  return "pub_add_success";
  }
  public String formlist(){
	  
	  dailyproductionform=dailyproductionformService.findById(Dailyproductionform.class, form_id);
	  pm=dailyProductionService.getPagerDesc(Dailyproduction.class, "where o.dailyproductionform.id="+form_id);
	  return "formlist";
	  
  }
  /**
   * 
   */
  public String del(){
	    dailyproductionform=dailyproductionformService.findById(Dailyproductionform.class,form_id);
		dailyproductions=dailyProductionService.getPager(Dailyproduction.class,"where o.dailyproductionform.id="+form_id).getDatas();
		for(int i=0;i<dailyproductions.size();i++){
			dailyProductionService.deleteById(Dailyproduction.class,dailyproductions.get(i).getId());
	   
		
    }
		dailyproductionformService.deleteById(Dailyproductionform.class,form_id);
		return "pub_del_success";
  }
  /**
   * 查询
   */
  public String search(){
	  Map<String, String> like=new HashMap<String, String>();
	  like.put("department.dptName",dailyproductionform.getDepartment().getDptName());
	  pm=dailyproductionformService.fuzzyQuery(Dailyproductionform.class, like);
	  departments=departmentService.getAllDepartments();
	  return "list";
  }
  /*
   * getMprodct
   */
  public String getprodct(){
	  
	  System.out.println(item_id);
dailyproductions=dailyProductionService.getPager(Dailyproduction.class, "where itemType_id= "+item_id).getDatas();
;
int m=0;
int y=0;
for(int i=0;i<dailyproductions.size();i++){
m=dailyproductions.get(i).getFeedDaily()+m;
System.out.println("m["+i+"]==="+m);
y=dailyproductions.get(i).getFeedDaily()+y;
System.out.println("y["+i+"]===="+y);
}
mresult=m+daily_num;
yresult=y+daily_num;
	  return "success";
  }
  public String getprodctstore(){
	  
	  System.out.println(item_id);
dailyproductions=dailyProductionService.getPager(Dailyproduction.class, "where itemType_id= "+item_id).getDatas();
;
int m=0;
int y=0;
for(int i=0;i<dailyproductions.size();i++){
m=dailyproductions.get(i).getStoreDaily()+m;
System.out.println("m["+i+"]==="+m);
y=dailyproductions.get(i).getStoreDaily()+y;
System.out.println("y["+i+"]===="+y);
}
mresult=m+daily_num;
yresult=y+daily_num;
	  return "success";
  }
  
}
