package com.fjsdfx.starerp.sales.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.jws.soap.SOAPBinding.Use;

import com.fjsdfx.starerp.security.model.User;
import org.springframework.security.context.SecurityContextHolder;
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
import com.fjsdfx.starerp.persons.service.DepartmentService;
import com.fjsdfx.starerp.sales.service.RetgoodService;
import com.fjsdfx.starerp.sales.service.ReturnedService;
import com.fjsdfx.starerp.sales.service.UnqmessageService;
import com.fjsdfx.starerp.sales.service.UnqualifiedService;
import com.fjsdfx.starerp.sales.model.Retgood;
import com.fjsdfx.starerp.sales.model.Returned;
import com.fjsdfx.starerp.sales.model.Shi1good;
import com.fjsdfx.starerp.sales.model.Shi2good;
import com.fjsdfx.starerp.sales.model.Shinote2;
import com.fjsdfx.starerp.sales.model.Shippingnote1;
import com.fjsdfx.starerp.sales.model.Unqmessage;
import com.fjsdfx.starerp.sales.model.Unqualified;

import freemarker.core.ReturnInstruction.Return;

/**
 * @author Chen_Shaojian
 * 
 */
@Controller
@Scope("prototype")
public class ReturnedAction {

	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
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

	private Logger logger = LoggerFactory.getLogger(ReturnedAction.class);

	public ReturnedService getReturnedService() {
		return returnedService;
	}

	@Resource
	public void setReturnedService(ReturnedService returnedService) {
		this.returnedService = returnedService;
	}

	public Returned getReturned() {
		return returned;
	}

	public void setReturned(Returned returned) {
		this.returned = returned;
	}

	public Retgood getRetgood() {
		return retgood;
	}

	public void setRetgood(Retgood retgood) {
		this.retgood = retgood;
	}

	public RetgoodService getRetgoodService() {
		return retgoodService;
	}

	@Resource
	public void setRetgoodService(RetgoodService retgoodService) {
		this.retgoodService = retgoodService;
	}

	public Integer getReturnedId() {
		return returnedId;
	}

	public void setReturnedId(Integer returnedId) {
		this.returnedId = returnedId;
	}

	public Integer getRetgoodId() {
		return retgoodId;
	}

	public void setRetgoodId(Integer retgoodId) {
		this.retgoodId = retgoodId;
	}

	public List<Retgood> getRetgoods() {
		return retgoods;
	}

	public void setRetgoods(List<Retgood> retgoods) {
		this.retgoods = retgoods;
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

	public User getSignatory() {
		return signatory;
	}

	public void setSignatory(User signatory) {
		this.signatory = signatory;
	}

	public User getQualitymanager() {
		return qualitymanager;
	}

	public void setQualitymanager(User qualitymanager) {
		this.qualitymanager = qualitymanager;
	}

	private ReturnedService returnedService;

	private Returned returned;

	private PagerModel pm;

	private Integer sn;

	private Retgood retgood;

	private RetgoodService retgoodService;

	private Integer returnedId;

	private Integer retgoodId;

	List<Retgood> retgoods;

	private ItemTypeService itemtypeService;

	private Integer itemTypeId;

	private User signatory;

	private User qualitymanager;

	private List<Integer> retnos;

	private List<Integer> itemTypeIds;

	private List<Unqmessage> unqmessages;

	private UnqmessageService unqmessageService;

	private Integer unqualifiedId;

	private UnqualifiedService unqualifiedService;

	private List<Unqualified> unqualifieds;

	private List<Returned> returneds;

	private DepartmentService departmentService;

	private String whreceive;

	private Date whradate;

	private String qualityadvice;

	private Date qualitydate;

	private String qualitynote;

	private User signper;

	private Unqualified unqualified;

	private User currentUser = (User) SecurityContextHolder.getContext()
			.getAuthentication().getPrincipal();

	public User getCurrentUser() {
		return currentUser;
	}

	public void setCurrentUser(User currentUser) {
		this.currentUser = currentUser;
	}

	public Unqualified getUnqualified() {
		return unqualified;
	}

	public void setUnqualified(Unqualified unqualified) {
		this.unqualified = unqualified;
	}

	public User getSignper() {
		return signper;
	}

	public void setSignper(User signper) {
		this.signper = signper;
	}

	public Date getWhradate() {
		return whradate;
	}

	public void setWhradate(Date whradate) {
		this.whradate = whradate;
	}

	public String getQualityadvice() {
		return qualityadvice;
	}

	public void setQualityadvice(String qualityadvice) {
		this.qualityadvice = qualityadvice;
	}

	public Date getQualitydate() {
		return qualitydate;
	}

	public void setQualitydate(Date qualitydate) {
		this.qualitydate = qualitydate;
	}

	public String getQualitynote() {
		return qualitynote;
	}

	public void setQualitynote(String qualitynote) {
		this.qualitynote = qualitynote;
	}

	public String getWhreceive() {
		return whreceive;
	}

	public void setWhreceive(String whreceive) {
		this.whreceive = whreceive;
	}

	public DepartmentService getDepartmentService() {
		return departmentService;
	}

	@Resource
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}

