package com.fjsdfx.starerp.sales.action;


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

import com.fjsdfx.starerp.security.model.User;
import org.springframework.security.context.SecurityContextHolder;
import com.fjsdfx.starerp.annoucement.model.Annoucement;
import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.item.model.Item;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ItemService;
import com.fjsdfx.starerp.item.service.ItemTypeService;
import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.model.Employee;
import com.fjsdfx.starerp.persons.model.EmployeeRap;
import com.fjsdfx.starerp.persons.service.DepartmentService;
import com.fjsdfx.starerp.persons.service.EmployeeService;
import com.fjsdfx.starerp.sales.service.Shi2goodService;
import com.fjsdfx.starerp.sales
.service.Shinote2Service;
import com.fjsdfx.starerp.sales.model.Shi1good;
import com.fjsdfx.starerp.sales.model.Shi2good;
import com.fjsdfx.starerp.sales.model.Shinote2;
import com.fjsdfx.starerp.sales.model.Shippingnote1;
import com.fjsdfx.starerp.warehouse.model.Warehouse;
import com.fjsdfx.starerp.warehouse.service.MaccountingService;
import com.fjsdfx.starerp.warehouse.service.StockService;



/**
 * @author Chen_Shaojian
 *
 */
@Controller
@Scope("prototype")
public class Shinote2Action {

	public ItemTypeService getItemtypeService() {
		return itemtypeService;
	}
	
	@Resource
	public void setItemtypeService(ItemTypeService itemtypeService) {
		this.itemtypeService = itemtypeService;
	}



	public Integer getItemTypeId() {
		return itemTypeId;
	}

	public void setItemTypeId(Integer itemTypeId) {
		this.itemTypeId = itemTypeId;
	}

	public Shi2good getShi2good() {
		return shi2good;
	}

	public void setShi2good(Shi2good shi2good) {
		this.shi2good = shi2good;
	}

	public Integer getShi2goodId() {
		return shi2goodId;
	}

	public void setShi2goodId(Integer shi2goodId) {
		this.shi2goodId = shi2goodId;
	}

	public Shi2goodService getShi2goodService() {
		return shi2goodService;
	}
	@Resource
	public void setShi2goodService(Shi2goodService shi2goodService) {
		this.shi2goodService = shi2goodService;
	}

	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	public Shinote2Service getShinote2Service() {
		return shinote2Service;
	}
	@Resource
	public void setShinote2Service(Shinote2Service shinote2Service) {
		this.shinote2Service = shinote2Service;
	}

	public Shinote2 getShinote2() {
		return shinote2;
	}

	public void setShinote2(Shinote2 shinote2) {
		this.shinote2 = shinote2;
	}

	public PagerModel getPm() {
		return pm;
	}

	public void setPm(PagerModel pm) {
		this.pm = pm;
	}

	public Integer getSn() {
		return sn;
	}

	public void setSn(Integer sn) {
		this.sn = sn;
	}
	
	public String getSchper() {
		return schper;
	}
	public void setSchper(String schper) {
		this.schper = schper;
	}
	public String getStorageper() {
		return storageper;
	}
	public void setStorageper(String storageper) {
		this.storageper = storageper;
	}


	private Logger logger=LoggerFactory.getLogger(Shinote2Action.class);
	
	private Shinote2Service shinote2Service;
	
	private Shinote2 shinote2;
	
	private PagerModel pm;
	
	private Integer sn;
	
	private Shi2good shi2good;
	
	private Integer shi2goodId;
	
	private Shi2goodService shi2goodService;
	
	private ItemTypeService itemtypeService;
	
	private Integer itemTypeId;
	
	private Integer shinote2Id;
	
    private List<Integer> orderids;
	
	private List<Integer> shi2nos;
	
	private List<Integer> shi2no2s;
	
	private List<String> shi2notes;
	
	private StockService stockService;
	
	private MaccountingService maccountingService;
	
	private User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	
	public User getCurrentUser() {
		return currentUser;
	}

	public void setCurrentUser(User currentUser) {
		this.currentUser = currentUser;
	}


