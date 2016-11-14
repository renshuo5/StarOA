package com.fjsdfx.starerp.purchase.action;

import com.fjsdfx.starerp.security.model.User;
import org.springframework.security.context.SecurityContextHolder;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.item.model.Item;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ItemTypeService;
import com.fjsdfx.starerp.produce.model.Shogood;
import com.fjsdfx.starerp.produce.service.ShogoodService;
import com.fjsdfx.starerp.purchase.service.PurorderService;
import com.fjsdfx.starerp.purchase.service.PurgoodService;
import com.fjsdfx.starerp.purchase.service.QuaprolistService;
import com.fjsdfx.starerp.purchase.model.Quaprolist;
import com.fjsdfx.starerp.purchase.model.Requisitions;
import com.fjsdfx.starerp.purchase.model.Purgood;
import com.fjsdfx.starerp.purchase.model.Supplierinfo;
import com.fjsdfx.starerp.purchase.model.Purorder;

/**
 * @author Lu_Zhongchao
 *
 */
@Controller
@Scope("prototype")
public class PurorderAction {
	
	private Logger logger=LoggerFactory.getLogger(PurorderAction.class);
	private Purorder purorder;
	private PurorderService purorderService;
	private List<Purgood> purgoods=new ArrayList<Purgood>();
	private PurgoodService purgoodService;
	private Integer purorderId;
	private Integer quaprolistId;
	private Integer step;
	private Integer records;
	private QuaprolistService quaprolistService;
	private User auditUser;
	/**
	 * 取出缺料数据
	 */
	
	private ShogoodService shogoodService;
	private Integer shortmId;
	
	private List<Integer> nums;
	private List<Float> uprices;
	private List<String> units;
	private List<Date> delydates;
	private List<String> notes;
	
	private List<Integer> itemtypeids;
	private ItemTypeService itemtypeService;
	
	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	public Integer getRecords() {
		return records;
	}

	public void setRecords(Integer records) {
		this.records = records;
	}

	public Integer getStep() {
		return step;
	}

	public void setStep(Integer step) {
		this.step = step;
	}

	public User getAuditUser() {
		return auditUser;
	}

	public void setAuditUser(User auditUser) {
		this.auditUser = auditUser;
	}

	public Purorder getPurorder() {
		return purorder;
	}

