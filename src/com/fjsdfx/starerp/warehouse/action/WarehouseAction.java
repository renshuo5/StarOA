package com.fjsdfx.starerp.warehouse.action;

import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.model.Employee;
import com.fjsdfx.starerp.persons.service.DepartmentService;
import com.fjsdfx.starerp.persons.service.EmployeeService;
import com.fjsdfx.starerp.security.model.User;
import com.fjsdfx.starerp.security.service.UserService;

import org.springframework.security.context.SecurityContextHolder;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.fjsdfx.starerp.annoucement.model.Annoucement;
import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.item.model.Item;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ItemService;
import com.fjsdfx.starerp.item.service.ItemTypeService;
import com.fjsdfx.starerp.warehouse.model.Rewgood;
import com.fjsdfx.starerp.warehouse.model.Rewinder;
import com.fjsdfx.starerp.warehouse.model.Warehouse;
import com.fjsdfx.starerp.warehouse.service.WarehouseService;

/**
 * @author Chen_Luqiang
 * 
 */
@Controller
@Scope("prototype")
public class WarehouseAction {

	private Integer itemTypeId;

	private ItemTypeService itemTypeService;

	private Logger logger = LoggerFactory.getLogger(WarehouseAction.class);

	private PagerModel pm;

	private User winpector;

	private Warehouse warehouse;

	private Date warehouseDate;

	private Integer warehouseId;

	private WarehouseService warehouseService;

	private DepartmentService departmentService;
	
	private List<Department> departments;
	
	private List<Employee> productionAcceptancesEmployees;

	private EmployeeService employeeService;
	private List<Warehouse> warehouses;

	/**
	 * 添加
	 * 
	 * @return
	 * @throws ParseException
	 */
	public String add() throws ParseException {
		
		if (itemTypeId != null) {
			ItemType itemType = itemTypeService.findById(ItemType.class,
					itemTypeId);
			warehouse.setItemType(itemType);
			User currentUser = (User) SecurityContextHolder.getContext()
					.getAuthentication().getPrincipal();
			winpector = currentUser;
			warehouse.setWinpector(winpector.getEmployee());
			warehouseService.saveAndRefresh(warehouse);
			logger.warn(currentUser.getId()+" save warehouse " + warehouse.getWar_id());

		}

		return "pub_add_success";
	}

	/* ==============input=========================================== */
	public String addInput() {
		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		departments = departmentService
		.findByHql("from Department d where d.dptType=" + 2); 
		productionAcceptancesEmployees = employeeService.findByHql("from Employee e where e.department.id="+2);
		System.out.println("------------------productionAcc="+productionAcceptancesEmployees.size());
		winpector = currentUser;
		return "add_input";
	}

	public String editInput() {

		warehouse = warehouseService.findById(Warehouse.class, warehouseId);

		departments = departmentService
		.findByHql("from Department d where d.dptType=" + 2);
		return "edit_input";
	}

	/**
	 * 删除
	 * 
	 * @return
	 */
	public String del() {
		warehouseService.deleteById(Warehouse.class, warehouseId);
		User currentUser = (User) SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal();
		logger.warn(currentUser.getId()+" delelete warehouse "+warehouseId);
		return "pub_del_success";
	}

	/**
	 * 列表
	 * 
	 * @return
	 * @throws Exception
	 */
	public String list() {
		// TODO Auto-generated method stub

		pm = warehouseService.getPagerDesc(Warehouse.class);
		return "list";
	}

	/**
	 * 搜索
	 * 
	 * @return
	 */
	public String search() {
		// pm=resourceService.findByExample(Resource.class, resource);

		Map<String, String> like = new HashMap<String, String>();
		like.put("warsn", warehouse.getWarsn());
		like.put("itemType.name", warehouse.getItemType()
				.getName());
		pm = warehouseService.fuzzyQuery(Warehouse.class, like);
		return "list";
	}

	/**
	 * 未审核搜索
	 */
	public String examinesearch() {

		pm = warehouseService.getPagerDesc(Warehouse.class,
				"where o.whmg is null and o.warsn like '%"
						+ warehouse.getWarsn()
						+ "%' and o.itemType.item.name like '%"
						+ warehouse.getItemType().getItem().getName() + "%'");
		return "examine_list";
	}

	/**
	 * 显示
	 * 
	 * @return
	 */
	public String show() {
		warehouse = warehouseService.findById(Warehouse.class, warehouseId);
		return "show";
	}

	/**
	 * 更新
	 * 
	 * @return
	 */
	public String update() {

		if (itemTypeId != null) {
			ItemType itemType = itemTypeService.findById(ItemType.class,
					itemTypeId);
			warehouse.setItemType(itemType);
		}
		warehouseService.update(warehouse);
		User currentUser = (User) SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal();
		logger.warn(currentUser.getId()+" edit warehouse "+warehouse.getWar_id());
		return "pub_update_success";
	}

	public String examineList() {
		// TODO Auto-generated method stub
		pm = warehouseService.getPagerDesc(Warehouse.class, "where o.whmg is null");
		return "examine_list";
	}

	public DepartmentService getDepartmentService() {
		return departmentService;
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

	public Warehouse getWarehouse() {
		return warehouse;
	}

	public Date getWarehouseDate() {
		return warehouseDate;
	}

	public Integer getWarehouseId() {
		return warehouseId;
	}

	public List<Warehouse> getWarehouses() {
		return warehouses;
	}

	public WarehouseService getWarehouseService() {
		return warehouseService;
	}

	public User getWinpector() {
		return winpector;
	}

	@Resource
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
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

	public void setWarehouse(Warehouse warehouse) {
		this.warehouse = warehouse;
	}

	public void setWarehouseDate(Date warehouseDate) {
		this.warehouseDate = warehouseDate;
	}

	public void setWarehouseId(Integer warehouseId) {
		this.warehouseId = warehouseId;
	}

	public void setWarehouses(List<Warehouse> warehouses) {
		this.warehouses = warehouses;
	}

	@Resource
	public void setWarehouseService(WarehouseService warehouseService) {
		this.warehouseService = warehouseService;
	}

	public void setWinpector(User winpector) {
		this.winpector = winpector;
	}

	public List<Department> getDepartments() {
		return departments;
	}

	public void setDepartments(List<Department> departments) {
		this.departments = departments;
	}

	public List<Employee> getProductionAcceptancesEmployees() {
		return productionAcceptancesEmployees;
	}

	public void setProductionAcceptancesEmployees(
			List<Employee> productionAcceptancesEmployees) {
		this.productionAcceptancesEmployees = productionAcceptancesEmployees;
	}

	public EmployeeService getEmployeeService() {
		return employeeService;
	}

	@Resource
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}
	
}
