package com.fjsdfx.starerp.persons.action;

import javax.annotation.Resource;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Scope;
import org.springframework.security.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;


import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.model.Jobs;

import com.fjsdfx.starerp.persons.service.DepartmentService;
import com.fjsdfx.starerp.persons.service.JobsService;
import com.fjsdfx.starerp.security.model.User;
import com.sun.org.apache.bcel.internal.generic.NEW;





/**
 * @author Huang_Hai
 *
 */
@Controller
@Scope("prototype")
public class JobsAction {
	
	
	private Logger logger=LoggerFactory.getLogger(JobsService.class);
	private JobsService jobsService;
	private Jobs jobs=new Jobs();
	private Integer jobsId;
    private PagerModel pm;
    
    
    

    public JobsService getJobsService() {
		return jobsService;
	}
    @Resource
	public void setJobsService(JobsService jobsService) {
		this.jobsService = jobsService;
	}
	public Integer getJobsId() {
		return jobsId;
	}
	public void setJobsId(Integer jobsId) {
		this.jobsId = jobsId;
	}
	public Logger getLogger() {
		return logger;
	}
	public void setLogger(Logger logger) {
		this.logger = logger;
	}
	public Jobs getJobs() {
		return jobs;
	}
	public void setJobs(Jobs jobs) {
		this.jobs = jobs;
	}
	public PagerModel getPm() {
		return pm;
	}
	public void setPm(PagerModel pm) {
		this.pm = pm;
	}
	
	/**
	 * 列表
	 * @return
	 * @throws Exception
	 */
	public String list()  {
		
		pm=jobsService.getPagerDesc(Jobs.class);
		return "list";
	}
	/**
	 * 删除
	 * @return
	 */
	
	public String del()
	{
	
		
		jobsService.deleteById(Jobs.class,jobsId);
		
		User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		logger.warn("user id="+currentUser.getId()+" del id="+jobs.getId());//日志记录
	
		return "pub_del_success";
	}
	/**
	 * 添加
	 * @return
	 */
	public String add()
	{
	//后台验证职位名称不能为空
		if(null!=jobs.getJobsName() && !"".equals(jobs.getJobsName()))
		{
		jobsService.saveAndRefresh(jobs);
		
		User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		logger.warn("user id="+currentUser.getId()+" add id="+jobs.getId());//日志记录
		}
		return "pub_add_success";
	}
	public String addInput()
	{
		return "add_input";
	}
	
	public String editInput()
	{  
	
	  jobs=jobsService.findById(Jobs.class,jobsId);
	  return "edit_input";
	}

	
	

	/**************************以上为各种input页面******************************************/
	
	/**
	 * 编辑
	 * @return
	 */
	public String update()
	{
		
		jobsService.update(jobs);
		
		User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		logger.warn("user id="+currentUser.getId()+" update id="+jobs.getId());//日志记录
		
		return "pub_add_success";
	}
	
	
	
}
