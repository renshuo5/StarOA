package com.fjsdfx.starerp.security.service;

import java.io.Serializable;
import java.util.Set;

import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.persons.model.Employee;
import com.fjsdfx.starerp.security.model.Role;
import com.fjsdfx.starerp.security.model.User;

public interface UserService  extends BaseService<User>{
	
	public void save(String name,String password,Employee employee,Set<Role> roles);
	public void update(User user);
	public void deleteById(Serializable id);
	public PagerModel getPagerDesc();
}
