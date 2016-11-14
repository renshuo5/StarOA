package com.fjsdfx.starerp.produce.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.security.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;

import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ItemTypeService;
import com.fjsdfx.starerp.persons.model.Employee;
import com.fjsdfx.starerp.persons.service.EmployeeService;
import com.fjsdfx.starerp.produce.model.Preparation;
import com.fjsdfx.starerp.produce.model.ProductionSchdul;
import com.fjsdfx.starerp.produce.model.Prosup;
import com.fjsdfx.starerp.produce.model.Prscheck;
import com.fjsdfx.starerp.produce.service.ProductionSchdulService;
import com.fjsdfx.starerp.produce.service.ProsupService;
import com.fjsdfx.starerp.produce.service.PrscheckService;
import com.fjsdfx.starerp.security.model.User;
import com.fjsdfx.starerp.warehouse.model.Supsendm;
import com.fjsdfx.starerp.warehouse.model.Supsendm3;
import com.fjsdfx.starerp.warehouse.model.Susgood;
import com.fjsdfx.starerp.warehouse.model.Susgood3;
import com.fjsdfx.starerp.warehouse.service.Supsendm3Service;
import com.fjsdfx.starerp.warehouse.service.SupsendmService;
import com.fjsdfx.starerp.warehouse.service.Susgood3Service;
import com.fjsdfx.starerp.warehouse.service.SusgoodService;
import com.googlecode.jsonplugin.annotations.JSON;
import com.opensymphony.xwork2.ActionSupport;

@Controller
@Scope("prototype")
public class ProductionSchdulAction extends ActionSupport {

	private Logger logger = LoggerFactory
			.getLogger(ProductionSchdulAction.class);

	private ProductionSchdul productionSchdul;
	private Supsendm supsendm;
	private PagerModel pm;
	private ProductionSchdulService productionSchdulService;
	private EmployeeService employeeService;
	private ItemTypeService itemTypeService;
	private PrscheckService prscheckService;
	private SusgoodService susgoodService;
	private SupsendmService supsendmService;
	private Supsendm3Service supsendm3Service;
	private Susgood3Service susgood3Service;
	private Prosup prosup;
	private Supsendm3 supsendm3;
	private ProsupService prosupService;
	private User addUser;
	private Preparation preparation;
	private Integer menumakeId;// 制单人id
	private Integer itemTypeId;// 原机型id
	private Integer itemTypeId2;// 改装成机型ID
	private Integer wssignId;// 车间姓名id
	private Integer whsignId;// 仓库姓名id
	private Integer exsignId;// 检验姓名id

	public User getAddUser() {
		return addUser;
	}

	public void setAddUser(User addUser) {
		this.addUser = addUser;
	}

	private User currentUser = (User) SecurityContextHolder.getContext()
			.getAuthentication().getPrincipal();

	public Supsendm getSupsendm() {
		return supsendm;
	}

	public void setSupsendm(Supsendm supsendm) {
		this.supsendm = supsendm;
	}

	public Preparation getPreparation() {
		return preparation;
	}

	public void setPreparation(Preparation preparation) {
		this.preparation = preparation;
	}

	@JSON(serialize=false)
	public User getCurrentUser() {
		return currentUser;
	}

	public void setCurrentUser(User currentUser) {
		this.currentUser = currentUser;
	}

	public Prosup getProsup() {
		return prosup;
	}

	public void setProsup(Prosup prosup) {
		this.prosup = prosup;
	}

	@JSON(serialize=false)
	public ProsupService getProsupService() {
		return prosupService;
	}

	@Resource
	public void setProsupService(ProsupService prosupService) {
		this.prosupService = prosupService;
	}

	private Susgood susgood;

	public Susgood getSusgood() {
		return susgood;
	}

	public void setSusgood(Susgood susgood) {
		this.susgood = susgood;
	}
	@JSON(serialize=false)
	public SusgoodService getSusgoodService() {
		return susgoodService;
	}

