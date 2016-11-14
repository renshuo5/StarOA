package com.fjsdfx.starerp.warehouse.action;

import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.service.DepartmentService;
import com.fjsdfx.starerp.purchase.model.Purgood;
import com.fjsdfx.starerp.purchase.model.Purorder;
import com.fjsdfx.starerp.purchase.model.Quaprolist;
import com.fjsdfx.starerp.purchase.model.Requisitions;
import com.fjsdfx.starerp.purchase.model.Resgood;
import com.fjsdfx.starerp.purchase.model.Supplierinfo;
import com.fjsdfx.starerp.purchase.service.PurgoodService;
import com.fjsdfx.starerp.purchase.service.PurorderService;
import com.fjsdfx.starerp.purchase.service.QuaprolistService;
import com.fjsdfx.starerp.purchase.service.RequisitionsService;
import com.fjsdfx.starerp.purchase.service.ResgoodService;
import com.fjsdfx.starerp.purchase.service.SupplierinfoService;
import com.fjsdfx.starerp.security.model.User;
import org.springframework.security.context.SecurityContextHolder;

import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ItemTypeService;
import com.fjsdfx.starerp.warehouse.model.Feedexamine;
import com.fjsdfx.starerp.warehouse.model.Feegood;
import com.fjsdfx.starerp.warehouse.model.Rewinder;
import com.fjsdfx.starerp.warehouse.model.Warehouse;
import com.fjsdfx.starerp.warehouse.service.FeedexamineService;
import com.fjsdfx.starerp.warehouse.service.FeegoodService;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;

@Controller
@Scope("prototype")
public class FeedexamineAction {

	private List<Integer> bsnos;

	private List<Boolean> confirmnums;

	private Boolean confirm = false;

	private List<Integer> factnos;

	private Feedexamine feedexamine;

	private Integer feedexamineId;

	private FeedexamineService feedexamineService;

	private Feegood feegood;

	private Integer feegoodId;

	private List<Feegood> feegoods;

	private FeegoodService feegoodService;

	private List<String> fnotes;

	private List<Integer> fpnums;

	private List<Integer> itemTypeIds;

	private List<ItemType> itemTypes;

	private ItemTypeService itemTypeService;

	private Logger logger = LoggerFactory.getLogger(FeedexamineAction.class);

	private PagerModel pm;

	private User feebuyer;

	private User whmanager;

	private User whmanager2;

	private User finspector;

	private Integer quaprolistId;

	private QuaprolistService quaprolistService;

	private Quaprolist supplier;

	private DepartmentService departmentService;

	private List<Boolean> exresults;

	private Integer shownum;

	private Integer requisitionsId;

	private Requisitions requisitions;

	private RequisitionsService requisitionsService;

	private List<Resgood> resgoods;

	private ResgoodService resgoodService;

	private Integer supplierinfoId;

	private SupplierinfoService supplierinfoService;

	private Purorder purorder;

	private Integer purorderId;

	private PurgoodService purgoodService;

	private PurorderService purorderService;

	private List<Purgood> purgoods;

	/**
	 *显示
	 * 
	 * @return
	 */
	public String show() {
		feedexamine = feedexamineService.findById(Feedexamine.class,
				feedexamineId);
		feegoods = feegoodService
				.findByHql("from Feegood fg where fg.feedexamine.fee_id="
						+ feedexamineId);
		shownum = 1;
		return "show";
	}

	/**
	 * 合格品显示
	 * 
	 * @return
	 */
	public String qualifyshow() {
		feedexamine = feedexamineService.findById(Feedexamine.class,
				feedexamineId);
		feegoods = feegoodService
				.findByHql("from Feegood fg where fg.feedexamine.fee_id="
						+ feedexamineId + " and fg.exresult = true");
		shownum = 0;
		return "show";
	}

	/**
	 * 不合格品显示
	 */
	public String unqualifyshow() {
		feedexamine = feedexamineService.findById(Feedexamine.class,
				feedexamineId);
		feegoods = feegoodService
				.findByHql("from Feegood fg where fg.feedexamine.fee_id="
						+ feedexamineId + " and fg.exresult = false");
		shownum = 2;
		return "show";
	}

	/**
	 *编辑
	 * 
	 * @return
	 */
	public String update() {
		feedexamineService.updatefeedexamine(feedexamine, bsnos, itemTypeIds,
				fpnums, fnotes);
		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		logger.warn(currentUser.getId() + " edit feedexamine "
				+ feedexamineId);
		return "pub_update_success";
	}

