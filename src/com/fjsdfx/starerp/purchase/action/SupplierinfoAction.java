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

import com.fjsdfx.starerp.annoucement.model.Annoucement;
import com.fjsdfx.starerp.annoucement.service.AnnoucementService;
import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.item.model.Item;
import com.fjsdfx.starerp.item.model.ItemRelation;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ItemService;
import com.fjsdfx.starerp.purchase.model.Supplierinfo;
import com.fjsdfx.starerp.purchase.service.SupplierinfoService;


/**
 * @author Lu_Zhongchao
 *
 */
@Controller
@Scope("prototype")
public class SupplierinfoAction {

	private Logger logger=LoggerFactory.getLogger(SupplierinfoAction.class);
	private Supplierinfo supplierinfo;
	private SupplierinfoService  supplierinfoService;
	private Integer supplierinfoId;
	
	private List<String> outputs;
	private List<String> qsituations;
	private List<String> musers;
	private List<String> availabilitys;
	private List<String> supcycles;
	private User auditUser;

	public Logger getLogger() {
		return logger;
	}
	public void setLogger(Logger logger) {
		this.logger = logger;
	}
	public User getAuditUser() {
		return auditUser;
	}
	public void setAuditUser(User auditUser) {
		this.auditUser = auditUser;
	}
	public Supplierinfo getSupplierinfo() {
		return supplierinfo;
	}
	public void setSupplierinfo(Supplierinfo supplierinfo) {
		this.supplierinfo = supplierinfo;
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
	public List<String> getOutputs() {
		return outputs;
	}
	public void setOutputs(List<String> outputs) {
		this.outputs = outputs;
	}
	public List<String> getQsituations() {
		return qsituations;
	}
	public void setQsituations(List<String> qsituations) {
		this.qsituations = qsituations;
	}
	public List<String> getMusers() {
		return musers;
	}
	public void setMusers(List<String> musers) {
		this.musers = musers;
	}
	public List<String> getAvailabilitys() {
		return availabilitys;
	}
	public void setAvailabilitys(List<String> availabilitys) {
		this.availabilitys = availabilitys;
	}
	public List<String> getSupcycles() {
		return supcycles;
	}
	public void setSupcycles(List<String> supcycles) {
		this.supcycles = supcycles;
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
		pm=supplierinfoService.getPagerDesc(Supplierinfo.class);
		return "list";
	}
	
	public String add() throws ParseException
	{
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		if(null!=supplierinfo.getSupcname()&&null!=supplierinfo.getPhone()&&null!=supplierinfo.getAddress()&&null!=supplierinfo.getBusiness()
				&&null!=supplierinfo.getItemname()&&null!=supplierinfo.getItemtypename()&&null!=supplierinfo.getWper()
				&&null!=supplierinfo.getQuality()&&null!=supplierinfo.getOutput()&&null!=supplierinfo.getQsituation()
				&&null!=supplierinfo.getMuser()&&null!=supplierinfo.getAvailability()&&null!=supplierinfo.getSupcycle()
				&&null!=supplierinfo.getWdate())
		{
			supplierinfoService.saveAndRefresh(supplierinfo);
			logger.warn(auditUser.getId()+"add id="+supplierinfo.getId());

			return "pub_add_success";
		}
		return "pub_exception";
	}
	
	public String search()
	{
		Map<String,String> like=new HashMap<String,String>();
		like.put("supcname", supplierinfo.getSupcname());
		pm=supplierinfoService.fuzzyQuery(Supplierinfo.class, like);
		return "list";
	}
	
	public String selectSearch()
	{
		
		Map<String,String> like=new HashMap<String,String>();
		like.put("supcname", supplierinfo.getSupcname());
		pm=supplierinfoService.fuzzyQuery(Supplierinfo.class,like);
		return "select_input";
	}
	
	public String del()
	{
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		//supplierinfo.setQuaprolist(null);
		supplierinfoService.deleteById(Supplierinfo.class, supplierinfoId);
		logger.warn(auditUser.getId()+"del id="+supplierinfoId);
		return "pub_del_success";
	}
	
	public String show()
	{
		supplierinfo=supplierinfoService.findById(Supplierinfo.class, supplierinfoId);
		return "show";
	}
	
	public String selectInput()
	{
		pm=supplierinfoService.getPager(Supplierinfo.class);
		return "select_input";
	}
	
	public String update()
	{
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		//获取 类型

		if(null!=supplierinfo.getSupcname()&&null!=supplierinfo.getPhone()&&null!=supplierinfo.getAddress()&&null!=supplierinfo.getBusiness()
				&&null!=supplierinfo.getItemname()&&null!=supplierinfo.getItemtypename()&&null!=supplierinfo.getWper()
				&&null!=supplierinfo.getQuality()&&null!=supplierinfo.getOutput()&&null!=supplierinfo.getQsituation()
				&&null!=supplierinfo.getMuser()&&null!=supplierinfo.getAvailability()&&null!=supplierinfo.getSupcycle()
				&&null!=supplierinfo.getWdate())
		{
		supplierinfoService.update(supplierinfo);
		logger.warn(auditUser.getId()+"update id="+supplierinfo.getId());
		return "pub_update_success";
		}
		return "pub_exception";
	}
	
	/*==============Input页面===========================================*/
	public String addInput()
	{
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		return "add_input";
	}
	public String editInput()
	{
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		supplierinfo=supplierinfoService.findById(Supplierinfo.class, supplierinfoId);
		return "edit_input";
	}
	
	public String examine()
	{
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		supplierinfo=supplierinfoService.findById(Supplierinfo.class, supplierinfoId);
		return "examine_input";
	}
	
}
