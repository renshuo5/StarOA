package com.fjsdfx.starerp.security.dao;

import com.fjsdfx.starerp.common.dao.BaseDao;
import com.fjsdfx.starerp.security.model.User;

/**
 * @author Chen_Luqiang
 *
 */
public interface UserDao extends BaseDao<User>{
	public Object update(Object entity);
}
