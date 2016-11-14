package com.fjsdfx.starerp.security.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.fjsdfx.starerp.menu.model.Menu;
import com.fjsdfx.starerp.menu.model.MenuItem;
import com.fjsdfx.starerp.menu.model.Nav;
import com.fjsdfx.starerp.security.model.User;
import org.springframework.security.context.SecurityContextHolder;
import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.security.model.Role;
import com.fjsdfx.starerp.security.model.Resource;
import com.fjsdfx.starerp.security.service.ResourceService;
import com.fjsdfx.starerp.security.service.RoleService;

/**
 * @author Chen_Luqiang
 * 
 */
@Controller
@Scope("prototype")
public class RoleAction {

	/**
	 * 服务层
	 */
	private RoleService roleService;
	private ResourceService resourceService;

	/**
	 * 用于编辑和删除的实体
	 */
	private Role role;
	/**
	 * 分页
	 */
	private PagerModel pm;

	/**
	 * 所有权限资源列表
	 */
	private List<Resource> resourceList;

	/**
	 * 选中的资源ID集合
	 */
	private List<Integer> checkedResourceIdList;

	/**
	 * 角色名
	 */
	private String roleName;
	/**
	 * 角色描述
	 */
	private String roleDescription;

	private Logger logger = LoggerFactory.getLogger(RoleAction.class);
	/**
	 * 用于编辑，删除页面的参数
	 */
	private Integer roleId;

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleDescription() {
		return roleDescription;
	}

	public void setRoleDescription(String roleDescription) {
		this.roleDescription = roleDescription;
	}

	public List<Integer> getCheckedResourceIdList() {
		return checkedResourceIdList;
	}

	public void setCheckedResourceIdList(List<Integer> checkedResourceIdList) {
		this.checkedResourceIdList = checkedResourceIdList;
	}

	public List<Resource> getResourceList() {
		return resourceList;
	}

	public void setResourceList(List<Resource> resourceList) {
		this.resourceList = resourceList;
	}

	public PagerModel getPm() {
		return pm;
	}

	public void setPm(PagerModel pm) {
		this.pm = pm;
	}

	public RoleService getRoleService() {
		return roleService;
	}

	@javax.annotation.Resource
	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

	public ResourceService getResourceService() {
		return resourceService;
	}

	@javax.annotation.Resource
	public void setResourceService(ResourceService resourceService) {
		this.resourceService = resourceService;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	// ======================各种Action====================================

	/**
	 * 列表
	 * 
	 * @return
	 */
	public String list() {
		try {
			pm = roleService.getPagerDesc(Role.class);
			return "list";
		} catch (Exception e) {
			return "restart_server";
		}
	}

	/**
	 * 搜索
	 * 
	 * @return
	 */
	public String search() {
		// pm=roleService.findByExample(Role.class, role);
		Map<String, String> likeMap = new HashMap<String, String>();
		likeMap.put("name", role.getName());
		pm = roleService.fuzzyQuery(Role.class, likeMap);
		return "list";
	}

	/**
	 * 增加
	 * 
	 * @return
	 */
	public String add() {

		Set<Resource> resources = resourceService
				.getResourceSetByIds(checkedResourceIdList);
		List<Role> roleList = roleService.findByHql("from Role");
		List<String> roleNameList = new ArrayList<String>();
		for (Role role : roleList) {
			roleNameList.add(role.getName());
		}

		if (null != roleName && roleName.substring(0, 5).equals("ROLE_")
				&& roleName.length() > 5 && !roleNameList.contains(roleName)) {
			Role role = new Role();
			role.setName(roleName);
			role.setDescription(roleDescription);
			role.setResources(resources);
			roleService.save(role);
			User currentUser = (User) SecurityContextHolder.getContext()
					.getAuthentication().getPrincipal();
			logger.warn("user id=" + currentUser.getId() + " save id="
					+ role.getId());
		}
		return "pub_add_success";
	}

	public String update() {
		List<Role> roleList = roleService.findByHql("from Role");
		List<String> roleNameList = new ArrayList<String>();
		for (Role role : roleList) {
			roleNameList.add(role.getName());
		}
		if (null != role.getName()
				&& role.getName().substring(0, 5).equals("ROLE_")
				&& role.getName().length() > 5
				&& !roleNameList.contains(roleName)) {
			Set<Resource> resources = resourceService
					.getResourceSetByIds(checkedResourceIdList);

			role.setResources(resources);

			roleService.update(role);
			User currentUser = (User) SecurityContextHolder.getContext()
					.getAuthentication().getPrincipal();
			logger.warn("user id=" + currentUser.getId() + " update id="
					+ role.getId());
		}
		return "pub_update_success";
	}

	public String del() {
		try {
			roleService.deleteById(roleId);
		} catch (Exception e) {
			return "del_exception";
		}

		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		logger.warn("user id=" + currentUser.getId() + " del id=" + roleId);

		return "pub_del_success";
	}

	// =======================input===============================================

	public String addInput() {
		navs = resourceService.getNavs();
		menus = resourceService.getMenus();
		itemMenus = resourceService.getItemMenus();
		testResources = resourceService.getTestResouce();
		return "add_input";
	}

	/**
	 * 以下于2011-04-23修改
	 * 
	 * @return
	 */

	private List<Nav> navs;// 获取所有nav级资源

	public List<Nav> getNavs() {
		return navs;
	}

	public void setNavs(List<Nav> navs) {
		this.navs = navs;
	}

	/*
	 * 获取menu级的资源
	 */
	private List<Menu> menus;

	public List<Menu> getMenus() {
		return menus;
	}

	public void setMenus(List<Menu> menus) {
		this.menus = menus;
	}

	/*
	 * 获取itemmenu级的资源
	 */
	private List<MenuItem> itemMenus;

	public List<MenuItem> getItemMenus() {
		return itemMenus;
	}

	public void setItemMenus(List<MenuItem> itemMenus) {
		this.itemMenus = itemMenus;
	}

	/*
	 * 获取resource级的资源
	 */
	private List<Resource> testResources;

	public List<Resource> getTestResources() {
		return testResources;
	}

	public void setTestResources(List<Resource> testResources) {
		this.testResources = testResources;
	}

	/*
	 * 编辑角色
	 */
	public String editInput()

	{

		resourceList = resourceService.findByHql("from Resource");
		role = roleService.findById(Role.class, roleId); 
		Set<Resource> resources = role.getResources();
		checkedResourceIdList = new ArrayList<Integer>();
		for (Resource resource : resources) {
			checkedResourceIdList.add(resource.getId());
		}
		role = roleService.findById(Role.class, roleId);
		navs = resourceService.getNavs();
		menus = resourceService.getMenus();
		itemMenus = resourceService.getItemMenus();
		testResources = resourceService.getTestResouce();

		return "edit_input";
	}

	/**
	 *the below by zjm
	 */

}