	@Resource
	public void setSusgoodService(SusgoodService susgoodService) {
		this.susgoodService = susgoodService;
	}

	@JSON(serialize=false)
	public SupsendmService getSupsendmService() {
		return supsendmService;
	}

	@Resource
	public void setSupsendmService(SupsendmService supsendmService) {
		this.supsendmService = supsendmService;
	}

	private Prscheck prscheck;

	public Prscheck getPrscheck() {
		return prscheck;
	}

	public void setPrscheck(Prscheck prscheck) {
		this.prscheck = prscheck;
	}
    
	@JSON(serialize=false)
	public PrscheckService getPrscheckService() {
		return prscheckService;
	}

	@Resource
	public void setPrscheckService(PrscheckService prscheckService) {
		this.prscheckService = prscheckService;
	}

	private List<ItemType> itemTypeList;

	@JSON(serialize=false)
	public List<ItemType> getItemTypeList() {
		return itemTypeList;
	}

	public void setItemTypeList(List<ItemType> itemTypeList) {
		this.itemTypeList = itemTypeList;
	}

	private Employee employee;
	private Integer employee_exsign;// 检验签字
	private Integer employee_whsign;// 仓库签字
	private Integer employee_wssign;// 车间签字
	private Integer employee_menumake;// 制单人
	private Integer itemtype_former;// 原来机型
	private Integer productionSchdulid;
	private Integer susgoodId;

	public Integer getWhsignId() {
		return whsignId;
	}

	public void setWhsignId(Integer whsignId) {
		this.whsignId = whsignId;
	}

	public Integer getExsignId() {
		return exsignId;
	}

	public void setExsignId(Integer exsignId) {
		this.exsignId = exsignId;
	}

	public Integer getSusgoodId() {
		return susgoodId;
	}

	public void setSusgoodId(Integer susgoodId) {
		this.susgoodId = susgoodId;
	}

	public Integer getProductionSchdulid() {
		return productionSchdulid;
	}

	public void setProductionSchdulid(Integer productionSchdulid) {
		this.productionSchdulid = productionSchdulid;
	}

	public Integer getItemtype_former() {
		return itemtype_former;
	}

	public void setItemtype_former(Integer itemtypeFormer) {
		itemtype_former = itemtypeFormer;
	}

	public Integer getItemtype_pre() {
		return itemtype_pre;
	}

	public void setItemtype_pre(Integer itemtypePre) {
		itemtype_pre = itemtypePre;
	}

	private Integer itemtype_pre;// 改成机型

	public Integer getEmployee_menumake() {
		return employee_menumake;
	}

	public void setEmployee_menumake(Integer employeeMenumake) {
		employee_menumake = employeeMenumake;
	}

	public Integer getEmployee_exsign() {
		return employee_exsign;
	}

	public void setEmployee_exsign(Integer employeeExsign) {
		employee_exsign = employeeExsign;
	}

	public Integer getEmployee_whsign() {
		return employee_whsign;
	}

	public void setEmployee_whsign(Integer employeeWhsign) {
		employee_whsign = employeeWhsign;
	}

	public Integer getEmployee_wssign() {
		return employee_wssign;
	}

	public void setEmployee_wssign(Integer employeeWssign) {
		employee_wssign = employeeWssign;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public PagerModel getPm() {
		return pm;
	}

	public void setPm(PagerModel pm) {
		this.pm = pm;
	}

	@JSON(serialize=false)
	public EmployeeService getEmployeeService() {
		return employeeService;
	}

	@Resource
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}
	@JSON(serialize=false)
	public ItemTypeService getItemTypeService() {
		return itemTypeService;
	}

	@Resource
	public void setItemTypeService(ItemTypeService itemTypeService) {
		this.itemTypeService = itemTypeService;
	}

	public ProductionSchdul getProductionSchdul() {
		return productionSchdul;
	}

	public void setProductionSchdul(ProductionSchdul productionSchdul) {
		this.productionSchdul = productionSchdul;
	}
	@JSON(serialize=false)
	public ProductionSchdulService getProductionSchdulService() {
		return productionSchdulService;
	}