	public void setPurorder(Purorder purorder) {
		this.purorder = purorder;
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

	public PurgoodService getPurgoodService() {
		return purgoodService;
	}
	
	@Resource
	public void setPurgoodService(PurgoodService purgoodService) {
		this.purgoodService = purgoodService;
	}
	

	public Integer getPurorderId() {
		return purorderId;
	}

	public void setPurorderId(Integer purorderId) {
		this.purorderId = purorderId;
	}

	public Integer getQuaprolistId() {
		return quaprolistId;
	}

	public void setQuaprolistId(Integer quaprolistId) {
		this.quaprolistId = quaprolistId;
	}
	
	
	public QuaprolistService getQuaprolistService() {
		return quaprolistService;
	}
	
	@Resource
	public void setQuaprolistService(QuaprolistService quaprolistService) {
		this.quaprolistService = quaprolistService;
	}

	public ShogoodService getShogoodService() {
		return shogoodService;
	}
	
	@Resource
	public void setShogoodService(ShogoodService shogoodService) {
		this.shogoodService = shogoodService;
	}

	public Integer getShortmId() {
		return shortmId;
	}

	public void setShortmId(Integer shortmId) {
		this.shortmId = shortmId;
	}

	public List<Integer> getNums() {
		return nums;
	}

	public void setNums(List<Integer> nums) {
		this.nums = nums;
	}

	public List<Float> getUprices() {
		return uprices;
	}

	public void setUprices(List<Float> uprices) {
		this.uprices = uprices;
	}

	public List<String> getUnits() {
		return units;
	}

	public void setUnits(List<String> units) {
		this.units = units;
	}

	public List<Date> getDelydates() {
		return delydates;
	}

	public void setDelydates(List<Date> delydates) {
		this.delydates = delydates;
	}

	public List<String> getNotes() {
		return notes;
	}

	public void setNotes(List<String> notes) {
		this.notes = notes;
	}

	public List<Integer> getItemtypeids() {
		return itemtypeids;
	}

	public void setItemtypeids(List<Integer> itemtypeids) {
		this.itemtypeids = itemtypeids;
	}

	public ItemTypeService getItemtypeService() {
		return itemtypeService;
	}
	
	@Resource
	public void setItemtypeService(ItemTypeService itemtypeService) {
		this.itemtypeService = itemtypeService;
	}


	/**
	 * 分页的pagermodel
	 */
	private PagerModel pm;
	public PagerModel getPm() {
		return pm;
	}

	public void setPm(PagerModel pm) {
		this.pm = pm;
	}
	
	/*==============各种Action===========================================*/
	public String add() throws ParseException
	{
		Integer total=itemtypeids.size();
		for(Integer i=0;i<total;i++)
		{
			if(nums.get(i)==null||delydates.get(i)==null){
				quaprolistId=null;
			}
		}
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;

		if(null!=quaprolistId&&null!=purorder.getPno()&&null!=purorder.getPurdate()&&null!=purorder.getHanding().getEmpId())
		{
		Quaprolist quaprolist=quaprolistService.findById(Quaprolist.class,quaprolistId);
		purorder.setQuaprolist(quaprolist);
		purorderService.saveAndRefresh(purorder);
			List<ItemType> itemtypes=itemtypeService.getItemTypesByIds(itemtypeids);
			purgoodService.savePurgoods(purorder, itemtypes, units, nums, uprices, delydates, notes);
			logger.warn(auditUser.getId()+"add id="+purorder.getId());
			return "pub_add_success";
		}
		
		return "pub_exception";
	}
	
	public String update()
	{
		Integer total=itemtypeids.size();
		for(Integer i=0;i<total;i++)
		{
			if(nums.get(i)==null||delydates.get(i)==null){
				quaprolistId=null;
			}
		}
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;

		if(null!=quaprolistId&&null!=purorder.getPno()&&null!=purorder.getPurdate()&&null!=purorder.getHanding().getEmpId())
		{
		Quaprolist quaprolist=quaprolistService.findById(Quaprolist.class,quaprolistId);
		purorder.setQuaprolist(quaprolist);
		purorderService.update(purorder);
			List<ItemType> itemtypes=itemtypeService.getItemTypesByIds(itemtypeids);
			purgoodService.update(purorder, itemtypes, units, nums, uprices, delydates, notes);
			logger.warn(auditUser.getId()+"update id="+purorder.getId());
			return "pub_update_success";
		}
		
		return "pub_exception";
	}
	
	public String del()
	{
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		purorderService.deleteById(Purorder.class, purorderId);
		logger.warn(auditUser.getId()+"del id="+quaprolistId);
		return "pub_del_success";
	}
	
	public String list()
	{
		pm=purorderService.getPagerDesc(Purorder.class);
		purgoods=purgoodService.findByHql("from Purgood");
		return "list";
	}
	
	/*==============Input页面===========================================*/
	public String addInput()
	{
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		pm=shogoodService.getPagerDesc(Shogood.class,"where o.shortm.id="+shortmId);
		records=pm.getTotal();
		return "add_input";
	}
	
	public String search()
	{
		Map<String,String> like=new HashMap<String,String>();
		like.put("quaprolist.supplierinfo.supcname", purorder.getQuaprolist().getSupplierinfo().getSupcname());
		like.put("firm", purorder.getFirm());
		pm=purorderService.fuzzyQuery(Purorder.class, like);
		purgoods=purgoodService.findByHql("from Purgood");
		return "list";
	}
	
	public String editInput()
	{
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		purorder=purorderService.findById(Purorder.class, purorderId);
		pm=purgoodService.getPagerDesc(Purgood.class,"where o.purorder.id="+purorderId);
		records=pm.getTotal();
		return "edit_input";
	}
	
	public String show()
	{
		purorder=purorderService.findById(Purorder.class, purorderId);
		purgoods=purgoodService.findPurgoodsByPurorderid(purorderId);
		return "show";
	}
	public String examine()
	{
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		purorder=purorderService.findById(Purorder.class, purorderId);
		pm=purgoodService.getPagerDesc(Purgood.class,"where o.purorder.id="+purorderId);
		return "examine_input";
	}
	public String enter()
	{
		purorder=purorderService.findById(Purorder.class, purorderId);
		purgoods=purgoodService.findPurgoodsByPurorderid(purorderId);
		return "enter";
	}
}
