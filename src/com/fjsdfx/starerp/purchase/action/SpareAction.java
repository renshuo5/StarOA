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
import org.springframework.security.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;

import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.purchase.model.Quaprolist;
import com.fjsdfx.starerp.purchase.model.Spare;
import com.fjsdfx.starerp.purchase.model.Supplierinfo;
import com.fjsdfx.starerp.purchase.service.QuaprolistService;
import com.fjsdfx.starerp.purchase.service.SpareService;
import com.fjsdfx.starerp.security.model.User;

/**
 * @author Lu_Zhongchao
 *
 */
@Controller
@Scope("prototype")
public class SpareAction {
	
	private Logger logger=LoggerFactory.getLogger(SamidentifiedAction.class);
	private Spare spare;
	private SpareService spareService;
	private Quaprolist quaprolist;
	private QuaprolistService quaprolistService;
	private Integer spareId;
	private Integer quaprolistId;
	private User auditUser;
	
	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	public Spare getSpare() {
		return spare;
	}

	public User getAuditUser() {
		return auditUser;
	}

	public void setAuditUser(User auditUser) {
		this.auditUser = auditUser;
	}

	public void setSpare(Spare spare) {
		this.spare = spare;
	}

	public SpareService getSpareService() {
		return spareService;
	}

	@Resource
	public void setSpareService(SpareService spareService) {
		this.spareService = spareService;
	}

	public Quaprolist getQuaprolist() {
		return quaprolist;
	}

	public void setQuaprolist(Quaprolist quaprolist) {
		this.quaprolist = quaprolist;
	}

	public Integer getSpareId() {
		return spareId;
	}

	public void setSpareId(Integer spareId) {
		this.spareId = spareId;
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
		pm=spareService.getPagerDesc(Spare.class);
		return "list";
	}
	
	public String add() throws ParseException
	{
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		if(null!=quaprolistId&&null!=spare.getNum()&&null!=spare.getUprice())
		{
			spare.setQuaprolist(quaprolistService.findById(Quaprolist.class, quaprolistId));
			spareService.saveAndRefresh(spare);
			logger.warn(auditUser.getId()+"add id="+spare.getId());
			return "pub_add_success";
		}
		return "pub_exception";
	}
	
	public String search()
	{
		Map<String,String> like=new HashMap<String,String>();
		like.put("quaprolist.supplierinfo.supcname", spare.getQuaprolist().getSupplierinfo().getSupcname());
		pm=spareService.fuzzyQuery(Spare.class, like);
		return "list";
	}
	
	public String del()
	{
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		spareService.deleteById(Spare.class, spareId);
		logger.warn(auditUser.getId()+"del id="+spareId);
		return "pub_del_success";
	}
	
	public String update()
	{
		User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		auditUser=currentUser;
		//获取 类型
		if(null!=quaprolistId&&null!=spare.getNum()&&null!=spare.getUprice())
		{
		Quaprolist quaprolist=quaprolistService.findById(Quaprolist.class, quaprolistId);
		spare.setQuaprolist(quaprolist);
		spareService.update(spare);
		logger.warn(auditUser.getId()+"update id="+spare.getId());
		return "pub_update_success";
		}
		return "pub_exception";
	}
	
	/*==============Input页面===========================================*/
	public String addInput()
	{
		return "add_input";
	}
	public String editInput()
	{
		spare=spareService.findById(Spare.class, spareId);
		return "edit_input";
	}

}
