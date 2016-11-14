package com.fjsdfx.starerp.security.service.impl;

import java.io.Serializable;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.persons.model.Employee;
import com.fjsdfx.starerp.security.dao.UserDao;
import com.fjsdfx.starerp.security.model.Role;
import com.fjsdfx.starerp.security.model.User;
import com.fjsdfx.starerp.security.service.UserService;
@Service
@Transactional
public class UserServiceImpl  extends BaseServiceImpl<User> implements UserService{

	private UserDao userDao;
	public UserDao getUserDao() {
		return userDao;
	}
	@Resource
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	public void save(String name,String password,Employee employee,Set<Role> roles)
	{
		User user=new User();
		user.setName(name);
		user.setEmployee(employee);
		user.setPassword(password);
		user.setRoles(roles);
		this.save(user);
	}

	public void update(User user) {
		userDao.update(user);
	}
	
	public void deleteById(Serializable id)
	{
		userDao.deleteById(User.class, id);

	}
	public PagerModel getPagerDesc()
	{
		return this.getPagerDesc(User.class, "where o.disabled=false");
		
	}
}