	/**
	 * 请购单添加物料
	 * 
	 * @return
	 * @throws ParseException
	 */
	public String add() throws ParseException {
		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		// feebuyer = currentUser;
		// supplier = quaprolistService.findById(Quaprolist.class,
		// quaprolistId);
		System.out.println("+++++++++++++++=" + requisitionsId);
		requisitions = requisitionsService.findById(Requisitions.class,
				requisitionsId);
		requisitions.setEnter(true);
		requisitionsService.update(requisitions);
		feedexamineService
				.save(feedexamine, bsnos, itemTypeIds, fpnums, fnotes);
		logger.warn(currentUser.getId() + " save feedexamine from requisitions "
				+ feedexamine.getFee_id());
		return "pub_add_success";
	}

	/**
	 * 采购订单添加物料
	 */
	public String addpur() throws ParseException {
		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		// feebuyer = currentUser;
		// supplier = quaprolistService.findById(Quaprolist.class,
		// quaprolistId);
		purorder = purorderService.findById(Purorder.class, purorderId);
		purorder.setEnter(true);
		purorderService.update(purorder);
		feedexamineService
				.save(feedexamine, bsnos, itemTypeIds, fpnums, fnotes);
		logger.warn(currentUser.getId() + " save feedexamine from purorder "
				+ feedexamine.getFee_id());
		return "pub_add_success";
	}

	/**
	 * 核对数量
	 * 
	 * @return
	 */
	public String confirm() {
		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		whmanager = currentUser;
		feedexamineService.confirm(feedexamineId, whmanager, confirmnums,
				factnos);
		return "pub_update_success";
	}

	/**
	 * 删除
	 * 
	 * @return
	 */
	public String del() {

		feedexamineService.delfeexexamine(feedexamineId);
		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		logger.warn(currentUser.getId() + " delete feedexamine "
				+ feedexamineId);
		return "pub_del_success";
	}

	/**
	 * 检验
	 * 
	 * @return
	 */
	public String examinepgb() {
		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		finspector = currentUser;
		feedexamineService.examinefeedexamine(feedexamineId, finspector,
				factnos, exresults);
		return "pub_update_success";
	}

	// ------------------------------------Input------------------------------------//
	/**
	 * 
	 */
	public String addInput() {
		/*
		 * User currentUser = (User) SecurityContextHolder.getContext()
		 * .getAuthentication().getPrincipal();
		 */
		requisitions = requisitionsService.findById(Requisitions.class,
				requisitionsId);
		resgoods = resgoodService
				.findByHql("from Resgood rs where rs.requisitions.id="
						+ requisitionsId);
		return "add_input";
	}

	public String addInput2() {
		/*
		 * User currentUser = (User) SecurityContextHolder.getContext()
		 * .getAuthentication().getPrincipal();
		 */
		purorder = purorderService.findById(Purorder.class, purorderId);
		purgoods = purgoodService
				.findByHql("from Purgood pg where pg.purorder.id=" + purorderId);
		return "add_input2";
	}

	public String confirmInput() {
		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		whmanager = currentUser;
		String s;

		/* if (whmanager.getEmployee().getDepartment().getDptType() == 3) { */
		feedexamine = feedexamineService.findById(Feedexamine.class,
				feedexamineId);
		feegoods = feegoodService
				.findByHql("from Feegood f where f.feedexamine.fee_id="
						+ feedexamineId);
		s = "confirm_input";
		/*
		 * } else s = "pub_exception";
		 */

		return s;
	}

	public String editInput() {
		feedexamine = feedexamineService.findById(Feedexamine.class,
				feedexamineId);
		feegoods = feegoodService
				.findByHql("from Feegood fg where fg.feedexamine.fee_id="
						+ feedexamineId+" and fg.exresult = false");
		return "edit_input";
	}

	public String examineInput() {
		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		finspector = currentUser;
		String s;
		/*
		 * if (finspector.getEmployee().getDepartment().getId().equals(
		 * departmentService.findById(Department.class, 1).getId())) {
		 */
		feedexamine = feedexamineService.findById(Feedexamine.class,
				feedexamineId);
		feegoods = feegoodService
				.findByHql("from Feegood f where f.feedexamine.fee_id="
						+ feedexamineId);
		s = "examine_input";
		/*
		 * } else s = "pub_exception";
		 */
		return s;
	}

	/**
	 * List
	 * 
	 * @return
	 * @throws ParseException
	 */

	/**
	 * 已检验列表(待入库)
	 * 
	 * @return
	 */
	public String examinedList() {
		pm = feedexamineService.getPagerDesc(Feedexamine.class,
				"where o.finspector is not null and o.whmanager is not null and o.whmanager2 is null");
		feegoods = feegoodService
				.findByHql("from Feegood fg where fg.feedexamine.fee_id="
						+ feedexamineId);
		return "list";
	}