	public List<Returned> getReturneds() {
		return returneds;
	}

	public void setReturneds(List<Returned> returneds) {
		this.returneds = returneds;
	}

	public List<Unqualified> getUnqualifieds() {
		return unqualifieds;
	}

	public void setUnqualifieds(List<Unqualified> unqualifieds) {
		this.unqualifieds = unqualifieds;
	}

	public UnqualifiedService getUnqualifiedService() {
		return unqualifiedService;
	}

	@Resource
	public void setUnqualifiedService(UnqualifiedService unqualifiedService) {
		this.unqualifiedService = unqualifiedService;
	}

	public Integer getUnqualifiedId() {
		return unqualifiedId;
	}

	public void setUnqualifiedId(Integer unqualifiedId) {
		this.unqualifiedId = unqualifiedId;
	}

	public List<Unqmessage> getUnqmessages() {
		return unqmessages;
	}

	public void setUnqmessages(List<Unqmessage> unqmessages) {
		this.unqmessages = unqmessages;
	}

	public UnqmessageService getUnqmessageService() {
		return unqmessageService;
	}

	@Resource
	public void setUnqmessageService(UnqmessageService unqmessageService) {
		this.unqmessageService = unqmessageService;
	}

	public List<Integer> getRetnos() {
		return retnos;
	}

	public void setRetnos(List<Integer> retnos) {
		this.retnos = retnos;
	}

	public List<Integer> getItemTypeIds() {
		return itemTypeIds;
	}

	public void setItemTypeIds(List<Integer> itemTypeIds) {
		this.itemTypeIds = itemTypeIds;
	}

	/**
	 * 列表
	 * 
	 * @return
	 * @throws Exception
	 */
	public String list() {
		// TODO Auto-generated method stub
		pm = returnedService.getPagerDesc(Returned.class);
		returneds = returnedService.findByHql("from Returned");
		unqualifieds = unqualifiedService.findByHql("from Unqualified");
		return "list";
	}

	/**
	 * 查询
	 */
	public String search() {
		// pm=resourceService.findByExample(Resource.class, resource);

		Map<String, String> like = new HashMap<String, String>();
		like.put("customern", returned.getCustomern());

		pm = returnedService.fuzzyQuery(Returned.class, like);
		return "examine_list";
	}

	/**
	 * 转到审核列表
	 * 
	 * @return
	 * @throws Exception
	 */
	public String examineList() {

		pm = returnedService.getPager(Returned.class);
		returneds = returnedService.findByHql("from Returned");
		retgoods = retgoodService.findByHql("from Retgood");
		return "examine_list";
	}

	/**
	 * 转到质量审核列表
	 * 
	 * @return
	 * @throws Exception
	 */
	public String qualityList() {
		// TODO Auto-generated method stub

		pm = returnedService.getPagerDesc(Returned.class);

		unqualifieds = unqualifiedService.findByHql("from Unqualified");
		return "quality_list";
	}

	/**
	 * 转到添加列表
	 * 
	 * @return
	 * @throws Exception
	 */
	public String addInput() {
		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		signper = currentUser;
		return "add_input";
	}

	/**
	 * 添加方法
	 * 
	 * @return
	 * @throws ParseException
	 */
	public String add() throws ParseException {
		if (itemTypeIds != null) {
			retgoodService.saveretgoods(returned, itemTypeIds, retnos);
		}
		logger.warn("add returned id" + returned.getRetid() + "user Id ="
				+ currentUser.getId());
		return "return_examinelist";

	}

