package com.fjsdfx.starerp.warehouse.action;

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
import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.model.Employee;
import com.fjsdfx.starerp.persons.service.DepartmentService;
import com.fjsdfx.starerp.persons.service.EmployeeService;
import com.fjsdfx.starerp.security.action.UserAction;
import com.fjsdfx.starerp.security.model.User;
import com.fjsdfx.starerp.warehouse.model.Vargood;
import com.fjsdfx.starerp.warehouse.model.Variation;
import com.fjsdfx.starerp.warehouse.service.VargoodService;
import com.fjsdfx.starerp.warehouse.service.VariationService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 
 * @author CCK
 * 
 */
@Controller
@Scope("prototype")
public class VariationAction extends ActionSupport {
	private List<Department> workshops;
	private List<Employee> workshopWorkers;
	private ItemType itemType;
	private String forStyle;
	private PagerModel pm;

	private ItemType itemType1;

	private User currentUser = (User) SecurityContextHolder.getContext()
			.getAuthentication().getPrincipal();
	private Variation variation;

	private Vargood vargood;

	private VariationService variationService;

	private DepartmentService departmentService;

	private EmployeeService employeeService;

	private ItemTypeService itemTypeService;

	private VargoodService vargoodService;

	private Logger logger = LoggerFactory.getLogger(UserAction.class);

	private User addUser;

	private Integer vag_id;

	private Integer ccheckId;// 仓库签字id

	private Integer variationId;// 备注Id

	private Integer itemTypeId;// 物品ID

	private Integer itemType0;// 材料ID

	private Integer vardateId;// 申报日期Id

	private Integer variationId0;// 品管意见Id

	private Integer cscheckId;// 车间签字
	public String add() throws Exception {
		vargood.setForstyle(forStyle);
		System.out.println("variation = " + variation + " , vargood = "
				+ vargood);
		variationService.save(variation, vargood);
		logger.warn("user id=" + currentUser.getId() + " save var_id="
				+ variation.getVar_id() + " vargood_id = "
				+ vargood.getVag_id());
		return "pub_add_success";
	}
	// 仓库签字确认
	public String checkCj() {
		System.out.print("test="+vargood.getVag_id());
		vargood.setCjcheck(employeeService.findById(Employee.class, cscheckId));
		vargood.setCheckNum(employeeService.findById(Employee.class, ccheckId));
		vargood.setVariation(variationService.findById(Variation.class,
				variationId));
		vargood.setItemType(itemTypeService
				.findById(ItemType.class, itemTypeId));

		/*System.out.print("test=" + vargood.getItemType().getName());
		System.out.print("test=" + vargood.getCheckNum().getEmpName());
		System.out.print("test=" + vargood.getVariation().getVarnote());
		System.out.print("test=" + vargood.getVariation().getVardate());*/
		vargoodService.update(vargood);
		pm = vargoodService.getPagerDesc(Vargood.class,
				"where o.variation.quaadvice=2");
		return "ccheck";
	}
	public String addInput() throws Exception {
		itemType = itemTypeService.findById(ItemType.class, itemType.getId());
		itemType1 = itemTypeService.findById(ItemType.class, itemType1.getId());
		workshops = departmentService.getWorkshops();
		workshopWorkers = employeeService.getWorkshopWorkers();
		return "add_input";
	}
	// 车间确认
	public String addscheck() {

		vargood.setCjcheck(employeeService.findById(Employee.class, cscheckId));
		vargood.setVariation(variationService.findById(Variation.class,
				variationId));
		vargood.setItemType(itemTypeService
				.findById(ItemType.class, itemTypeId));

		/*System.out.print("test=" + vargood.getItemType().getName());
		System.out.print("test=" + vargood.getCheckNum().getEmpName());
		System.out.print("test=" + vargood.getVariation().getVarnote());
		System.out.print("test=" + vargood.getVariation().getVardate());*/
		vargoodService.update(vargood);
		pm = vargoodService.getPagerDesc(Vargood.class,
				"where o.variation.quaadvice=2");
		return "cscheck";
	}
	public String audit() throws Exception {
		vargood = vargoodService.findById(Vargood.class, vargood.getVag_id());
		return "audit";
	}
	public String auditlist() throws Exception {
		pm = vargoodService.getPagerDesc(Vargood.class);
		return "auditlist";
	}

	// 因事务较简单，故借此书写仓库换货的相关代码，By allen
	public String clist() {

		// pm = vargoodService.getPagerDesc(Vargood.class);
		pm = vargoodService.getPagerDesc(Vargood.class,
				"where o.variation.quaadvice=2");

		return "clist";
	}

	private User creUser() {
		addUser = (User) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		return addUser;
	}

	// 显示换货单（即物料变异申请单） 仓库操作
	public String cshow() {
		addUser = this.creUser();
		vargood = vargoodService.findById(Vargood.class, vag_id);
		return "cshow";
	}

