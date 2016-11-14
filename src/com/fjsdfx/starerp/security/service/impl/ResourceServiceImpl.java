package com.fjsdfx.starerp.security.service.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.menu.model.Menu;
import com.fjsdfx.starerp.menu.model.MenuItem;
import com.fjsdfx.starerp.menu.model.Nav;
import com.fjsdfx.starerp.security.model.Resource;
import com.fjsdfx.starerp.security.service.ResourceService;

@Service
@Transactional
public class ResourceServiceImpl extends BaseServiceImpl<Resource> implements
		ResourceService {

	public Set<Resource> getResourceSetByIds(List<Integer> ids) {

		Set<Resource> set = new HashSet<Resource>();
		if (null != ids) {
			for (Integer id : ids) {
				set.add(this.findById(Resource.class, id));
			}
		}
		return set;
	}
	private HibernateTemplate hibernatetemplate;

	public HibernateTemplate getHibernatetemplate() {
		return hibernatetemplate;
	}

	@javax.annotation.Resource
	public void setHibernatetemplate(HibernateTemplate hibernatetemplate) {
		this.hibernatetemplate = hibernatetemplate;
	}
	private List<Nav> navs;
	public List<Nav> getNavs() {
		 
		return hibernatetemplate.find("from Nav"); 
	}

	public List<Menu> findMenu(String menuNavId) {
		
		return hibernatetemplate.find("from Menu u where u.nav="+menuNavId);
	}

	public List<MenuItem> findItemMenu(String itemmenumenuid) {
		return  hibernatetemplate.find("from MenuItem u where u.menu="+itemmenumenuid);
	}

	public List<Menu> getMenus() {
		 
		return hibernatetemplate.find("from Menu"); 
	}

	public List<MenuItem> getItemMenus() {
		
		return hibernatetemplate.find("from MenuItem");
	}

	public List<Resource> getTestResouce() {
		return hibernatetemplate.find("from Resource");
	}

	public MenuItem getById(Integer id) {
		
		return (MenuItem) hibernatetemplate.find("from MenuItem m where m.id="+id); 
	}

	public List<MenuItem> findItemMenuByResource(Integer id) {
		
		return hibernatetemplate.find("from MenuItem m where m.menu="+id);
	}

	public List<Menu> findMenusByResource(Integer id) {
		return  hibernatetemplate.find("from Menu m where m.nav="+id);
	}
	
}
