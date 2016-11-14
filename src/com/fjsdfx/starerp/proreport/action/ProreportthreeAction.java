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
import com.fjsdfx.starerp.proreport.model.Proreportthree;
import com.fjsdfx.starerp.proreport.service.ProreportthreeService;
import com.fjsdfx.starerp.security.model.User;
import com.sun.org.apache.bcel.internal.generic.NEW;


@Controller
@Scope("prototype")
public class ProreportthreeAction {
	private Logger logger=LoggerFactory.getLogger(ProreportthreeAction.class);
	private ProreportthreeService proreportthreeService;
	private Proreportthree proreportthree= new Proreportthree();
	private Integer prtthreeId;
	private PagerModel pm;
	String dateString;
	User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	public Logger getLogger() {
		return logger;
	}
	public void setLogger(Logger logger) {
		this.logger = logger;
	}
	public ProreportthreeService getProreportthreeService() {
		return proreportthreeService;
	}
	@Resource
	public void setProreportthreeService(ProreportthreeService proreportthreeService) {
		this.proreportthreeService = proreportthreeService;
	}
	public Proreportthree getProreportthree() {
		return proreportthree;
	}
	public void setProreportthree(Proreportthree proreportthree) {
		this.proreportthree = proreportthree;
	}

	public Integer getPrtthreeId() {
		return prtthreeId;
	}
	public void setPrtthreeId(Integer prtthreeId) {
		this.prtthreeId = prtthreeId;
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
		pm=proreportthreeService.getPagerDesc(Proreportthree.class);
		return "list";
		
	}
	/**
	 * 删除
	 * @return
	 */
	
	public String del()
	{
		proreportthreeService.deleteById(Proreportthree.class, prtthreeId);
		logger.warn("user id="+currentUser.getId()+"del id="+prtthreeId);
		return "pub_del_success";
	}
	/**
	 * 添加
	 * @return
	 */
	public String add()
	{
		if(null!=proreportthree.getProbatch() && null!=proreportthree.getQuabatch() && null!=proreportthree.getPtdate()&& proreportthree.getProbatch()>=proreportthree.getQuabatch())
		{
		proreportthreeService.saveAndRefresh(proreportthree);
		logger.warn("user id="+currentUser.getId()+"add id="+proreportthree.getId());
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
		proreportthree=proreportthreeService.findById(Proreportthree.class,prtthreeId );		
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy年MM月dd日");
	    if(proreportthree.getPtdate()!=null){
	    	dateString = sdf1.format(proreportthree.getPtdate());}
	  return "edit_input";
	}

	
	

	/**************************以上为各种input页面******************************************/
	
	/**
	 * 编辑
	 * @return
	 */
	public String update()
	{
		proreportthreeService.update(proreportthree);
		logger.warn("user id="+currentUser.getId()+"update id="+proreportthree.getId());
		return "pub_add_success";
	}
	
	
	
	
}
