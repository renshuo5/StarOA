package com.fjsdfx.starerp.security.dao.impl;

import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.util.ServletContextAware;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.fjsdfx.starerp.common.dao.BaseDaoImpl;
import com.fjsdfx.starerp.security.dao.UserDao;
import com.fjsdfx.starerp.security.model.User;
import com.fjsdfx.starerp.security.support.SecurityManager;
@Component
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao{
	public static ServletContext context;
	public Object update(Object entity){
		// TODO Auto-generated method stub
		//this.getHibernatetemplate().getSessionFactory().getCurrentSession().clear();
		this.getHibernatetemplate().merge(entity);
	
		
		
		return entity;
	}

	
}