	/**
	 * 填表人
	 */
	private User wper;
	
	public User getWper() {
		return wper;
	}

	public void setWper(User wper) {
		this.wper = wper;
	}
    /**
     * 仓库主管
     */
	private User whmger;
	
	
	
	public User getWhmger() {
		return whmger;
	}

	public void setWhmger(User whmger) {
		this.whmger = whmger;
	}


	/**
	 * 仓库
	 */
	private List<Department> whnames;
	
	private DepartmentService departmentService;
	
	private EmployeeService employeeService;
	
	/**
	 * 提货人
	 */
	private List<Employee> delper;

	public EmployeeService getEmployeeService() {
		return employeeService;
	}

	@Resource
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	public List<Employee> getDelper() {
		return delper;
	}

	public void setDelper(List<Employee> delper) {
		this.delper = delper;
	}

	public DepartmentService getDepartmentService() {
		return departmentService;
	}
    @Resource
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}

	public List<Department> getWhnames() {
		return whnames;
	}

	public void setWhnames(List<Department> whnames) {
		this.whnames = whnames;
	}

	public MaccountingService getMaccountingService() {
		return maccountingService;
	}

	@Resource
	public void setMaccountingService(MaccountingService maccountingService) {
		this.maccountingService = maccountingService;
	}

	public StockService getStockService() {
		return stockService;
	}

	@Resource
	public void setStockService(StockService stockService) {
		this.stockService = stockService;
	}

	public List<Integer> getOrderids() {
		return orderids;
	}

	public void setOrderids(List<Integer> orderids) {
		this.orderids = orderids;
	}

	public List<Integer> getShi2nos() {
		return shi2nos;
	}

	public void setShi2nos(List<Integer> shi2nos) {
		this.shi2nos = shi2nos;
	}

	public List<Integer> getShi2no2s() {
		return shi2no2s;
	}

	public void setShi2no2s(List<Integer> shi2no2s) {
		this.shi2no2s = shi2no2s;
	}

	public List<String> getShi2notes() {
		return shi2notes;
	}

	public void setShi2notes(List<String> shi2notes) {
		this.shi2notes = shi2notes;
	}

	public List<String> getRewuprices() {
		return rewuprices;
	}

	public void setRewuprices(List<String> rewuprices) {
		this.rewuprices = rewuprices;
	}

	public List<Integer> getItemTypeIds() {
		return itemTypeIds;
	}

	public void setItemTypeIds(List<Integer> itemTypeIds) {
		this.itemTypeIds = itemTypeIds;
	}

	public List<ItemType> getItemTypes() {
		return itemTypes;
	}

	public void setItemTypes(List<ItemType> itemTypes) {
		this.itemTypes = itemTypes;
	}

	private List<String> rewuprices;
	
	private List<Integer> itemTypeIds;
	
	private List<ItemType> itemTypes;
	
	/**
	 * 调度
	 */
	private String schper;
	
	/**
	 * 储运
	 */
	private String storageper;
	

	/**
	 * 制表
	 */
	private List<Employee> mtab;
	
	public List<Employee> getMtab() {
		return mtab;
	}

	public void setMtab(List<Employee> mtab) {
		this.mtab = mtab;
	}

	public Integer getShinote2Id() {
		return shinote2Id;
	}
	public void setShinote2Id(Integer shinote2Id) {
		this.shinote2Id = shinote2Id;
	}

	List<Shi2good> shi2goods;
	public List<Shi2good> getShi2goods() {
		return shi2goods;
	}

	public void setShi2goods(List<Shi2good> shi2goods) {
		this.shi2goods = shi2goods;
	}
	/**
	 * 列表
	 * @return
	 * @throws Exception
	 */
	public String list()  {
		// TODO Auto-generated method stub
		pm=shinote2Service.getPagerDesc(Shinote2.class);
		shi2goods = shi2goodService.findByHql("from Shi2good");
		return "list";
	}
	
	/**
	 * 查询
	 */
	public String search() {
		// pm=resourceService.findByExample(Resource.class, resource);
		Map<String, String> like = new HashMap<String, String>();
		like.put("sn", shinote2.getSn());
		pm = shinote2Service.fuzzyQuery(Shinote2.class, like);
		return "list";
	}
	
	/**
	 * 显示
	 * @return
	 */
	public String show()
	{
		shinote2=shinote2Service.findById(Shinote2.class, shinote2Id);
		shi2goods = shi2goodService.findByHql("from Shi2good s2g where s2g.shinote2.shi2id = "+ shinote2Id);
		return "show";
	}
	
	/**
	 * 转到审核列表页面
	 * @return
	 */
	public String examineList()  {
		
		// TODO Auto-generated method stub
		pm=shinote2Service.getPagerDesc(Shinote2.class);
		shi2goods = shi2goodService.findByHql("from Shi2good");
		return "examine_list";
	}
	
	/**
	 * 转到添加页面
	 * @return
	 */
	public String addInput()
	{
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		wper = currentUser;
		whnames = departmentService.findByHql("from Department where dptType=3");
		delper = employeeService.findByHql("from Employee");
		mtab = employeeService.findByHql("from Employee");
		return "add_input";
	}
	
	/**
	 * 添加方法
	 * @return
	 */
	public String add() throws ParseException
	{
		if(itemTypeIds!=null && shinote2.getWhname().getId()!=null&& shinote2.getDelper().getEmpId()!=null && shinote2.getMtab().getEmpId()!=null){
			
		shi2goodService.savesh2goods(shinote2, orderids, itemTypeIds, shi2nos, shi2no2s, shi2notes);
		}
		logger.warn("add shinote2 id"+shinote2.getShi2id()+"user Id ="+currentUser.getId());
		return "pub_add_success";
		
	}
	
	/**
	 * 转到审核页面
	 * @return
	 */
	public String examineInput()
	{   User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    whmger= currentUser;
	  /*  String sstring;
		whnames = departmentService.findByHql("from Department where dptType=3");
		Integer flag = departmentService.findById(Department.class, 2).getId();
		if(whmger.getEmployee().getDepartment().getId().intValue()==flag.intValue()){
			
					sstring = "examine_input";
				}	
			else{
				sstring = "pub_exception";
			  }*/
		shinote2=shinote2Service.findById(Shinote2.class,shinote2Id);
		shi2goods = shi2goodService.findByHql("from Shi2good s2g where s2g.shinote2.shi2id = "+ shinote2Id);
	    return "examine_input";
		//return sstring;
	}
	
	/**
	 * 审核方法
	 * @return
	 */
	public String examine()
	{
		shi2goodService.examine(shinote2Id,schper,storageper,whmger);
		
		//此处还应加入对审核人的验证，记录审核人ID
		logger.warn("examine id="+shinote2.getShi2id());
		return "return_list";
	}
	
	/**
	 * 转到修改
	 * @return
	 */

	
	public String editInput(){
		
		shinote2 = shinote2Service.findById(Shinote2.class, shinote2Id);
		shi2goods = shi2goodService.findByHql("from Shi2good s2g where s2g.shinote2.shi2id = "+ shinote2Id);
		whnames = departmentService.findByHql("from Department where dptType=3");
		delper = employeeService.findByHql("from Employee");
		mtab = employeeService.findByHql("from Employee");
		return "edit_input";
	}
	
	
	/**
	 * 修改方法
	 * @return
	 */
	public String update(){
		shinote2Service.update(shinote2);
		shi2goodService.updatesh2goods(shinote2, orderids, itemTypeIds, shi2nos, shi2no2s, shi2notes);
		logger.warn("update shinote2 id"+shinote2.getShi2id()+"user Id ="+currentUser.getId());
		return "pub_update_success";
	}

	/**
	 * 删除方法
	 * @return
	 */
	public String del(){
		shi2goods = shi2goodService.findByHql("from Shi2good s2g where s2g.shinote2.shi2id ="+shinote2Id);
		shi2goodService.deleteshi2goods(shi2goods,shinote2Id);
		logger.warn("del shinote2 id"+shinote2Id+"user Id ="+currentUser.getId());
		return "pub_del_success";
		
	}
}
