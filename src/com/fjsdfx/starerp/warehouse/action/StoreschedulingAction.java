package com.fjsdfx.starerp.warehouse.action;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.security.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;

import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ItemTypeService;
import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.service.DepartmentService;
import com.fjsdfx.starerp.security.model.User;
import com.fjsdfx.starerp.warehouse.model.Feedexamine;
import com.fjsdfx.starerp.warehouse.model.Feegood;
import com.fjsdfx.starerp.warehouse.model.Rewgood;
import com.fjsdfx.starerp.warehouse.model.Rewinder;
import com.fjsdfx.starerp.warehouse.model.Storescheduling;
import com.fjsdfx.starerp.warehouse.model.Stoschgood;
import com.fjsdfx.starerp.warehouse.model.Warehouse;
import com.fjsdfx.starerp.warehouse.service.FeedexamineService;
import com.fjsdfx.starerp.warehouse.service.FeegoodService;
import com.fjsdfx.starerp.warehouse.service.InventoryService;
import com.fjsdfx.starerp.warehouse.service.MaccountingService;
import com.fjsdfx.starerp.warehouse.service.RewgoodService;
import com.fjsdfx.starerp.warehouse.service.RewinderService;
import com.fjsdfx.starerp.warehouse.service.StockService;
import com.fjsdfx.starerp.warehouse.service.StoreschedulingService;
import com.fjsdfx.starerp.warehouse.service.StoschgoodService;
import com.fjsdfx.starerp.warehouse.service.WarehouseService;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;
import com.sun.org.apache.commons.digester.rss.Image;

@Controller
@Scope("prototype")
public class StoreschedulingAction {

	private List<Integer> departmentIds;

	private List<Department> departments;

	private DepartmentService departmentService;

	private StockService stockService;

	private Feedexamine feedexamine;

	private Integer feedexamineId;

	private FeedexamineService feedexamineService;

	private List<Feegood> feegoods;

	private FeegoodService feegoodService;

	private ItemType itemType;

	private Integer itemTypeId;

	private List<Integer> itemTypeIds;

	private ItemTypeService itemTypeService;

	private InventoryService inventoryService;

	private Logger logger = LoggerFactory
			.getLogger(StoreschedulingAction.class);

	private List<Integer> qualitynums;

	private List<Rewgood> rewgoods;

	private RewgoodService rewgoodService;

	private Rewinder rewinder;

	private Integer rewinderId;

	private RewinderService rewinderService;

	private Integer stonum = 0;

	private List<Integer> stonums;

	private Storescheduling storescheduling;

	private Integer storeschedulingId;

	private StoreschedulingService storeschedulingService;

	private Integer stoschegoodId;

	private Stoschgood stoschgood;

	private List<Stoschgood> stoschgoods;

	private StoschgoodService stoschgoodService;

	private Warehouse warehouse;

	private String warehouseAcceptance;

	private Integer warehouseId;

	private WarehouseService warehouseService;

	private MaccountingService maccountingService;

	private User whmanager;

	private User whmanager2;
	
	private Department department;

	// -------------------------------addInput-------------------------------------------//
	public String addInputFeedexamine() {
		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		whmanager2 = currentUser;
		String s;
		/* if (whmanager2.getEmployee().getDepartment().getId()==2) { */
		departments = departmentService
				.findByHql("from Department where dptType=3");
		feedexamine = feedexamineService.findById(Feedexamine.class,
				feedexamineId);
		feegoods = feegoodService
				.findByHql("from Feegood f where f.feedexamine.fee_id="
						+ feedexamineId + " and f.exresult = true");
		for (int i = 0; i < feegoods.size(); i++) {
			stonum += feegoods.get(i).getFactno();
		}
		s = "add_feedexamine";
		/*
		 * } else s = "pub_exception";
		 */
		return s;
	}

	public String addInputRewinder() {
		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		whmanager = currentUser;
		String s;
		/* if (whmanager.getEmployee().getDepartment().getId()==2) { */
		departments = departmentService
				.findByHql("from Department where dptType=3");
		rewinder = rewinderService.findById(Rewinder.class, rewinderId);
		rewgoods = rewgoodService
				.findByHql("from Rewgood rg where rg.rewinder.rew_id="
						+ rewinderId + "and rg.rewexamine=true");
		for (int i = 0; i < rewgoods.size(); i++) {
			stonum += rewgoods.get(i).getFactno();
		}
		s = "add_rewinder";
		/*
		 * } else s = "pub_exception";
		 */
		return s;
	}