	@Resource
	public void setProductionSchdulService(
			ProductionSchdulService productionSchdulService) {
		this.productionSchdulService = productionSchdulService;
	}

	@JSON(serialize=false)
	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	public Integer getMenumakeId() {
		return menumakeId;
	}

	public void setMenumakeId(Integer menumakeId) {
		this.menumakeId = menumakeId;
	}

	public Integer getItemTypeId() {
		return itemTypeId;
	}

	public void setItemTypeId(Integer itemTypeId) {
		this.itemTypeId = itemTypeId;
	}

	public Integer getItemTypeId2() {
		return itemTypeId2;
	}

	public void setItemTypeId2(Integer itemTypeId2) {
		this.itemTypeId2 = itemTypeId2;
	}

	public Integer getWssignId() {
		return wssignId;
	}

	public void setWssignId(Integer wssignId) {
		this.wssignId = wssignId;
	}

	private User creUser() {
		addUser = (User) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		return addUser;
	}

	/**
	 * 审核菜单
	 * 
	 * @return
	 */
	public String addInput() {
		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();

		addUser = currentUser;

		return "add_input";
	}

	/**
	 * 改机通知单菜单
	 * 
	 * @return
	 */
	public String list() {
		pm = productionSchdulService
				.getPagerDesc(
						ProductionSchdul.class,
						"where (o.wssign.empId is not null and o.whsign.empId is not null) or "
								+ "(o.wssign.empId is  null and o.whsign.empId is  null and o.exsign.empId is null)");
		System.out.print(pm.getTotal());
		for (Object ps : pm.getDatas()) {
			ProductionSchdul ps1 = (ProductionSchdul) ps;
			System.out.println(ps1.getCha_no());
		}
		return "list";
	}

	/**
	 * 改机通知单for出库
	 * 
	 * @return
	 */
	public String listware() {
		pm = productionSchdulService
				.getPagerDesc(
						ProductionSchdul.class,
						"where (o.wssign.empId is not null and o.whsign.empId is null and o.exsign.empId is null) "
								+ "or (o.wssign.empId is not null and o.whsign.empId is not null and o.exsign.empId is null) ");
		System.out.print(pm.getTotal());
		for (Object ps : pm.getDatas()) {
			ProductionSchdul ps1 = (ProductionSchdul) ps;
			System.out.println(ps1.getCha_no());
		}
		return "listware";
	}

	/**
	 * 生产计划单
	 * 
	 * @return
	 */

	public String producelist() {

		pm = productionSchdulService.getPreparationPager();

		return "producelist";
	}

	/**
	 * 填写改机通知单——>提交addchange
	 * 
	 * @return
	 */
	public String add() {
		if (menumakeId > 0 && itemtype_former > 0 && itemtype_pre > 0) {

			productionSchdul.setItemType(itemTypeService.findById(
					ItemType.class, itemtype_former));

			productionSchdul.setItemType2(itemTypeService.findById(
					ItemType.class, itemtype_pre));
			productionSchdul.setMenumake(employeeService.findById(
					Employee.class, menumakeId));
			productionSchdulService.saveOrUpdate(productionSchdul);
			return "pub_add_success";
		} else {

			return "pub_exception";
		}
	}

	/**
	 * 按原机型进行查询
	 * 
	 * @return
	 */
	public String search() {
		Map<String, String> like = new HashMap<String, String>();

		if (productionSchdul.getItemType().getName() != null) {
			like.put("itemType.name", productionSchdul.getItemType().getName());

		}
		pm = productionSchdulService.fuzzyQuery(ProductionSchdul.class, like);
		// itemTypeList = itemTypeService.findByHql("from ItemType");

		return "list";
	}

	public String searchware() {

		Map<String, String> like = new HashMap<String, String>();

		if (productionSchdul.getItemType().getName() != null) {
			like.put("itemType.name", productionSchdul.getItemType().getName());
		}
		pm = productionSchdulService.fuzzyQuery(ProductionSchdul.class, like);
		// itemTypeList = itemTypeService.findByHql("from ItemType");

		return "listware";
	}

