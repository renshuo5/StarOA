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
import com.fjsdfx.starerp.item.service.ItemTypeService; /*import com.fjsdfx.starerp.produce.action.ProductionWarehousingAction;
 import com.fjsdfx.starerp.produce.model.ProductionWarehousing;
 import com.fjsdfx.starerp.produce.service.ProductionWarehousingService;*/
import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.model.Employee;
import com.fjsdfx.starerp.persons.model.Jobs;
import com.fjsdfx.starerp.persons.service.DepartmentService;
import com.fjsdfx.starerp.persons.service.EmployeeService;
import com.fjsdfx.starerp.sales.service.Shippingnote1Service;
import com.fjsdfx.starerp.sales.service.Shi1goodService;
import com.fjsdfx.starerp.sales.service.TaxboardService;
import com.fjsdfx.starerp.sales.service.TaxstampingpartsService;
import com.fjsdfx.starerp.sales.service.UnqmessageService;
import com.fjsdfx.starerp.sales.model.Shi1good;
import com.fjsdfx.starerp.sales.model.Shi2good;
import com.fjsdfx.starerp.sales.model.Shinote2;
import com.fjsdfx.starerp.sales.model.Shippingnote1;
import com.fjsdfx.starerp.sales.model.Taxboard;
import com.fjsdfx.starerp.sales.model.Taxstampingparts;
import com.fjsdfx.starerp.sales.model.Unqmessage;
import com.fjsdfx.starerp.warehouse.service.MaccountingService;
import com.fjsdfx.starerp.warehouse.service.StockService;

/**
 * @author Chen_Shaojian
 * 
 */
@Controller
@Scope("prototype")
public class Shippingnote1Action {
	
	private String flag;

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public Shi1goodService getShi1goodService() {
		return shi1goodService;
	}

	@Resource
	public void setShi1goodService(Shi1goodService shi1goodService) {
		this.shi1goodService = shi1goodService;
	}

	public Shi1good getShi1good() {
		return shi1good;
	}

	public void setShi1good(Shi1good shi1good) {
		this.shi1good = shi1good;
	}

	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	public Shippingnote1Service getShippingnote1Service() {
		return shippingnote1Service;
	}

	@Resource
	public void setShippingnote1Service(
			Shippingnote1Service shippingnote1Service) {
		this.shippingnote1Service = shippingnote1Service;
	}

	public Shippingnote1 getShippingnote1() {
		return shippingnote1;
	}

	public void setShippingnote1(Shippingnote1 shippingnote1) {
		this.shippingnote1 = shippingnote1;
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

	public Integer getShippingnote1Id() {
		return shippingnote1Id;
	}

	public void setShippingnote1Id(Integer shippingnote1Id) {
		this.shippingnote1Id = shippingnote1Id;
	}

	public ItemType getItemtypeId() {
		return itemtypeId;
	}

	public void setItemtypeId(ItemType itemtypeId) {
		this.itemtypeId = itemtypeId;
	}

	private Logger logger = LoggerFactory.getLogger(Shippingnote1Action.class);

	private Shippingnote1Service shippingnote1Service;

	private Shippingnote1 shippingnote1;

	private ItemType itemtypeId;

	private Shi1goodService shi1goodService;

	private Shi1good shi1good;

	private PagerModel pm;

	private Integer sn;

	private ItemTypeService itemtypeService;

	private Integer itemTypeId;

	private Integer shippingnote1Id;

	private Integer shi1goodId;

	private List<String> shitimes;

	private List<String> shi1units;

	private List<Integer> shi1nos;

	private List<String> shinotes;

	private List<Integer> itemTypeIds;

	private Taxboard taxboard;

	private TaxboardService taxboardService;

	private Integer taxboardId;

	private Taxstampingparts taxstampingparts;

	private TaxstampingpartsService taxstampingpartsService;

	private List<Taxboard> taxboards;

	private StockService stockService;

	private MaccountingService maccountingService;

	private EmployeeService employeeService;

	private DepartmentService departmentService;

	public DepartmentService getDepartmentService() {
		return departmentService;
	}

	@Resource
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}

	private User currentUser = (User) SecurityContextHolder.getContext()
			.getAuthentication().getPrincipal();

	public User getCurrentUser() {
		return currentUser;
	}

	public void setCurrentUser(User currentUser) {
		this.currentUser = currentUser;
	}

	public EmployeeService getEmployeeService() {
		return employeeService;
	}

	@Resource
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	/**
	 * 判断板卡提交状态的临时变量
	 */
	private String tax;
	/**
	 * 判断冷冲件提交状态的临时变量
	 */
	private String tas;
	/**
	 * 判断外协件发货物列表提交状态的临时变量
	 */
	private String goodlist;

	/**
	 * 发送单位
	 */
	private String sended;

