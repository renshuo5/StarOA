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
import com.fjsdfx.starerp.proreport.model.Proreportfive;
import com.fjsdfx.starerp.proreport.model.Proreportthree;
import com.fjsdfx.starerp.proreport.service.ProreportfiveService;
import com.fjsdfx.starerp.proreport.service.ProreportthreeService;
import com.fjsdfx.starerp.security.model.User;
import com.sun.org.apache.bcel.internal.generic.NEW;


@Controller
@Scope("prototype")
public class ProreportfiveAction {
	private Logger logger=LoggerFactory.getLogger(ProreportfiveAction.class);
	private ProreportfiveService proreportfiveService;
	private Proreportfive proreportfive= new Proreportfive();
	private Integer prtfiveId;
	private PagerModel pm;
	String dateString;
	User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	public Logger getLogger() {
		return logger;
	}
	public void setLogger(Logger logger) {
		this.logger = logger;
	}
	public ProreportfiveService getProreportfiveService() {
		return proreportfiveService;
	}
	@Resource
	public void setProreportfiveService(ProreportfiveService proreportfiveService) {
		this.proreportfiveService = proreportfiveService;
	}
	public Proreportfive getProreportfive() {
		return proreportfive;
	}
	public void setProreportfive(Proreportfive proreportfive) {
		this.proreportfive = proreportfive;
	}
	public Integer getPrtfiveId() {
		return prtfiveId;
	}
	public void setPrtfiveId(Integer prtfiveId) {
		this.prtfiveId = prtfiveId;
	}
	public PagerModel getPm() {
		return pm;
	}
	public void setPm(PagerModel pm) {
		this.pm = pm;
	}
	public String getDateString() {
		return dateString;
	}
	public void setDateString(String dateString) {
		this.dateString = dateString;
	}

	/**
	 * 列表
	 * @return
	 * @throws Exception
	 */
	public String list() {
		pm=proreportfiveService.getPagerDesc(Proreportfive.class);
		return "list";
		
	}
	/**
	 * 删除
	 * @return
	 */
	
	public String del()
	{
		proreportfiveService.deleteById(Proreportfive.class, prtfiveId);
		logger.warn("user id="+currentUser.getId()+"del id="+prtfiveId);
		return "pub_del_success";
	}
	/**
	 * 添加
	 * @return
	 */
	public String add()
	{
		if(null!=proreportfive.getFiqua() && null!=proreportfive.getFiunq() && null!=proreportfive.getPronum()&& null!=proreportfive.getInsptime()&& null!=proreportfive.getUnqnum()&& null!=proreportfive.getRtdate() && proreportfive.getPronum()>=proreportfive.getUnqnum())
		{
		proreportfiveService.saveAndRefresh(proreportfive);
		
		logger.warn("user id="+currentUser.getId()+"add id="+proreportfive.getFid());//日志记录
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
		proreportfive=proreportfiveService.findById(Proreportfive.class,prtfiveId );		
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy年MM月dd日");
	    if(proreportfive.getRtdate()!=null){
	    	dateString = sdf1.format(proreportfive.getRtdate());}
	  return "edit_input";
	}

	
	

	/**************************以上为各种input页面******************************************/
	
	/**
	 * 编辑
	 * @return
	 */
	public String update()
	{
		proreportfiveService.update(proreportfive);
		logger.warn("user id="+currentUser.getId()+"update id="+proreportfive.getFid());
		return "pub_add_success";
	}
	
	
}