	/**
	 *車間簽字 -->车间
	 */
	public String examine_wait() {

		addUser = this.creUser();

		productionSchdul = productionSchdulService.findById(
				ProductionSchdul.class, productionSchdulid);
		return "examine_wait";
	}

	public String examineCheck() {
		if (menumakeId > 0 && itemTypeId > 0 && itemTypeId2 > 0 && wssignId > 0) {
			productionSchdul.setMenumake(employeeService.findById(
					Employee.class, menumakeId));
			productionSchdul.setItemType(itemTypeService.findById(
					ItemType.class, itemTypeId));
			productionSchdul.setItemType2(itemTypeService.findById(
					ItemType.class, itemTypeId2));
			productionSchdul.setWssign(employeeService.findById(Employee.class,
					wssignId));
			productionSchdulService.update(productionSchdul);

			return "return_list";
		} else {
			return "pub_exception";
		}
	}

	/**
	 * 倉庫簽字
	 * 
	 * @return
	 */
	public String examine_sent() {
		addUser = this.creUser();
		productionSchdul = productionSchdulService.findById(
				ProductionSchdul.class, productionSchdulid);
		return "examine_sent";
	}

	public String whcheck() {
		if (menumakeId > 0 && itemTypeId > 0 && itemTypeId2 > 0 && wssignId > 0
				&& whsignId > 0) {
			productionSchdul.setMenumake(employeeService.findById(
					Employee.class, menumakeId));
			productionSchdul.setItemType(itemTypeService.findById(
					ItemType.class, itemTypeId));
			productionSchdul.setItemType2(itemTypeService.findById(
					ItemType.class, itemTypeId2));
			productionSchdul.setWssign(employeeService.findById(Employee.class,
					wssignId));
			productionSchdul.setWhsign(employeeService.findById(Employee.class,
					whsignId));
			productionSchdulService.update(productionSchdul);

			return "return_listware";
		} else {
			return "pub_exception";
		}
	}

	/**
	 * 檢驗簽字 -->车间签字
	 * 
	 * @return
	 */
	public String examine_change() {
		addUser = this.creUser();
		productionSchdul = productionSchdulService.findById(
				ProductionSchdul.class, productionSchdulid);
		return "examine_change";
	}

	public String excheck() {
		if (menumakeId > 0 && itemTypeId > 0 && itemTypeId2 > 0 && wssignId > 0
				&& whsignId > 0 && exsignId > 0) {
			productionSchdul.setMenumake(employeeService.findById(
					Employee.class, menumakeId));
			productionSchdul.setItemType(itemTypeService.findById(
					ItemType.class, itemTypeId));
			productionSchdul.setItemType2(itemTypeService.findById(
					ItemType.class, itemTypeId2));
			productionSchdul.setWssign(employeeService.findById(Employee.class,
					wssignId));
			productionSchdul.setWhsign(employeeService.findById(Employee.class,
					whsignId));
			productionSchdul.setExsign(employeeService.findById(Employee.class,
					exsignId));

			productionSchdulService.update(productionSchdul);

			return "return_list";
		} else {
			return "pub_exception";
		}

	}

	/**
	 * 选择签字或机型
	 * 
	 * @return
	 */
	public String selectInput() {
		pm = employeeService.getPagerDesc(Employee.class);
		return "selectinput";

	}

	/**
	 * 生产部删除改机
	 */
	public String del() {

		productionSchdulService.deleteById(ProductionSchdul.class,
				productionSchdulid);
		logger.warn("del id=" + productionSchdulid);
		return "pub_del_success";
	}

	/**
	 * 仓库删除改机
	 */
	public String delware() {

		productionSchdulService.deleteById(ProductionSchdul.class,
				productionSchdulid);
		logger.warn("del id=" + productionSchdulid);
		return "pub_del_success";
	}