	/**
	 * 填表人
	 */
	private User shiw;

	/**
	 * 板卡/冷冲件的品管确认
	 * 
	 * @return
	 */
	private User quaconfirm;

	/**
	 * 检验员
	 */
	private List<Employee> inspector;

	/**
	 * 负责人
	 */
	private List<Employee> rper;

	private Integer taxstampingpartsId;

	public Integer getTaxstampingpartsId() {
		return taxstampingpartsId;
	}

	public void setTaxstampingpartsId(Integer taxstampingpartsId) {
		this.taxstampingpartsId = taxstampingpartsId;
	}

	public List<Employee> getInspector() {
		return inspector;
	}

	public void setInspector(List<Employee> inspector) {
		this.inspector = inspector;
	}

	public List<Employee> getRper() {
		return rper;
	}

	public void setRper(List<Employee> rper) {
		this.rper = rper;
	}

	public User getQuaconfirm() {
		return quaconfirm;
	}

	public void setQuaconfirm(User quaconfirm) {
		this.quaconfirm = quaconfirm;
	}

	public User getShiw() {
		return shiw;
	}

	public void setShiw(User shiw) {
		this.shiw = shiw;
	}

	public StockService getStockService() {
		return stockService;
	}

	@Resource
	public void setStockService(StockService stockService) {
		this.stockService = stockService;
	}

	public MaccountingService getMaccountingService() {
		return maccountingService;
	}

	@Resource
	public void setMaccountingService(MaccountingService maccountingService) {
		this.maccountingService = maccountingService;
	}

	public String getSended() {
		return sended;
	}

	public void setSended(String sended) {
		this.sended = sended;
	}

	public String getGoodlist() {
		return goodlist;
	}

	public void setGoodlist(String goodlist) {
		this.goodlist = goodlist;
	}

	public String getTas() {
		return tas;
	}

	public void setTas(String tas) {
		this.tas = tas;
	}

	public String getTax() {
		return tax;
	}

	public void setTax(String tax) {
		this.tax = tax;
	}

	public List<Taxboard> getTaxboards() {
		return taxboards;
	}

	public void setTaxboards(List<Taxboard> taxboards) {
		this.taxboards = taxboards;
	}

	public Taxstampingparts getTaxstampingparts() {
		return taxstampingparts;
	}

	public void setTaxstampingparts(Taxstampingparts taxstampingparts) {
		this.taxstampingparts = taxstampingparts;
	}

	public TaxstampingpartsService getTaxstampingpartsService() {
		return taxstampingpartsService;
	}

	@Resource
	public void setTaxstampingpartsService(
			TaxstampingpartsService taxstampingpartsService) {
		this.taxstampingpartsService = taxstampingpartsService;
	}

	public Taxboard getTaxboard() {
		return taxboard;
	}

	public void setTaxboard(Taxboard taxboard) {
		this.taxboard = taxboard;
	}

	public TaxboardService getTaxboardService() {
		return taxboardService;
	}

	@Resource
	public void setTaxboardService(TaxboardService taxboardService) {
		this.taxboardService = taxboardService;
	}

	public Integer getTaxboardId() {
		return taxboardId;
	}

	public void setTaxboardId(Integer taxboardId) {
		this.taxboardId = taxboardId;
	}

	public List<Integer> getItemTypeIds() {
		return itemTypeIds;
	}

	public void setItemTypeIds(List<Integer> itemTypeIds) {
		this.itemTypeIds = itemTypeIds;
	}

	public List<String> getShitimes() {
		return shitimes;
	}

	public void setShitimes(List<String> shitimes) {
		this.shitimes = shitimes;
	}

	public List<String> getShi1units() {
		return shi1units;
	}

	public void setShi1units(List<String> shi1units) {
		this.shi1units = shi1units;
	}

	public List<Integer> getShi1nos() {
		return shi1nos;
	}

	public void setShi1nos(List<Integer> shi1nos) {
		this.shi1nos = shi1nos;
	}

	public List<String> getShinotes() {
		return shinotes;
	}

	public void setShinotes(List<String> shinotes) {
		this.shinotes = shinotes;
	}

	public Integer getShi1goodId() {
		return shi1goodId;
	}

	public void setShi1goodId(Integer shi1goodId) {
		this.shi1goodId = shi1goodId;
	}

	List<Shi1good> shi1goods;

	public List<Shi1good> getShi1goods() {
		return shi1goods;
	}

	public void setShi1goods(List<Shi1good> shi1goods) {
		this.shi1goods = shi1goods;
	}

	public List<Shippingnote1> shippingnote1s;

	public List<Shippingnote1> getShippingnote1s() {
		return shippingnote1s;
	}

	public void setShippingnote1s(List<Shippingnote1> shippingnote1s) {
		this.shippingnote1s = shippingnote1s;
	}

