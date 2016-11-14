package com.fjsdfx.starerp.proreport.action;

import java.text.SimpleDateFormat;
import javax.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Scope;
import org.springframework.security.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.proreport.model.Proreportone;
import com.fjsdfx.starerp.proreport.service.ProreportoneService;
import com.fjsdfx.starerp.security.model.User;
import com.sun.org.apache.bcel.internal.generic.NEW;


@Controller
@Scope("prototype")
public class ProreportoneAction {
	private Logger logger=LoggerFactory.getLogger(ProreportoneAction.class);
	private ProreportoneService proreportoneService;
	private Proreportone proreportone= new Proreportone();
	private Integer prtoneId;
	private PagerModel pm;
	User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	String prtdateString;
	public Logger getLogger() {
		return logger;
	}
	public void setLogger(Logger logger) {
		this.logger = logger;
	}
	public ProreportoneService getProreportoneService() {
		return proreportoneService;
	}
	@Resource
	public void setProreportoneService(ProreportoneService proreportoneService) {
		this.proreportoneService = proreportoneService;
	}
	public Proreportone getProreportone() {
		return proreportone;
	}
	public void setProreportone(Proreportone proreportone) {
		this.proreportone = proreportone;
	}
	public Integer getPrtoneId() {
		return prtoneId;
	}
	public void setPrtoneId(Integer prtoneId) {
		this.prtoneId = prtoneId;
	}
	public PagerModel getPm() {
		return pm;
	}
	public void setPm(PagerModel pm) {
		this.pm = pm;
	}

	public String getPrtdateString() {
		return prtdateString;
	}
	public void setPrtdateString(String prtdateString) {
		this.prtdateString = prtdateString;
	}
	/**
	 * 列表
	 * @return
	 * @throws Exception
	 */
	public String list() {
		pm=proreportoneService.getPagerDesc(Proreportone.class);
		return "list";
		
	}
	/**
	 * 删除
	 * @return
	 */
	
	public String del()
	{
		proreportoneService.deleteById(Proreportone.class, prtoneId);
		logger.warn("user id="+currentUser.getId()+"del id="+prtoneId);
		return "pub_del_success";
	}
	/**
	 * 添加
	 * @return
	 */
	public String add()
	{
		if(null!=proreportone.getPronum() && null!=proreportone.getUnqnum()&& null!=proreportone.getPrtdate() && proreportone.getPronum()>=proreportone.getUnqnum())
		{
		proreportoneService.saveAndRefresh(proreportone);
		logger.warn("user id="+currentUser.getId()+"add id="+proreportone.getPrt1Id());
		return "pub_add_success";
		}
		else{
			return "pub_exception";
		}
		
	}
	public String addInput()
	{
		return "add_input";
	}
	
	public String editInput()
	{  
		proreportone=proreportoneService.findById(Proreportone.class,prtoneId );		
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy年MM月dd日");
	    if(proreportone.getPrtdate()!=null){
	    	prtdateString = sdf1.format(proreportone.getPrtdate());}
	  return "edit_input";
	}

	
	

	/**************************以上为各种input页面******************************************/
	
	/**
	 * 编辑
	 * @return
	 */
	public String update()
	{
		proreportoneService.update(proreportone);
		logger.warn("user id="+currentUser.getId()+"update id="+proreportone.getPrt1Id());
		return "pub_add_success";
	}
	
}