	/**
	 * 编辑改机
	 * 
	 */
	public String editInput() {
		// pm=productionSchdulService.getPagerDesc(ProductionSchdul.class);
		productionSchdul = productionSchdulService.findById(
				ProductionSchdul.class, productionSchdulid);
		return "editinput";
	}

	public String show() {
		productionSchdul = productionSchdulService.findById(
				ProductionSchdul.class, productionSchdulid);
		return "show";
	}

	/*
	 * 显示配套发料表
	 */
	public String showsupsendm() {
		pm = susgoodService.getPagerDesc(Susgood.class,
				"where o.supsendm.sus_id = " + supsendm.getSus_id());
		return "showsupsendm";
	}
	public String showsupsendm3() {
		pm = susgood3Service.getPagerDesc(Susgood3.class,
				"where o.supsendm3.id = " + supsendm3.getId());
		return "showsupsendm3";
	}

	public String update() {
		/*
		 * productionSchdul = productionSchdulService.findById(
		 * ProductionSchdul.class, productionSchdulid);
		 * productionSchdulService.update(productionSchdul);
		 */

		if (employee_exsign != null) {
			productionSchdul.setExsign(employeeService.findById(Employee.class,
					employee_exsign));
		}
		if (employee_whsign != null) {
			productionSchdul.setWhsign(employeeService.findById(Employee.class,
					employee_whsign));
		}
		if (employee_wssign != null) {
			productionSchdul.setWssign(employeeService.findById(Employee.class,
					employee_wssign));
		}

		productionSchdul.setMenumake(employeeService.findById(Employee.class,
				employee_menumake));

		productionSchdul.setItemType(itemTypeService.findById(ItemType.class,
				itemtype_former));

		productionSchdul.setItemType2(itemTypeService.findById(ItemType.class,
				itemtype_pre));

		productionSchdulService.update(productionSchdul);
		logger.warn("add id=" + productionSchdul.getId());

		return "pub_add_success";
	}
	public String supsendmList() throws Exception
	{
		pm = supsendmService.getPagerDesc(Supsendm.class,"where o.preparation.id = "+preparation.getId());
		return "supsendm_list";
	}
	public String supsendm3List() throws Exception
	{
		pm = supsendm3Service.getPagerDesc(Supsendm3.class,"where o.preparation.id = "+preparation.getId());
		return "supsendm3_list";
	}
	@JSON(serialize=false)
	public Supsendm3Service getSupsendm3Service() {
		return supsendm3Service;
	}

	@Resource
	public void setSupsendm3Service(Supsendm3Service supsendm3Service) {
		this.supsendm3Service = supsendm3Service;
	}
	@JSON(serialize=false)
	public Susgood3Service getSusgood3Service() {
		return susgood3Service;
	}

	@Resource
	public void setSusgood3Service(Susgood3Service susgood3Service) {
		this.susgood3Service = susgood3Service;
	}

	public Supsendm3 getSupsendm3() {
		return supsendm3;
	}

	public void setSupsendm3(Supsendm3 supsendm3) {
		this.supsendm3 = supsendm3;
	}
	
	/**
	 * 
	 * 校验编号是否重复
	 */
	
	private String result="";
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	private List results;

	@JSON(serialize=false)
	public List getResults() {
		return results;
	}

	public void setResults(List results) {
		this.results = results;
	}

	

	

	private String cnum; 
    

	public String getCnum() {
		return cnum;
	}

	public void setCnum(String cnum) {
		this.cnum = cnum;
	}

	public String ajaxDo(){
    	
    	//ProductionSchdul productionSchdul=new ProductionSchdul();
    	//productionSchdul.setCha_no(cnum);
    	results=productionSchdulService.findByHql("from ProductionSchdul o where o.cha_no='"+cnum+"'");
    	if(results.size()==0){
    		
    		result="no";
    		
    	}
    	else{
    		result="yes";
    	}
    	System.out.print("result="+result);
    	System.out.print("cnum="+cnum);
    	return SUCCESS;
    }

}
