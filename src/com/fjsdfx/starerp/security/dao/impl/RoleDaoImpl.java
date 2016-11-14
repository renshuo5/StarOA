package com.fjsdfx.starerp.security.dao.impl;

import java.io.Serializable;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.dao.BaseDaoImpl;
import com.fjsdfx.starerp.security.dao.RoleDao;
import com.fjsdfx.starerp.security.model.Role;
@Component
@Transactional
public class RoleDaoImpl extends BaseDaoImpl<Role> implements RoleDao{

	
	public Object update(Object entity){
		// TODO Auto-generated method stub
		//this.getHibernatetemplate().getSessionFactory().getCurrentSession().clear();
		//this.getHibernatetemplate().getSessionFactory().getCurrentSession().merge(entity);
		//this.getHibernatetemplate().update(entity);
		//this.getHibernatetemplate().getSessionFactory().getCurrentSession().flush();
		//this.getHibernatetemplate().getSessionFactory().getCurrentSession().evict(entity);
		this.getHibernatetemplate().merge(entity);
		return entity;
	}
	
	public <T> T deleteById(Class<T> entityclass ,Serializable id)
	{
		
		T entity = 	(T)this.getHibernatetemplate().get(entityclass, id);
		this.getHibernatetemplate().delete(entity);
		return entity;
	}
}
