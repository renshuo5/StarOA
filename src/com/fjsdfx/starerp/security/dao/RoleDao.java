package com.fjsdfx.starerp.security.dao;

import java.io.Serializable;

import com.fjsdfx.starerp.common.dao.BaseDao;
import com.fjsdfx.starerp.security.model.Role;

/**
 * @author Chen_Luqiang
 *
 */
public interface RoleDao  extends BaseDao<Role> {
	public Object update(Object entity);
	public <T> T deleteById(Class<T> entityclass ,Serializable id);
}