	/**
	 *待检验列表
	 * 
	 * @return
	 */
	public String examineList() {
		// TODO Auto-generated method stub
		pm = feedexamineService
				.getPagerDesc(
						Feedexamine.class,
						"where o.finspector is null and o.whmanager is not null and o.whmanager2 is null");
		/*
		 * feegoods = feegoodService
		 * .findByHql("from Feegood fg where fg.feedexamine.fee_id=" +
		 * feedexamineId);
		 */
		return "examine_list";
	}

	/**
	 * 所有列表
	 * 
	 * @return
	 */
	public String list() {
		// TODO Auto-generated method stub
		pm = feedexamineService.getPagerDesc(Feedexamine.class);
		pm = feedexamineService
				.getPager(
						Feedexamine.class,
						"where (o.finspector is null and o.whmanager is  null) "
								+ " or (o.finspector is not null and o.whmanager is not null and o.fee_id in(select fg.feedexamine.fee_id from Feegood fg where fg.exresult = true))");
		// 
		// + " */
		// feegoods = feegoodService.findByHql("from Feegood");
		return "list";
	}

	/**
	 * 不合格品列表
	 */
	public String unqualifylist() {
		// TODO Auto-generated method stub
		pm = feedexamineService.getPagerDesc(Feedexamine.class);
		pm = feedexamineService
				.getPager(
						Feedexamine.class,
						"where o.finspector is not null and o.whmanager is not null and o.fee_id in(select fg.feedexamine.fee_id from Feegood fg where fg.exresult = false)");
		// 
		// + " */
		// feegoods = feegoodService.findByHql("from Feegood");
		return "unqualify_list";
	}

	/**
	 * 待核对数量列表
	 * 
	 * @return
	 */
	public String notConfirmList() {
		pm = feedexamineService.getPagerDesc(Feedexamine.class,
				"where o.finspector is null and o.whmanager is  null");
		feegoods = feegoodService
				.findByHql("from Feegood fg where fg.feedexamine.fee_id="
						+ feedexamineId);
		return "list";
	}

	/**
	 * search
	 * 
	 * @return
	 * @throws ParseException
	 */
	/**
	 * 待检验列表查询
	 * 
	 * @param bsnos
	 */
	public String examinesearch() {
		pm = feedexamineService
				.getPagerDesc(
						Feedexamine.class,
						"where o.finspector is null and o.whmanager is not null and o.supplier.supplierinfo.supcname like '%"
								+ feedexamine.getSupplier().getSupplierinfo()
										.getSupcname() + "%'");
		return "examine_list";
	}

	/**
	 * 查询
	 * 
	 * @return
	 */
	public String search() {
		pm = feedexamineService
				.getPagerDesc(
						Feedexamine.class,
						"where o.finspector is null and o.whmanager is  null "
								+ "and o.supplier.supplierinfo.supcname like '%"
								+ feedexamine.getSupplier().getSupplierinfo()
										.getSupcname()
								+ "%'"
								+ " or o.finspector is not null and o.whmanager is not null and o.fee_id in(select fg.feedexamine.fee_id from Feegood fg where fg.exresult = true)"
								+ " and o.supplier.supplierinfo.supcname like '%"
								+ feedexamine.getSupplier().getSupplierinfo()
										.getSupcname() + "%')");

		return "list";
	}

	/**
	 * 不合格品列表查询
	 * 
	 * @return
	 */
	public String unqualifysearch() {
		pm = feedexamineService
				.getPagerDesc(
						Feedexamine.class,
						"where o.finspector is not null and o.whmanager is not null and o.fee_id in(select fg.feedexamine.fee_id from Feegood fg where fg.exresult = false)"
								+ " and o.supplier.supplierinfo.supcname like '%"
								+ feedexamine.getSupplier().getSupplierinfo()
										.getSupcname() + "%'");
		return "unqualify_list";
	}

	public List<Integer> getBsnos() {
		return bsnos;
	}

	public Boolean getConfirm() {
		return confirm;
	}

	public List<Boolean> getConfirmnums() {
		return confirmnums;
	}

	public DepartmentService getDepartmentService() {
		return departmentService;
	}

	public List<Integer> getFactnos() {
		return factnos;
	}