	/**
	 * 跳到编辑页面
	 * 
	 * @return
	 */
	public String examineInput() {
		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		String sstring;
		signatory = currentUser;
		/*
		 * Integer flag = departmentService.findById(Department.class,
		 * 2).getId();
		 * if(signatory.getEmployee().getDepartment().getId().intValue
		 * ()==flag.intValue()){
		 * 
		 * sstring = "examine_input"; } else{ sstring = "pub_exception"; }
		 */
		System.out.print("-----1111111------"
				+ signatory.getEmployee().getDepartment().getDptType()
						.intValue());
		// System.out.print("-----2222222------"+flag.intValue());

		returned = returnedService.findById(Returned.class, returnedId);
		retgoods = retgoodService
				.findByHql("from Retgood rg where rg.returned.retid = "
						+ returnedId);
		return "examine_input";
	}

	/**
	 * 跳到编辑页面
	 * 
	 * @return
	 */
	public String editInput() {

		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		signper = currentUser;
		returned = returnedService.findById(Returned.class, returnedId);
		retgoods = retgoodService
				.findByHql("from Retgood rg where rg.returned.retid = "
						+ returnedId);
		System.out.print("--------fdsfafdsaf-------" + retgoods);
		return "edit_input";

	}

	/**
	 * 跳到质量审核页面
	 * 
	 * @return
	 */
	public String qualityInput() {

		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		String sstring;
		qualitymanager = currentUser;
		/*
		 * Integer flag = departmentService.findById(Department.class,
		 * 1).getId();
		 * if(qualitymanager.getEmployee().getDepartment().getId().intValue
		 * ()==flag.intValue()){ sstring = "quality_input"; } else{ sstring =
		 * "pub_exception"; }
		 */
		returned = returnedService.findById(Returned.class, returnedId);
		retgoods = retgoodService
				.findByHql("from Retgood rg where rg.returned.retid = "
						+ returnedId);

		return "quality_input";
	}

	/**
	 * 显示
	 * 
	 * @return
	 */
	public String show() {

		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		signper = currentUser;
		returned = returnedService.findById(Returned.class, returnedId);

		retgoods = retgoodService
				.findByHql("from Retgood s1g where s1g.returned.retid ="
						+ returnedId);

		return "show";
	}

	/**
	 * 仓库审核方法
	 * 
	 */

	public String examine() {
		returned = returnedService.findById(Returned.class, returnedId);
		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		signatory = currentUser;
		if (signatory != null) {
			returned.setSignatory(signatory.getEmployee());
			returned.setWhreceive(whreceive);
			returned.setWhradate(whradate);

		}
		returnedService.saveOrUpdate(returned);
		// 此处还应加入对审核人的验证，记录审核人ID
		logger.warn("examine id=" + returned.getRetid());
		return "return_qaualitylist";
	}

	/**
	 * 修改方法
	 * 
	 * @return
	 */

	public String update() {
		returnedService.update(returned);
		retgoodService.updateretgoods(returned, itemTypeIds, retnos);
		logger.warn("update returned id" + returned.getRetid() + "user Id ="
				+ currentUser.getId());
		return "pub_update_success";
	}

	/**
	 * 删除方法
	 */
	public String del() {
		retgoodService.delall(returnedId);
		logger.warn("del returned id" + returnedId + "user Id ="
				+ currentUser.getId());
		return "pub_del_success";
	}

	/**
	 * 质量检验方法
	 * 
	 */
	private String deal;

	public String getDeal() {
		return deal;
	}

	public void setDeal(String deal) {
		this.deal = deal;
	}

	private String buhege;

	public String getBuhege() {
		return buhege;
	}

	public void setBuhege(String buhege) {
		this.buhege = buhege;
	}

	public String qualityexamine() {
		returned = returnedService.findById(Returned.class, returnedId);
		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		qualitymanager = currentUser;
		if (qualitymanager != null) {
			returned.setQualitymanager(qualitymanager.getEmployee());

			returned.setQualitydate(qualitydate);
			returned.setQualitynote(qualitynote);
			returned.setQualityadvice(qualityadvice);
			returned.setDeals(deal);
			returned.setBuhege(buhege);
		}
		returnedService.saveOrUpdate(returned);
		logger.warn("examine id=" + returned.getRetid());

		return "return_qaualitylist";
	}

}
