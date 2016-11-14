package com.fjsdfx.starerp.security.action;

import com.fjsdfx.starerp.security.model.User;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.context.SecurityContextHolder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;


import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.item.model.Item;
import com.fjsdfx.starerp.persons.model.Employee;
import com.fjsdfx.starerp.persons.service.EmployeeService;
import com.fjsdfx.starerp.security.model.Resource;
import com.fjsdfx.starerp.security.model.Role;
import com.fjsdfx.starerp.security.model.User;
import com.fjsdfx.starerp.security.service.RoleService;
import com.fjsdfx.starerp.security.service.UserService;
/**
 * @author Chen_Luqiang
 *
 */
@Controller
@Scope("prototype")
public class UserAction {

	/**
	 * 服务层
	 */
	private UserService userService;
	public RoleService getRoleService() {
		return roleService;
	}

	@javax.annotation.Resource
	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

	private RoleService roleService;
	private EmployeeService employeeService;
	
	public EmployeeService getEmployeeService() {
		return employeeService;
	}
	@javax.annotation.Resource
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	/**
	 * 分页
	 */
	private PagerModel pm;
	
	
	/**
	 * 角色ID集合
	 */
	private List<Integer> checkedRoleIdList;
	
	private String userName;
	private String userPassword;
	private String defultPassword;
	private String userPerson;
	private Integer employeeId;
	private List<Role> roleList;
	private Integer userId;
	private String oldPassword;
	private String newPassword;
	private Logger logger=LoggerFactory.getLogger(UserAction.class);
	
	

	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public String getDefultPassword() {
		return defultPassword;
	}

	public void setDefultPassword(String defultPassword) {
		this.defultPassword = defultPassword;
	}

	public Integer getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	private User user;
	public List<Role> getRoleList() {
		return roleList;
	}

	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserPerson() {
		return userPerson;
	}

	public void setUserPerson(String userPerson) {
		this.userPerson = userPerson;
	}

	public PagerModel getPm() {
		return pm;
	}

	public List<Integer> getCheckedRoleIdList() {
		return checkedRoleIdList;
	}

	public void setCheckedRoleIdList(List<Integer> checkedRoleIdList) {
		this.checkedRoleIdList = checkedRoleIdList;
	}

	public void setPm(PagerModel pm) {
		this.pm = pm;
	}

	public UserService getUserService() {
		return userService;
	}

	@javax.annotation.Resource
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	
	//======================各种Action====================================
	/**
	 * 列表
	 * @return
	 */
	public String list()
	{
		pm=userService.getPagerDesc();
		return "list";
	}
	
	/**
	 * 搜索
	 * @return
	 */
	public String search()
	{
		Map<String,String> likeMap=new HashMap<String,String>();
		likeMap.put("name", user.getName());
		likeMap.put("employee.empName", user.getEmployee().getEmpName());
		pm=userService.fuzzyQuery(User.class, likeMap);
		return "list";
	}
	public String selectSearch()
	{
		Map<String,String> likeMap=new HashMap<String,String>();
		likeMap.put("employee.empName", user.getEmployee().getEmpName());
		pm=userService.fuzzyQuery(User.class, likeMap);
		return "select_input";
	}
	
	
	/**
	 * 增加
	 * @return
	 */
	public String add()
	{
		Set<Role> roles =roleService.getRoleSetByIds(checkedRoleIdList);
		Employee employee=employeeService.findById(Employee.class, employeeId);
		
		List <User>userList=userService.findByHql("from User");
		List<String>userNameList=new ArrayList<String>(); 
		for(User user:userList)
		{
			userNameList.add(user.getName());
		}
		
		
		
		if(null!=userName&&null!=userPassword&&null!=employee&&!userNameList.contains(userName))
		{
			User user=new User();
			user.setName(userName);
			user.setEmployee(employee);
			user.setPassword(userPassword);
			user.setRoles(roles);
			userService.save(user);	
			User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			logger.warn("user id="+currentUser.getId()+" save id="+user.getId());
		}
		return "return_list";
	}
	
	
	public String update()
	{
		Set<Role> roles=roleService.getRoleSetByIds(checkedRoleIdList);
		Employee employee=employeeService.findById(Employee.class, employeeId);
		
		List <User>userList=userService.findByHql("from User");
		List<String>userNameList=new ArrayList<String>(); 
		for(User user:userList)
		{
			if(!user.getName().equals(userName))
			userNameList.add(user.getName());
		}
		
		
		if(null!=userName&&null!=employee&&!userNameList.contains(userName))
		{	
		user=userService.findById(User.class, userId);
		user.setName(userName);
		user.setEmployee(employee);
		if(null!=defultPassword)
		{	user.setPassword("d41d8cd98f00b204e9800998ecf8427e");
		}
		user.setRoles(roles);
		userService.update(user);
		User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		logger.warn("user id="+currentUser.getId()+" update id="+user.getId());
		}
		return "return_list";
	}
	//=======================input===============================================
	
	public String addInput()
	{
		roleList=roleService.findByHql("from Role");
		return "add_input";
	}
	
	public String selectInput()
	{
		pm=userService.getPagerDesc();
		return "select_input";
	}
	
	public String editInput()
	{
		
			roleList=roleService.findByHql("from Role");
			user=userService.findById(User.class, userId);
			Set<Role> roles=user.getRoles();
			checkedRoleIdList=new ArrayList<Integer>();
			for(Role role:roles)
			{
				checkedRoleIdList.add(role.getId());
			}
			return "edit_input";
	}
	public String passwordInput()
	{
		return "edit_password";
	}
	
	public String passwordsSave()
	{
		User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(oldPassword.equals(currentUser.getPassword()))
		{
			currentUser.setPassword(newPassword);
			userService.update(currentUser);
			return "password_save_success";
		}
		else
		{
			return "password_save_error";
		}
		
	}
	
	
	

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String del()
	{
		userService.deleteById(userId);
		User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		logger.warn("user id="+currentUser.getId()+" del id="+userId);
		return "pub_del_success";
	}
	
}