	public String addInputWarehouse() {
		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		whmanager = currentUser;
		String s;
		/*if (whmanager.getEmployee().getDepartment().getId() == 2) {*/
			departments = departmentService
					.findByHql("from Department where dptType=3");
			warehouse = warehouseService.findById(Warehouse.class, warehouseId);
			s = "add_warehouse";
		/*} else*/
			//s = "pub_exception";
		return s;
	}

	/**
	 * 进料验收单入库
	 * 
	 * @return
	 */
	public String addfeedexamine() {
		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		whmanager2 = currentUser;
		stoschgoodService.addfeedexamine(storescheduling,feedexamineId,whmanager2,itemTypeIds,
				qualitynums, stonums, departmentIds);
		/*storeschedulingService.saveAndRefresh(storescheduling);
		feedexamine = feedexamineService.findById(Feedexamine.class,
				feedexamineId);
		feegoods = feegoodService
				.findByHql("from Feegood f where f.feedexamine.fee_id="
						+ feedexamineId);
		feedexamine.setWarehouseDate(storescheduling.getReqstodate());
		feedexamine.setWhmanager2(whmanager2.getEmployee());
		stoschgoodService.savestoschgoods(storescheduling, itemTypeIds,
				qualitynums, stonums, departmentIds);*/
		return "pub_add_success";
	}

	/**
	 * 收料通知单单入库
	 * 
	 * @return
	 */
	public String addrewinder() {
		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		whmanager = currentUser;
		stoschgoodService.addrewinder(storescheduling,rewinderId,whmanager,itemTypeIds,qualitynums,stonums,departmentIds);
		return "pub_add_success";
	}

	/**
	 * 产品进仓单入库
	 * 
	 * @return
	 */
	public String addwarehouse() {
		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		whmanager = currentUser;
		
		stoschgoodService.addwarehouse(storescheduling,whmanager,warehouseId,stonum,department);
		return "pub_add_success";
	}

	public User getWhmanager2() {
		return whmanager2;
	}

	public void setWhmanager2(User whmanager2) {
		this.whmanager2 = whmanager2;
	}

	public User getWhmanager() {
		return whmanager;
	}

	public void setWhmanager(User whmanager) {
		this.whmanager = whmanager;
	}

	public InventoryService getInventoryService() {
		return inventoryService;
	}

	@Resource
	public void setInventoryService(InventoryService inventoryService) {
		this.inventoryService = inventoryService;
	}

	public List<Integer> getDepartmentIds() {
		return departmentIds;
	}

	public List<Department> getDepartments() {
		return departments;
	}

	public DepartmentService getDepartmentService() {
		return departmentService;
	}

	public Feedexamine getFeedexamine() {
		return feedexamine;
	}

	public Integer getFeedexamineId() {
		return feedexamineId;
	}

	public FeedexamineService getFeedexamineService() {
		return feedexamineService;
	}

	public List<Feegood> getFeegoods() {
		return feegoods;
	}

	public FeegoodService getFeegoodService() {
		return feegoodService;
	}

	public ItemType getItemType() {
		return itemType;
	}

	public Integer getItemTypeId() {
		return itemTypeId;
	}

	public List<Integer> getItemTypeIds() {
		return itemTypeIds;
	}

	public ItemTypeService getItemTypeService() {
		return itemTypeService;
	}

	public Logger getLogger() {
		return logger;
	}

	public List<Integer> getQualitynums() {
		return qualitynums;
	}

	public List<Rewgood> getRewgoods() {
		return rewgoods;
	}

	public RewgoodService getRewgoodService() {
		return rewgoodService;
	}

	public Rewinder getRewinder() {
		return rewinder;
	}

	public Integer getRewinderId() {
		return rewinderId;
	}

	public RewinderService getRewinderService() {
		return rewinderService;
	}

	public Integer getStonum() {
		return stonum;
	}

	public List<Integer> getStonums() {
		return stonums;
	}

	public Storescheduling getStorescheduling() {
		return storescheduling;
	}

	public Integer getStoreschedulingId() {
		return storeschedulingId;
	}

	public StoreschedulingService getStoreschedulingService() {
		return storeschedulingService;
	}

	public Integer getStoschegoodId() {
		return stoschegoodId;
	}

