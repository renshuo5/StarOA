package com.fjsdfx.starerp.warehouse.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ItemTypeService;
import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.service.DepartmentService;
import com.fjsdfx.starerp.security.model.User;
import com.fjsdfx.starerp.warehouse.model.Feedexamine;
import com.fjsdfx.starerp.warehouse.model.Rewgood;
import com.fjsdfx.starerp.warehouse.model.Rewinder;
import com.fjsdfx.starerp.warehouse.model.Storescheduling;
import com.fjsdfx.starerp.warehouse.model.Stoschgood;
import com.fjsdfx.starerp.warehouse.model.Warehouse;
import com.fjsdfx.starerp.warehouse.service.FeedexamineService;
import com.fjsdfx.starerp.warehouse.service.InventoryService;
import com.fjsdfx.starerp.warehouse.service.MaccountingService;
import com.fjsdfx.starerp.warehouse.service.RewgoodService;
import com.fjsdfx.starerp.warehouse.service.RewinderService;
import com.fjsdfx.starerp.warehouse.service.StockService;
import com.fjsdfx.starerp.warehouse.service.StoreschedulingService;
import com.fjsdfx.starerp.warehouse.service.StoschgoodService;
import com.fjsdfx.starerp.warehouse.service.WarehouseService;
import com.sun.org.apache.commons.digester.rss.Image;

