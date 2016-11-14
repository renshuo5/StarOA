package com.fjsdfx.starerp.purchase.action;

import com.fjsdfx.starerp.security.model.User;
import org.springframework.security.context.SecurityContextHolder;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import com.fjsdfx.starerp.produce.model.Shortm;
import com.fjsdfx.starerp.produce.service.ShogoodService;
import com.fjsdfx.starerp.produce.service.ShortmService;
import com.fjsdfx.starerp.purchase.service.QuaprolistService;
import com.fjsdfx.starerp.purchase.service.RequisitionsService;
import com.fjsdfx.starerp.purchase.service.ResgoodService;
import com.fjsdfx.starerp.purchase.model.Quaprolist;
import com.fjsdfx.starerp.purchase.model.Requisitions;
import com.fjsdfx.starerp.purchase.model.Resgood;
import com.fjsdfx.starerp.purchase.model.Supplierinfo;

/**
 * @author Lu_Zhongchao
 *
 */
@Controller
@Scope("prototype")
public class RequisitionsAction {
	
	private Logger logger=LoggerFactory.getLogger(RequisitionsAction.class);
	private Requisitions requisitions;
	private RequisitionsService requisitionsService;
	private List<Integer> itemtypeids;
	private ItemTypeService itemtypeService;
	private ResgoodService resgoodService;
	private Integer requisitionsId;
	private Integer quaprolistId;
	private Integer records;
	private Integer step;
	private QuaprolistService quaprolistService;
	private User auditUser;
	/**
	 * 取出缺料数据
	 */
	
	private ShogoodService shogoodService;
	private Integer shortmId;
	
	private List<Integer> unums;
	private List<Float> uprices;
	private List<Integer> reqnums;
	private List<Date> arrivaldates;
	private List<String> payments;
	
	
	private List<Resgood> resgoods;
	public List<Resgood> getResgoods() {
		return resgoods;
	}

	public void setResgoods(List<Resgood> resgoods) {
		this.resgoods = resgoods;
	}

	public Integer getStep() {
		return step;
	}

	public Integer getRecords() {
		return records;
	}