	private List<Taxstampingparts> taxstampingparts2;

	public List<Taxstampingparts> getTaxstampingparts2() {
		return taxstampingparts2;
	}

	public void setTaxstampingparts2(List<Taxstampingparts> taxstampingparts2) {
		this.taxstampingparts2 = taxstampingparts2;
	}

	/**
	 * 列表
	 * 
	 * @return
	 * @throws Exception
	 */
	public String list() {
		// TODO Auto-generated method stub
		pm = shippingnote1Service.getPagerDesc(Shippingnote1.class);
		shi1goods = shi1goodService.findByHql("from Shi1good");
		return "list";
	}

	/**
	 * 查询
	 */
	public String search() {
		Map<String, String> like = new HashMap<String, String>();
		like.put("shi1send", shippingnote1.getShi1send());
		pm = shippingnote1Service.fuzzyQuery(Shippingnote1.class, like);
		return "examine_list";
	}

	/**
	 * 交货单位查询
	 */
	public String sendedSearch() {
		Map<String, String> like = new HashMap<String, String>();
		like.put("shi1unit", shi1good.getShi1unit());
		pm = shi1goodService.fuzzyQuery(Shi1good.class, like);
		return "list";
	}

	/**
	 * 转到外协件物列表
	 * 
	 * @return
	 */
	public String shi1goodList() {
		// TODO Auto-generated method stub
		pm = shippingnote1Service.getPagerDesc(Shippingnote1.class);
		shippingnote1 = shippingnote1Service.findById(Shippingnote1.class,
				shippingnote1Id);
		shi1goods = shi1goodService
				.findByHql("from Shi1good s1g where s1g.shippingnote1.shi1id = "
						+ shippingnote1Id);
		return "shi1good_list";
	}

	/**
	 * 转到质量检验列表
	 * 
	 * @return
	 */
	public String qualityList() {
		// TODO Auto-generated method stub
		pm = shippingnote1Service.getPagerDesc(Shippingnote1.class);
		shi1goods = shi1goodService.findByHql("from Shi1good");
		return "quality_list";
	}

	/**
	 * 转到审核列表
	 * 
	 * @return
	 */
	public String examineList() {
		// TODO Auto-generated method stub
		pm = shippingnote1Service.getPagerDesc(Shippingnote1.class);
		shi1goods = shi1goodService.findByHql("from Shi1good");
		return "examine_list";
	}

	/**
	 * 转到添加方法
	 * 
	 * @return
	 */
	public String addInput() {
		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		shiw = currentUser;
		return "add_input";
	}

	/**
	 * 添加方法
	 * 
	 * @return
	 */
	public String add() throws ParseException {
		if (itemTypeIds != null) {
			shi1goodService.saveshi1goods(shippingnote1, itemTypeIds, shitimes,
					shi1units, shi1nos, shinotes);
		}
		logger.warn("add shippingnote1 id" + shippingnote1.getShi1id()
				+ "user Id =" + currentUser.getId());
		return "pub_add_success";
	}

	/**
	 * 转到审核页面
	 * 
	 * @return
	 */
	public String examineInput() {
		flag="ck";
		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		shiw = currentUser;
		/*
		 * String sstring; Integer flag =
		 * departmentService.findById(Department.class, 2).getId();
		 * if(shiw.getEmployee
		 * ().getDepartment().getId().intValue()==flag.intValue()){ sstring =
		 * "show"; } else{ sstring = "pub_exception"; }
		 */
		shippingnote1 = shippingnote1Service.findById(Shippingnote1.class,
				shippingnote1Id);
		shi1goods = shi1goodService
				.findByHql("from Shi1good sg where sg.shippingnote1.shi1id="
						+ shippingnote1Id);
		return "show";
	}

	/**
	 * 转到显示
	 * 
	 * @return
	 */
	public String show() {
		flag="pgb";
		shippingnote1 = shippingnote1Service.findById(Shippingnote1.class,
				shippingnote1Id);
		shi1goods = shi1goodService
				.findByHql("from Shi1good sg where sg.shippingnote1.shi1id="
						+ shippingnote1Id);
		return "show";
	}

	public String shi1goodshow() {
		shippingnote1 = shippingnote1Service.findById(Shippingnote1.class,
				shippingnote1Id);
		shi1goods = shi1goodService
				.findByHql("from Shi1good sg where sg.shippingnote1.shi1id="
						+ shippingnote1Id);
		return "shi1goodshow";
	}

	/**
	 * 跳到编辑页面
	 * 
	 * @return
	 */
	public String editInput() {
		shippingnote1 = shippingnote1Service.findById(Shippingnote1.class,
				shippingnote1Id);
		shi1goods = shi1goodService
				.findByHql("from Shi1good s1g where s1g.shippingnote1.shi1id = "
						+ shippingnote1Id);
		return "edit_input";
	}

