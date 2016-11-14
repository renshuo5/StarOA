package com.fjsdfx.starerp.persons.action;



import javax.annotation.Resource;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.security.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;


import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.persons.model.Department;

import com.fjsdfx.starerp.persons.service.DepartmentService;
import com.fjsdfx.starerp.security.model.User;





/**
 * @author Huang_Hai
 *
 */
@Controller
@Scope("prototype")
public class DepartmentAction {
	private Logger logger=LoggerFactory.getLogger(DepartmentAction.class);
	private DepartmentService departmentService;
	private Department department = new Department();
	private Integer departmentId;
	
	private PagerModel pm;
	
	
	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	public DepartmentService getDepartmentService() {
		return departmentService;
	}
	@Resource
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public Integer getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
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
		pm=departmentService.getPagerDesc(Department.class);
		return "list";
	}
	/**
	 * 删除
	 * @return
	 */
	
	public String del()
	{
//		departmentService.deleteById(Department.class, departmentId);
//		
//		User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		logger.warn("user id="+currentUser.getId()+" del id="+department.getId());//日志记录
//		
		
		return departmentService.del(logger, departmentId);
	}
	/**
	 * 添加
	 * @return
	 */
	public String add()
	{   
		//后台验证部门名称、部门类别不能为空
		if(null!=department.getDptName() &&!"".equals(department.getDptName())&& null!=department.getDptType())
		{
		departmentService.saveAndRefresh(department);
		
		User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		logger.warn("user id="+currentUser.getId()+" add id="+department.getId());//日志记录
				
		}
		return "pub_add_success";
	}
	public String addInput()
	{
		return "add_input";
	}
	
	public String editInput()
	{  
	  department=departmentService.findById(Department.class,departmentId );
	  return "edit_input";
	}

	
	

	/**************************以上为各种input页面******************************************/
	
	/**
	 * 编辑
	 * @return
	 */
	public String update()
	{
		departmentService.update(department);
		
		User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		logger.warn("user id="+currentUser.getId()+" update id="+department.getId());//日志记录
		
		return "pub_add_success";
	}
	


}