	public void setRecords(Integer records) {
		this.records = records;
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

	/**
	 * 记录采购总数与总价
	 */
	List<Integer> counts;
	List<Float> sums;
	
	public List<Float> getSums() {
		return sums;
	}

	public void setSums(List<Float> sums) {
		this.sums = sums;
	}

	public List<Integer> getCounts() {
		return counts;
	}

	public void setCounts(List<Integer> counts) {
		this.counts = counts;
	}

	public Requisitions getRequisitions() {
		return requisitions;
	}

	public void setRequisitions(Requisitions requisitions) {
		this.requisitions = requisitions;
	}

	public RequisitionsService getRequisitionsService() {
		return requisitionsService;
	}
	@Resource
	public void setRequisitionsService(RequisitionsService requisitionsService) {
		this.requisitionsService = requisitionsService;
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

	public ResgoodService getResgoodService() {
		return resgoodService;
	}
	@Resource
	public void setResgoodService(ResgoodService resgoodService) {
		this.resgoodService = resgoodService;
	}

	public List<Integer> getUnums() {
		return unums;
	}

	public void setUnums(List<Integer> unums) {
		this.unums = unums;
	}

	public List<Float> getUprices() {
		return uprices;
	}

	public void setUprices(List<Float> uprices) {
		this.uprices = uprices;
	}

	public List<Integer> getReqnums() {
		return reqnums;
	}

	public void setReqnums(List<Integer> reqnums) {
		this.reqnums = reqnums;
	}

	public List<Date> getArrivaldates() {
		return arrivaldates;
	}

	public void setArrivaldates(List<Date> arrivaldates) {
		this.arrivaldates = arrivaldates;
	}

	public List<String> getPayments() {
		return payments;
	}

	public void setPayments(List<String> payments) {
		this.payments = payments;
	}

	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}
	
	public Integer getRequisitionsId() {
		return requisitionsId;
	}

	public void setRequisitionsId(Integer requisitionsId) {
		this.requisitionsId = requisitionsId;
	}

	public Integer getShortmId() {
		return shortmId;
	}

	public void setShortmId(Integer shortmId) {
		this.shortmId = shortmId;
	}

	public ShogoodService getShogoodService() {
		return shogoodService;
	}
	
	@Resource
	public void setShogoodService(ShogoodService shogoodService) {
		this.shogoodService = shogoodService;
	}

	public QuaprolistService getQuaprolistService() {
		return quaprolistService;
	}
	
	@Resource
	public void setQuaprolistService(QuaprolistService quaprolistService) {
		this.quaprolistService = quaprolistService;
	}

	public Integer getQuaprolistId() {
		return quaprolistId;
	}

	public void setQuaprolistId(Integer quaprolistId) {
		this.quaprolistId = quaprolistId;
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
	public String list()
	{
		pm=requisitionsService.getPagerDesc(Requisitions.class);
		resgoods=resgoodService.findByHql("from Resgood");
		return "list";
	}
	
	public String search()
	{
		Map<String,String> like=new HashMap<String,String>();
		like.put("quaprolist.supplierinfo.supcname", requisitions.getQuaprolist().getSupplierinfo().getSupcname());
		pm=requisitionsService.fuzzyQuery(Requisitions.class, like);
		resgoods=resgoodService.findByHql("from Resgood");
		return "list";
	}
	
	public String add() throws ParseException
	{
		Integer total=itemtypeids.size();
		for(Integer i=0;i<total;i++)
		{
			if(unums.get(i)==null||reqnums.get(i)==null||arrivaldates.get(i)==null){
				quaprolistId=null;
			}
		}
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		if(null!=quaprolistId&&null!=requisitions.getBuyer().getEmpId())
		{
			Quaprolist quaprolist=quaprolistService.findById(Quaprolist.class,quaprolistId);
			requisitions.setQuaprolist(quaprolist);
			requisitionsService.saveAndRefresh(requisitions);
				List<ItemType> itemtypes=itemtypeService.getItemTypesByIds(itemtypeids);
				resgoodService.saveResgoods(requisitions,itemtypes,unums,uprices,reqnums,arrivaldates,payments);
				logger.warn(auditUser.getId()+"add id="+requisitions.getId());
				return "pub_add_success";
		}
		
		return "pub_exception";
	}
	
	public String del()
	{
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		requisitionsService.deleteById(Requisitions.class, requisitionsId);
		logger.warn(auditUser.getId()+"del id="+requisitionsId);
		return "pub_del_success";
	}
	
	public String update()
	{
		Integer total=itemtypeids.size();
		for(Integer i=0;i<total;i++)
		{
			if(unums.get(i)==null||reqnums.get(i)==null||arrivaldates.get(i)==null){
				quaprolistId=null;
			}
		}
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		if(null!=quaprolistId&&null!=requisitions.getBuyer().getEmpId())
		{
		Quaprolist quaprolist=quaprolistService.findById(Quaprolist.class,quaprolistId);
		requisitions.setQuaprolist(quaprolist);
		requisitionsService.update(requisitions);
		System.out.println("++"+requisitions.getQuaprolist().getId()+"++"+unums.get(0)+"++"+uprices.get(0)+"++"+reqnums.get(0)+"++"+arrivaldates.get(0)+"++"+payments.get(0));
			List<ItemType> itemtypes=itemtypeService.getItemTypesByIds(itemtypeids);
			resgoodService.update(requisitions, itemtypes, unums, uprices, reqnums, arrivaldates, payments);
			logger.warn(auditUser.getId()+"update id="+requisitions.getId());
			return "pub_update_success";
		}
		
		return "pub_exception";
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
	
	public String editInput()
	{
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		requisitions=requisitionsService.findById(Requisitions.class, requisitionsId);
		resgoods=resgoodService.findResgoodsByRequisitionsid(requisitionsId);
		records=resgoods.size();
		return "edit_input";
	}
	
	public String show()
	{
		requisitions=requisitionsService.findById(Requisitions.class, requisitionsId);
		resgoods=resgoodService.findResgoodsByRequisitionsid(requisitionsId);
		return "show";
	}
	public String examine()
	{
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		requisitions=requisitionsService.findById(Requisitions.class, requisitionsId);
		resgoods=resgoodService.findResgoodsByRequisitionsid(requisitionsId);
		return "examine_input";
	}
	public String enter()
	{
		requisitions=requisitionsService.findById(Requisitions.class, requisitionsId);
		resgoods=resgoodService.findResgoodsByRequisitionsid(requisitionsId);
		return "enter";
	}

}