	// 车间凭物料变异单申请换货 车间操作
	public String csshow() {
		addUser = this.creUser();
		vargood = vargoodService.findById(Vargood.class, vag_id);
		return "csshow";
	}

	public String del() throws Exception {
		return "pub_del_success";
	}

	public String editInput() throws Exception {
		return "edit_input";
	}

	public User getAddUser() {
		return addUser;
	}

	public Integer getCcheckId() {
		return ccheckId;
	}

	public Integer getCscheckId() {
		return cscheckId;
	}

	public User getCurrentUser() {
		return currentUser;
	}

	public DepartmentService getDepartmentService() {
		return departmentService;
	}

	public EmployeeService getEmployeeService() {
		return employeeService;
	}

	public String getForStyle() {
		return forStyle;
	}

	public ItemType getItemType() {
		return itemType;
	}

	public Integer getItemType0() {
		return itemType0;
	}

	public ItemType getItemType1() {
		return itemType1;
	}

	public Integer getItemTypeId() {
		return itemTypeId;
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

	public Integer getVag_id() {
		return vag_id;
	}

	public Integer getVardateId() {
		return vardateId;
	}

	public Vargood getVargood() {
		return vargood;
	}

	public VargoodService getVargoodService() {
		return vargoodService;
	}

	public Variation getVariation() {
		return variation;
	}

	public Integer getVariationId() {
		return variationId;
	}

	public Integer getVariationId0() {
		return variationId0;
	}

	public VariationService getVariationservice() {
		return variationService;
	}

	public VariationService getVariationService() {
		return variationService;
	}

	public List<Department> getWorkshops() {
		return workshops;
	}

	public List<Employee> getWorkshopWorkers() {
		return workshopWorkers;
	}

	public String list() throws Exception {
		pm = vargoodService.getPagerDesc(Vargood.class);
		System.out.println("vargood's size = " + pm.getDatas().size());
		for (int i = 0; i < pm.getDatas().size(); i++) {
			Vargood v = (Vargood) pm.getDatas().get(i);
			System.out.println(v.getItemType().getName());
		}
		return "list";
	}

	public String search() {

		Map<String, String> like = new HashMap<String, String>();

		return "list";
	}

	public void setAddUser(User addUser) {
		this.addUser = addUser;
	}

	public void setCcheckId(Integer ccheckId) {
		this.ccheckId = ccheckId;
	}

	public void setCscheckId(Integer cscheckId) {
		this.cscheckId = cscheckId;
	}

	public void setCurrentUser(User currentUser) {
		this.currentUser = currentUser;
	}

	@Resource
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}

	@Resource
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	public void setForStyle(String forStyle) {
		this.forStyle = forStyle;
	}

	public void setItemType(ItemType itemType) {
		this.itemType = itemType;
	}

	public void setItemType0(Integer itemType0) {
		this.itemType0 = itemType0;
	}

	public void setItemType1(ItemType itemType1) {
		this.itemType1 = itemType1;
	}

	public void setItemTypeId(Integer itemTypeId) {
		this.itemTypeId = itemTypeId;
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
	public void setVag_id(Integer vagId) {
		vag_id = vagId;
	}

	public void setVardateId(Integer vardateId) {
		this.vardateId = vardateId;
	}

	public void setVargood(Vargood vargood) {
		this.vargood = vargood;
	}

	@Resource
	public void setVargoodService(VargoodService vargoodService) {
		this.vargoodService = vargoodService;
	}

	public void setVariation(Variation variation) {
		this.variation = variation;
	}

	public void setVariationId(Integer variationId) {
		this.variationId = variationId;
	}

	public void setVariationId0(Integer variationId0) {
		this.variationId0 = variationId0;
	}

	@Resource
	public void setVariationservice(VariationService variationService) {
		this.variationService = variationService;
	}

	@Resource
	public void setVariationService(VariationService variationService) {
		this.variationService = variationService;
	}

	public void setWorkshops(List<Department> workshops) {
		this.workshops = workshops;
	}

	public void setWorkshopWorkers(List<Employee> workshopWorkers) {
		this.workshopWorkers = workshopWorkers;
	}

	public String show() {
		variation = variationService.findById(Variation.class, variation
				.getVar_id());
		return "show";
	}

	public String update() throws Exception {
		Vargood tempVargood = vargoodService.findById(Vargood.class, vargood
				.getVag_id());
		System.out.println("vargood.getVariation().getQuaadvice() = "
				+ vargood.getVariation().getQuaadvice());
		variationService.updateByAudit(tempVargood.getVariation().getVar_id(),
				vargood.getVariation().getQuaadvice(), vargood.getVariation()
						.getQuanote());
		return "audit_result";
	}

	
}
