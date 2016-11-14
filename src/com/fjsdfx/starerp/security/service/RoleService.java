package com.fjsdfx.starerp.security.service;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.security.model.Resource;
import com.fjsdfx.starerp.security.model.Role;

public interface RoleService  extends BaseService<Role>{

	public void save(String name,String description,Set<Resource> resources);
	public void update(Role role);
	public void deleteById(Serializable id);
	
	public Set<Role> getRoleSetByIds(List<Integer> ids);
}