	public Stoschgood getStoschgood() {
		return stoschgood;
	}

	public List<Stoschgood> getStoschgoods() {
		return stoschgoods;
	}

	public StoschgoodService getStoschgoodService() {
		return stoschgoodService;
	}

	public Warehouse getWarehouse() {
		return warehouse;
	}

	public String getWarehouseAcceptance() {
		return warehouseAcceptance;
	}

	public Integer getWarehouseId() {
		return warehouseId;
	}

	public WarehouseService getWarehouseService() {
		return warehouseService;
	}

	public void setDepartmentIds(List<Integer> departmentIds) {
		this.departmentIds = departmentIds;
	}

	public void setDepartments(List<Department> departments) {
		this.departments = departments;
	}

	@Resource
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}

	public void setFeedexamine(Feedexamine feedexamine) {
		this.feedexamine = feedexamine;
	}

	public void setFeedexamineId(Integer feedexamineId) {
		this.feedexamineId = feedexamineId;
	}

	@Resource
	public void setFeedexamineService(FeedexamineService feedexamineService) {
		this.feedexamineService = feedexamineService;
	}

	public StockService getStockService() {
		return stockService;
	}

	@Resource
	public void setStockService(StockService stockService) {
		this.stockService = stockService;
	}

	public void setFeegoods(List<Feegood> feegoods) {
		this.feegoods = feegoods;
	}

	@Resource
	public void setFeegoodService(FeegoodService feegoodService) {
		this.feegoodService = feegoodService;
	}

	public void setItemType(ItemType itemType) {
		this.itemType = itemType;
	}

	public void setItemTypeId(Integer itemTypeId) {
		this.itemTypeId = itemTypeId;
	}

	public void setItemTypeIds(List<Integer> itemTypeIds) {
		this.itemTypeIds = itemTypeIds;
	}

	@Resource
	public void setItemTypeService(ItemTypeService itemTypeService) {
		this.itemTypeService = itemTypeService;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	public void setQualitynums(List<Integer> qualitynums) {
		this.qualitynums = qualitynums;
	}

	public void setRewgoods(List<Rewgood> rewgoods) {
		this.rewgoods = rewgoods;
	}

	@Resource
	public void setRewgoodService(RewgoodService rewgoodService) {
		this.rewgoodService = rewgoodService;
	}

	public void setRewinder(Rewinder rewinder) {
		this.rewinder = rewinder;
	}

	public void setRewinderId(Integer rewinderId) {
		this.rewinderId = rewinderId;
	}

	@Resource
	public void setRewinderService(RewinderService rewinderService) {
		this.rewinderService = rewinderService;
	}

	public void setStonum(Integer stonum) {
		this.stonum = stonum;
	}

	public void setStonums(List<Integer> stonums) {
		this.stonums = stonums;
	}

	public void setStorescheduling(Storescheduling storescheduling) {
		this.storescheduling = storescheduling;
	}

	public void setStoreschedulingId(Integer storeschedulingId) {
		storeschedulingId = storeschedulingId;
	}

	@Resource
	public void setStoreschedulingService(
			StoreschedulingService storeschedulingService) {
		this.storeschedulingService = storeschedulingService;
	}

	public void setStoschegoodId(Integer stoschegoodId) {
		this.stoschegoodId = stoschegoodId;
	}

	public void setStoschgood(Stoschgood stoschgood) {
		this.stoschgood = stoschgood;
	}

	public void setStoschgoods(List<Stoschgood> stoschgoods) {
		this.stoschgoods = stoschgoods;
	}

	@Resource
	public void setStoschgoodService(StoschgoodService stoschgoodService) {
		this.stoschgoodService = stoschgoodService;
	}

	public void setWarehouse(Warehouse warehouse) {
		this.warehouse = warehouse;
	}

	public void setWarehouseAcceptance(String warehouseAcceptance) {
		this.warehouseAcceptance = warehouseAcceptance;
	}

	public void setWarehouseId(Integer warehouseId) {
		this.warehouseId = warehouseId;
	}

	@Resource
	public void setWarehouseService(WarehouseService warehouseService) {
		this.warehouseService = warehouseService;
	}

	public MaccountingService getMaccountingService() {
		return maccountingService;
	}

	@Resource
	public void setMaccountingService(MaccountingService maccountingService) {
		this.maccountingService = maccountingService;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	
}