	/**
	 * 更新方法
	 * 
	 * @return
	 */
	public String update() {

		shippingnote1Service.update(shippingnote1);
		shi1goodService.updateshi1goods(shippingnote1, itemTypeIds, shitimes,
				shi1units, shi1nos, shinotes);
		logger.warn("update shippingnote1 id" + shippingnote1.getShi1id()
				+ "user Id =" + currentUser.getId());
		return "pub_update_success";
	}

	/**
	 * 删除方法
	 * 
	 * @return
	 * @throws IndexOutOfBoundsException
	 */
	public String del() throws IndexOutOfBoundsException {
		shi1goodService.deleteshi1goods(shippingnote1Id, shi1goods, taxboard,
				taxstampingparts);
		logger.warn("del shippingnote1 id" + shippingnote1Id + "user Id ="
				+ currentUser.getId());
		return "pub_del_success";
	}

	/**
	 * 跳转到板卡
	 * 
	 * @return
	 */
	public String taxboardInput() {
		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		quaconfirm = currentUser;
		// String sstring;
		/*
		 * Integer flag = departmentService.findById(Department.class,
		 * 1).getId();
		 * if(quaconfirm.getEmployee().getDepartment().getId().intValue
		 * ()==flag.intValue()){ sstring = "taxboard_input"; } else{ sstring =
		 * "pub_exception"; }
		 */
		shi1good = shi1goodService.findById(Shi1good.class, shi1goodId);
		shi1goods = shi1goodService.findByHql("from Shi1good");
		inspector = employeeService.findByHql("from Employee");
		rper = employeeService.findByHql("from Employee");
		// return sstring;
		return "taxboard_input";
	}

	/**
	 * 跳转到冷冲件
	 * 
	 * @return
	 */
	public String taxstamInput() {
		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		quaconfirm = currentUser;
		/*
		 * String sstring; Integer flag =
		 * departmentService.findById(Department.class, 1).getId();
		 * if(quaconfirm
		 * .getEmployee().getDepartment().getId().intValue()==flag.intValue()){
		 * sstring = "taxstam_input"; } else{ sstring = "pub_exception"; }
		 */
		shi1good = shi1goodService.findById(Shi1good.class, shi1goodId);
		shi1goods = shi1goodService.findByHql("from Shi1good");
		inspector = employeeService.findByHql("from Employee");
		rper = employeeService.findByHql("from Employee");
		return "taxstam_input";
	}

	/**
	 * 板卡的添加方法
	 * 
	 * @return
	 */
	public String taxboardAdd() {
		shi1goodService.addtax(shi1goodId, shi1good, tax, taxboard);
		logger.warn("add taxboard id" + taxboard.getTax_id() + "user Id ="
				+ currentUser.getId());
		return "pub_add_success";
	}

	/**
	 * 板卡的添加方法
	 * 
	 * @return
	 */
	public String taxstamAdd() {

		shi1goodService.addtas(shi1goodId, shi1good, tas, taxstampingparts);
		logger.warn("add taxstampingparts id" + taxstampingparts.getTas_id()
				+ "user Id =" + currentUser.getId());
		return "pub_add_success";
	}

	/**
	 * 提交发货物全部审核后的方法
	 */
	public String goodlistAdd() {
		shippingnote1 = shippingnote1Service.findById(Shippingnote1.class,
				shippingnote1Id);
		goodlist = "1";
		shippingnote1.setGoodlist(goodlist);
		shippingnote1Service.saveOrUpdate(shippingnote1);
		return "return_qualitylist";
	}

	/**
	 * 交货单的提交方法（传值和减物料的功能）
	 * 
	 * @return
	 */
	public String sendedAdd() {
		shi1goodService.sended(shippingnote1Id,flag);
		return "return_examinelist";
	}

	public String tasShow() {
		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		quaconfirm = currentUser;
		shi1good = shi1goodService.findById(Shi1good.class, shi1goodId);
		taxstampingparts2 = taxstampingpartsService
				.findByHql("from Taxstampingparts t where t.shi1good.shi1gid="
						+ shi1goodId);
		shi1goods = shi1goodService.findByHql("from Shi1good");
		inspector = employeeService.findByHql("from Employee");
		rper = employeeService.findByHql("from Employee");
		return "show_tas";
	}

	public String taxShow() {
		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		quaconfirm = currentUser;
		shi1good = shi1goodService.findById(Shi1good.class, shi1goodId);
		taxboards = taxboardService
				.findByHql("from Taxboard t where t.shi1good.shi1gid="
						+ shi1goodId);
		shi1goods = shi1goodService.findByHql("from Shi1good");
		inspector = employeeService.findByHql("from Employee");
		rper = employeeService.findByHql("from Employee");
		return "show_tax";
	}

}
