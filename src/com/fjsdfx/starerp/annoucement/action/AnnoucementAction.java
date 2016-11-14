package com.fjsdfx.starerp.annoucement.action;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.fjsdfx.starerp.annoucement.model.Annoucement;
import com.fjsdfx.starerp.annoucement.service.AnnoucementService;
import com.fjsdfx.starerp.common.bean.PagerModel;


/**
 * @author Chen_Luqiang
 *
 */
@Controller
@Scope("prototype")
public class AnnoucementAction {
	private Logger logger=LoggerFactory.getLogger(AnnoucementAction.class);
	private  AnnoucementService  annoucementService;
	private Annoucement annoucement;
	private PagerModel pm;
	private Integer annoucementid;
	public AnnoucementService getAnnoucementService() {
		return annoucementService;
	}

	@Resource
	public void setAnnoucementService(AnnoucementService annoucementService) {
		this.annoucementService = annoucementService;
	}

	public Annoucement getAnnoucement() {
		return annoucement;
	}

	public void setAnnoucement(Annoucement annoucement) {
		this.annoucement = annoucement;
	}

	public PagerModel getPm() {
		return pm;
	}

	public void setPm(PagerModel pm) {
		this.pm = pm;
	}

	public Integer getAnnoucementid() {
		return annoucementid;
	}

	public void setAnnoucementid(Integer annoucementid) {
		this.annoucementid = annoucementid;
	}
	
	
	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	/**
	 * 列表
	 * @return
	 * @throws Exception
	 */
	public String list()  {
		// TODO Auto-generated method stub
		//items=itemService.getAllItems();
		pm=annoucementService.getPagerDesc(Annoucement.class);
		return "list";
	}
	
	/**
	 * 添加
	 * @return
	 */
	public String add()
	{
		annoucement.setDate(new Date());
		annoucementService.saveAndRefresh(annoucement);
		logger.warn("add id="+annoucement.getId());
		return "return_list";
	}
	/**
	 * 搜索
	 * @return
	 */
	public String search()
	{
		//pm=resourceService.findByExample(Resource.class, resource);
		
		Map<String,String> like=new HashMap<String,String>();
		like.put("title", annoucement.getTitle());		
		pm=annoucementService.fuzzyQuery(Annoucement.class, like);
		return "list";
	}
	/**
	 * 编辑
	 * @return
	 */
	public String update()
	{
		annoucementService.update(annoucement);
		logger.warn("update id="+annoucement.getId());
		return "return_list";
	}
	
	public String del()
	{
		annoucementService.deleteById(Annoucement.class, annoucementid);
		logger.warn("del id="+annoucementid);
		return "pub_del_success";
	
	}
	public String show()
	{
		annoucement=annoucementService.findById(Annoucement.class, annoucementid);
		return "show";
	}
	
/*===================================input============================================================*/
	
	public String addInput()
	{
		return "add_input";
	}
	public String editInput()
	{
		annoucement=annoucementService.findById(Annoucement.class, annoucementid);
		return "edit_input";
	}
	
	
	
}