	public User getFeebuyer() {
		return feebuyer;
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

	public Feegood getFeegood() {
		return feegood;
	}

	public Integer getFeegoodId() {
		return feegoodId;
	}

	public List<Feegood> getFeegoods() {
		return feegoods;
	}

	public FeegoodService getFeegoodService() {
		return feegoodService;
	}

	public User getFinspector() {
		return finspector;
	}

	public List<String> getFnotes() {
		return fnotes;
	}

	public List<Integer> getFpnums() {
		return fpnums;
	}

	public List<Integer> getItemTypeIds() {
		return itemTypeIds;
	}

	public List<ItemType> getItemTypes() {
		return itemTypes;
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

	public Integer getQuaprolistId() {
		return quaprolistId;
	}

	public QuaprolistService getQuaprolistService() {
		return quaprolistService;
	}

	public Quaprolist getSupplier() {
		return supplier;
	}

	public User getWhmanager() {
		return whmanager;
	}

	public User getWhmanager2() {
		return whmanager2;
	}

	public void setBsnos(List<Integer> bsnos) {
		this.bsnos = bsnos;
	}

	public void setConfirm(Boolean confirm) {
		this.confirm = confirm;
	}

	public void setConfirmnums(List<Boolean> confirmnums) {
		this.confirmnums = confirmnums;
	}

	@Resource
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}

	public void setFactnos(List<Integer> factnos) {
		this.factnos = factnos;
	}

	public void setFeebuyer(User feebuyer) {
		this.feebuyer = feebuyer;
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

	public void setFeegood(Feegood feegood) {
		this.feegood = feegood;
	}

	public void setFeegoodId(Integer feegoodId) {
		this.feegoodId = feegoodId;
	}

	public void setFeegoods(List<Feegood> feegoods) {
		this.feegoods = feegoods;
	}

	@Resource
	public void setFeegoodService(FeegoodService feegoodService) {
		this.feegoodService = feegoodService;
	}

	public void setFinspector(User finspector) {
		this.finspector = finspector;
	}

	public void setFnotes(List<String> fnotes) {
		this.fnotes = fnotes;
	}

	public void setFpnums(List<Integer> fpnums) {
		this.fpnums = fpnums;
	}

	public void setItemTypeIds(List<Integer> itemTypeIds) {
		this.itemTypeIds = itemTypeIds;
	}

	public void setItemTypes(List<ItemType> itemTypes) {
		this.itemTypes = itemTypes;
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

	public void setQuaprolistId(Integer quaprolistId) {
		this.quaprolistId = quaprolistId;
	}

	@Resource
	public void setQuaprolistService(QuaprolistService quaprolistService) {
		this.quaprolistService = quaprolistService;
	}

	public void setSupplier(Quaprolist supplier) {
		this.supplier = supplier;
	}

	public void setWhmanager(User whmanager) {
		this.whmanager = whmanager;
	}

	public void setWhmanager2(User whmanager2) {
		this.whmanager2 = whmanager2;
	}

	public List<Boolean> getExresults() {
		return exresults;
	}

	public void setExresults(List<Boolean> exresults) {
		this.exresults = exresults;
	}

	public Integer getRequisitionsId() {
		return requisitionsId;
	}

	public void setRequisitionsId(Integer requisitionsId) {
		this.requisitionsId = requisitionsId;
	}

	public RequisitionsService getRequisitionsService() {
		return requisitionsService;
	}

	@Resource
	public void setRequisitionsService(RequisitionsService requisitionsService) {
		this.requisitionsService = requisitionsService;
	}

	public Requisitions getRequisitions() {
		return requisitions;
	}

	public void setRequisitions(Requisitions requisitions) {
		this.requisitions = requisitions;
	}

	public List<Resgood> getResgoods() {
		return resgoods;
	}

	public void setResgoods(List<Resgood> resgoods) {
		this.resgoods = resgoods;
	}

	public ResgoodService getResgoodService() {
		return resgoodService;
	}

	@Resource
	public void setResgoodService(ResgoodService resgoodService) {
		this.resgoodService = resgoodService;
	}

	public Purorder getPurorder() {
		return purorder;
	}

	public void setPurorder(Purorder purorder) {
		this.purorder = purorder;
	}

	public Integer getPurorderId() {
		return purorderId;
	}

	public void setPurorderId(Integer purorderId) {
		this.purorderId = purorderId;
	}

	public PurgoodService getPurgoodService() {
		return purgoodService;
	}

	@Resource
	public void setPurgoodService(PurgoodService purgoodService) {
		this.purgoodService = purgoodService;
	}

	public PurorderService getPurorderService() {
		return purorderService;
	}

	@Resource
	public void setPurorderService(PurorderService purorderService) {
		this.purorderService = purorderService;
	}

	public List<Purgood> getPurgoods() {
		return purgoods;
	}

	public void setPurgoods(List<Purgood> purgoods) {
		this.purgoods = purgoods;
	}

	public SupplierinfoService getSupplierinfoService() {
		return supplierinfoService;
	}

	@Resource
	public void setSupplierinfoService(SupplierinfoService supplierinfoService) {
		this.supplierinfoService = supplierinfoService;
	}

	public Integer getSupplierinfoId() {
		return supplierinfoId;
	}

	public void setSupplierinfoId(Integer supplierinfoId) {
		this.supplierinfoId = supplierinfoId;
	}

	public Integer getShownum() {
		return shownum;
	}

	public void setShownum(Integer shownum) {
		this.shownum = shownum;
	}

}