@Service
@Transactional
public class StoschgoodServiceImpl extends BaseServiceImpl<Stoschgood>
		implements StoschgoodService {

	private ItemTypeService itemTypeService;

	private DepartmentService departmentService;

	private StockService stockService;

	private MaccountingService maccountingService;

	private StoreschedulingService storeschedulingService;

	private Warehouse warehouse;

	private WarehouseService warehouseService;

	private Stoschgood stoschgood;

	private InventoryService inventoryService;

	private Rewinder rewinder;

	private RewinderService rewinderService;

	private List<Rewgood> rewgoods;

	private RewgoodService rewgoodService;

	private Feedexamine feedexamine;

	private FeedexamineService feedexamineService;

	public Feedexamine getFeedexamine() {
		return feedexamine;
	}

	public void setFeedexamine(Feedexamine feedexamine) {
		this.feedexamine = feedexamine;
	}

	public FeedexamineService getFeedexamineService() {
		return feedexamineService;
	}

	@Resource
	public void setFeedexamineService(FeedexamineService feedexamineService) {
		this.feedexamineService = feedexamineService;
	}

	public RewgoodService getRewgoodService() {
		return rewgoodService;
	}

	@Resource
	public void setRewgoodService(RewgoodService rewgoodService) {
		this.rewgoodService = rewgoodService;
	}

	public List<Rewgood> getRewgoods() {
		return rewgoods;
	}

	public void setRewgoods(List<Rewgood> rewgoods) {
		this.rewgoods = rewgoods;
	}

	public Rewinder getRewinder() {
		return rewinder;
	}

	public void setRewinder(Rewinder rewinder) {
		this.rewinder = rewinder;
	}

	public RewinderService getRewinderService() {
		return rewinderService;
	}

	@Resource
	public void setRewinderService(RewinderService rewinderService) {
		this.rewinderService = rewinderService;
	}

	public InventoryService getInventoryService() {
		return inventoryService;
	}

	@Resource
	public void setInventoryService(InventoryService inventoryService) {
		this.inventoryService = inventoryService;
	}

	public Stoschgood getStoschgood() {
		return stoschgood;
	}

	public void setStoschgood(Stoschgood stoschgood) {
		this.stoschgood = stoschgood;
	}

	public WarehouseService getWarehouseService() {
		return warehouseService;
	}

	@Resource
	public void setWarehouseService(WarehouseService warehouseService) {
		this.warehouseService = warehouseService;
	}

	public Warehouse getWarehouse() {
		return warehouse;
	}

	public void setWarehouse(Warehouse warehouse) {
		this.warehouse = warehouse;
	}

	public StoreschedulingService getStoreschedulingService() {
		return storeschedulingService;
	}

	@Resource
	public void setStoreschedulingService(
			StoreschedulingService storeschedulingService) {
		this.storeschedulingService = storeschedulingService;
	}

	public StockService getStockService() {
		return stockService;
	}

	public MaccountingService getMaccountingService() {
		return maccountingService;
	}

	@Resource
	public void setMaccountingService(MaccountingService maccountingService) {
		this.maccountingService = maccountingService;
	}

	@Resource
	public void setStockService(StockService stockService) {
		this.stockService = stockService;
	}

	public DepartmentService getDepartmentService() {
		return departmentService;
	}

	@Resource
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}

	public ItemTypeService getItemTypeService() {
		return itemTypeService;
	}

	@Resource
	public void setItemTypeService(ItemTypeService itemTypeService) {
		this.itemTypeService = itemTypeService;
	}

	/**
	 * 添加入库物料
	 */
	public void savestoschgoods(Storescheduling storescheduling,
			List<Integer> itemTypeIds, List<Integer> qualitynums,
			List<Integer> stonums, List<Integer> departmentIds) {
		// TODO Auto-generated method stub
		storeschedulingService.saveAndRefresh(storescheduling);
		for (int i = 0; i < itemTypeIds.size(); i++) {
			if (itemTypeIds.get(i) != null && stonums.get(i) != null
					&& departmentIds.get(i) != null) {
				Stoschgood stoschgood = new Stoschgood();
				stoschgood.setStorescheduling(storescheduling);
				stoschgood.setItemType(itemTypeService.findById(ItemType.class,
						itemTypeIds.get(i)));
				stoschgood.setStonum(stonums.get(i));
				stoschgood.setDepartment(departmentService.findById(
						Department.class, departmentIds.get(i)));
				this.saveAndRefresh(stoschgood);
				stockService.addNumber(stoschgood.getItemType(), stoschgood
						.getDepartment().getDptName(), stoschgood.getStonum());
				maccountingService.addEnNumber(stoschgood.getStorescheduling()
						.getReqstodate(), stoschgood.getItemType(), stoschgood
						.getDepartment().getDptName(), stoschgood.getStonum());
			}

		}
	}

	/**
	 * 产品进仓单入库
	 * 
	 * @return
	 */
	public void addwarehouse(Storescheduling storescheduling, User whmanager,
			Integer warehouseId, Integer stonum, Department department) {

		storeschedulingService.saveAndRefresh(storescheduling);
		if (storescheduling.getReqstodate() != null && stonum != null
				&& department.getId() != null) {
			warehouse = warehouseService.findById(Warehouse.class, warehouseId);
			storescheduling.setStorsn(warehouse.getWar_id());
			storeschedulingService.saveOrUpdate(storescheduling);
			warehouse.setWarehouseDate(storescheduling.getReqstodate());
			warehouse.setWhmg(whmanager.getEmployee());
			warehouseService.update(warehouse);
			Stoschgood stoschgood = new Stoschgood();
			stoschgood.setStorescheduling(storescheduling);
			stoschgood.setItemType(warehouse.getItemType());
			stoschgood.setStonum(stonum);
			stoschgood.setDepartment(department);
			this.saveAndRefresh(stoschgood);
			stockService.addNumber(stoschgood.getItemType(), stoschgood
					.getDepartment().getDptName(), stoschgood.getStonum());
			maccountingService.addEnNumber(warehouse.getWarehouseDate(),
					warehouse.getItemType(), stoschgood.getDepartment()
							.getDptName(), stoschgood.getStonum());
			inventoryService.subWsNumByPro(warehouse.getItemType(), warehouse
					.getWarno());
		}

	}

	/**
	 * 收料通知单单入库
	 * 
	 * @return
	 */
	public void addrewinder(Storescheduling storescheduling,
			Integer rewinderId, User whmanager, List<Integer> itemTypeIds,
			List<Integer> qualitynums, List<Integer> stonums,
			List<Integer> departmentIds) {
		storeschedulingService.saveAndRefresh(storescheduling);
		if (storescheduling.getReqstodate() != null) {
			boolean flag = true;
			for (int i = 0; i < itemTypeIds.size(); i++) {
				while (stonums.get(i) == null) {
					flag = false;
					break;
				}
			}
			if (flag) {
				rewinder = rewinderService.findById(Rewinder.class, rewinderId);
				storescheduling.setStorsn(rewinder.getRew_id());
				storeschedulingService.update(storescheduling);
				rewinder.setWhmanager(whmanager.getEmployee());
				rewinder.setWarehouseDate(storescheduling.getReqstodate());
				for (int i = 0; i < itemTypeIds.size(); i++) {
					if (itemTypeIds.get(i) != null && stonums.get(i) != null
							&& departmentIds.get(i) != null) {
						Stoschgood stoschgood = new Stoschgood();
						stoschgood.setStorescheduling(storescheduling);
						stoschgood.setItemType(itemTypeService.findById(
								ItemType.class, itemTypeIds.get(i)));
						stoschgood.setStonum(stonums.get(i));
						stoschgood.setDepartment(departmentService.findById(
								Department.class, departmentIds.get(i)));
						this.saveAndRefresh(stoschgood);
						System.out.println("stockService = " + stockService
								+ ",stoschgood = " + stoschgood);
						stockService.addNumber(stoschgood.getItemType(),
								stoschgood.getDepartment().getDptName(),
								stoschgood.getStonum());
						maccountingService.addEnNumber(stoschgood
								.getStorescheduling().getReqstodate(),
								stoschgood.getItemType(), stoschgood
										.getDepartment().getDptName(),
								stoschgood.getStonum());
					}

				}
			}

		}

	}

	public void addfeedexamine(Storescheduling storescheduling,
			Integer feedexamineId, User whmanager2, List<Integer> itemTypeIds,
			List<Integer> qualitynums, List<Integer> stonums,
			List<Integer> departmentIds) {
		storeschedulingService.saveAndRefresh(storescheduling);
		if (storescheduling.getReqstodate() != null) {
			boolean flag = true;
			for (int i = 0; i < itemTypeIds.size(); i++) {
				while (stonums.get(i) == null) {
					flag = false;
					break;
				}
			}
			if (flag) {
				feedexamine = feedexamineService.findById(Feedexamine.class,
						feedexamineId);
				storescheduling.setStorsn(feedexamine.getFee_id());
				storeschedulingService.update(storescheduling);
				feedexamine.setWhmanager2(whmanager2.getEmployee());
				feedexamine.setWarehouseDate(storescheduling.getReqstodate());

				for (int i = 0; i < itemTypeIds.size(); i++) {
					if (itemTypeIds.get(i) != null && stonums.get(i) != null
							&& departmentIds.get(i) != null) {
						Stoschgood stoschgood = new Stoschgood();
						stoschgood.setStorescheduling(storescheduling);
						stoschgood.setItemType(itemTypeService.findById(
								ItemType.class, itemTypeIds.get(i)));
						stoschgood.setStonum(stonums.get(i));
						stoschgood.setDepartment(departmentService.findById(
								Department.class, departmentIds.get(i)));
						this.saveAndRefresh(stoschgood);
						stockService.addNumber(stoschgood.getItemType(),
								stoschgood.getDepartment().getDptName(),
								stoschgood.getStonum());
						maccountingService.addEnNumber(stoschgood
								.getStorescheduling().getReqstodate(),
								stoschgood.getItemType(), stoschgood
										.getDepartment().getDptName(),
								stoschgood.getStonum());
					}

				}
			}

		}
	}

}
