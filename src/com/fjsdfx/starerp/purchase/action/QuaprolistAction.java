package com.fjsdfx.starerp.purchase.action;

import com.fjsdfx.starerp.security.model.User;
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
import org.springframework.security.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;

import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.item.model.Item;
import com.fjsdfx.starerp.item.model.ItemRelation;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.purchase.model.Quaprolist;
import com.fjsdfx.starerp.purchase.model.Supplierinfo;
import com.fjsdfx.starerp.purchase.service.QuaprolistService;
import com.fjsdfx.starerp.purchase.service.SupplierinfoService;
import com.fjsdfx.starerp.security.model.User;

/**
 * @author Lu_Zhongchao
 *
 */
@Controller
@Scope("prototype")
public class QuaprolistAction {
	private Logger logger=LoggerFactory.getLogger(QuaprolistAction.class);
	private Quaprolist quaprolist;
	private QuaprolistService  quaprolistService;
	private SupplierinfoService  supplierinfoService;
	private User auditUser;
	private int day;
	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}
	private Supplierinfo supplierinfo;
	
	private Integer quaprolistId;
	private Integer supplierinfoId;

	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	public Quaprolist getQuaprolist() {
		return quaprolist;
	}

	public void setQuaprolist(Quaprolist quaprolist) {
		this.quaprolist = quaprolist;
	}

	public User getAuditUser() {
		return auditUser;
	}

	public void setAuditUser(User auditUser) {
		this.auditUser = auditUser;
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
	
	public Supplierinfo getSupplierinfo() {
		return supplierinfo;
	}

	public void setSupplierinfo(Supplierinfo supplierinfo) {
		this.supplierinfo = supplierinfo;
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
		pm=quaprolistService.getPagerDesc(Quaprolist.class);
		return "list";
	}
	
	public String show()
	{
		supplierinfo=supplierinfoService.findById(Supplierinfo.class, supplierinfoId);
		return "show";
	}
	
	public String search()
	{
		Map<String,String> like=new HashMap<String,String>();
		like.put("supplierinfo.supcname", quaprolist.getSupplierinfo().getSupcname());
		pm=quaprolistService.fuzzyQuery(Quaprolist.class, like);
		return "list";
	}
	public String selectSearch()
	{
		
		Map<String,String> like=new HashMap<String,String>();
		like.put("supplierinfo.supcname", quaprolist.getSupplierinfo().getSupcname());
		pm=quaprolistService.fuzzyQuery(Quaprolist.class,like);
		return "select_input";
	}
	public String add() throws ParseException
	{
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		Date date=new Date();
		java.sql.Date dates=new java.sql.Date(date.getTime());
		quaprolist.setTime(dates);
		quaprolistService.saveAndRefresh(quaprolist);
		logger.warn(auditUser.getId()+"add id="+quaprolist.getId());
		return "pub_add_success";
	}
	
	public String del()
	{
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		quaprolistService.deleteById(Quaprolist.class, quaprolistId);
		logger.warn(auditUser.getId()+"del id="+quaprolistId);
		return "pub_del_success";
	}
	
	public String editInput()
	{
		
		quaprolist=quaprolistService.findById(Quaprolist.class, quaprolistId);
		Date nowDate=new Date();
		Date createDate=quaprolist.getTime();
		if(createDate!=null){
			 day=(int)((nowDate.getTime()-createDate.getTime())/ 3600 / 24 / 1000);
		}else
		{
			day=0;
		}
	 
		return "edit_input";
	}
	
	public String update()
	{
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		//获取 类型
		if(null!=supplierinfoId)
		{
			Supplierinfo supplierinfo=supplierinfoService.findById(Supplierinfo.class, supplierinfoId);
			quaprolist.setSupplierinfo(supplierinfo);
		}
		
		quaprolistService.update(quaprolist);
		
		logger.warn(auditUser.getId()+"update id="+quaprolist.getId());
		return "pub_update_success";
	}
	public String selectInput()
	{
		pm=quaprolistService.getPager(Quaprolist.class);
		return "select_input";
	}
	

}
