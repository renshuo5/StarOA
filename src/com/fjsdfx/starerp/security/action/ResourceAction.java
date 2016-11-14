package com.fjsdfx.starerp.security.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.security.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;

import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.menu.model.Menu;
import com.fjsdfx.starerp.menu.model.MenuItem;
import com.fjsdfx.starerp.menu.model.Nav;
import com.fjsdfx.starerp.menu.service.MenuItemService;
import com.fjsdfx.starerp.security.model.Resource;
import com.fjsdfx.starerp.security.model.User;
import com.fjsdfx.starerp.security.service.ResourceService;
import com.googlecode.jsonplugin.annotations.JSON;

/**
 * @author Chen_Luqiang
 * 
 */
@Controller
@Scope("prototype")
public class ResourceAction {
	/**
	 * 服务层
	 */
	private ResourceService resourceService;

	/**
	 * 分页
	 */
	private PagerModel pm;

	/**
	 * 用于添加编辑查找的实体
	 */
	private Resource resource;

	/**
	 * 用于编辑和删除的id
	 */
	private Integer resourceid;
	private Logger logger = LoggerFactory.getLogger(ResourceAction.class);

	@JSON(serialize = false)
	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	public Resource getResource() {
		return resource;
	}

	public void setResource(Resource resource) {
		this.resource = resource;
	}

	public PagerModel getPm() {
		return pm;
	}

	public void setPm(PagerModel pm) {
		this.pm = pm;
	}

	@JSON(serialize = false)
	public ResourceService getResourceService() {
		return resourceService;
	}

	@javax.annotation.Resource
	public void setResourceService(ResourceService resourceService) {
		this.resourceService = resourceService;
	}

	// ==========================各种Action=================================================

	/**
	 * 搜索
	 * 
	 * @return
	 */
	public String search() {
		// pm=resourceService.findByExample(Resource.class, resource);

		Map<String, String> like = new HashMap<String, String>();
		like.put("name", resource.getName());
		pm = resourceService.fuzzyQuery(Resource.class, like);
		return "list";
	}

	/**
	 * change by zjm 0430
	 * 
	 * @return
	 */

	/*
	 * 判断是否为菜单及的资源
	 */
	private String isMenu;

	public String getIsMenu() {
		return isMenu;
	}

	public void setIsMenu(String isMenu) {
		this.isMenu = isMenu;
	}

	private MenuItemService menuItemService;

	@JSON(serialize = false)
	public MenuItemService getMenuItemService() {
		return menuItemService;
	}

	@javax.annotation.Resource
	public void setMenuItemService(MenuItemService menuItemService) {
		this.menuItemService = menuItemService;
	}

	public String add() {
		if (null != resource.getName() && null != resource.getValue()) {
			if (isMenu.equals("no")) {

				System.out.print("ddd=" + resource.getParentMenuItem().getId());
				resource.setParentMenuItem(menuItemService.findById(
						MenuItem.class, resource.getParentMenuItem().getId()));
			}
			if (isMenu.equals("yes")) {
				resource.setParentMenuItem(menuItemService.findById(
						MenuItem.class, resource.getParentMenuItem().getId()));
				resource.setMenuItem(menuItemService.findById(MenuItem.class,
						resource.getParentMenuItem().getId()));
			}

			resource.setType("URL");
			resourceService.saveAndRefresh(resource);
			User currentUser = (User) SecurityContextHolder.getContext()
					.getAuthentication().getPrincipal();
			logger.warn("user id=" + currentUser.getId() + " save id="
					+ resource.getId());
		}
		return "pub_add_success";
	}

	public Integer getResourceid() {
		return resourceid;
	}

	public void setResourceid(Integer resourceid) {
		this.resourceid = resourceid;
	}

	/*
	 * 资源更新提交
	 */
	public String update() {
		if (null != resource.getName() && null != resource.getValue()) {
			if (isMenu.equals("no")) {

				System.out.print("ddd=" + resource.getParentMenuItem().getId());
				resource.setParentMenuItem(menuItemService.findById(
						MenuItem.class, resource.getParentMenuItem().getId()));
			}
			if (isMenu.equals("yes")) {
				resource.setParentMenuItem(menuItemService.findById(
						MenuItem.class, resource.getParentMenuItem().getId()));
				resource.setMenuItem(menuItemService.findById(MenuItem.class,
						resource.getParentMenuItem().getId()));
			}
			resource.setType("URL");
			resourceService.update(resource);
			User currentUser = (User) SecurityContextHolder.getContext()
					.getAuthentication().getPrincipal();
			logger.warn("user id=" + currentUser.getId() + " update id="
					+ resource.getId());
		}
		return "pub_update_success";
	}

	/*
	 * 资源删除
	 */
	public String del() {
		try {
			resourceService.deleteById(Resource.class, resourceid);

		} catch (Exception e) {
			return "del_exception";
		}

		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		logger.warn("user id=" + currentUser.getId() + " del id=" + resourceid);
		return "pub_del_success";

	}

	// =======================input页面=====================================

	private List<Nav> navs;

	public List<Nav> getNavs() {
		return navs;
	}

	public void setNavs(List<Nav> navs) {
		this.navs = navs;
	}

	public String addInput() {

		navs = resourceService.getNavs();
		return "add_input";
	}

	public String editInput() {
		resource = resourceService.findById(Resource.class, resourceid);
		navs = resourceService.getNavs();
		Menu menu = resource.getParentMenuItem().getMenu();// 通过当前url资源获得其menu
		menus = resourceService.findMenusByResource(menu.getNav().getId());
		itemMenus = resourceService.findItemMenuByResource(menu.getId());

		return "edit_input";
	}
	
	
	public String show(){
		
		resource = resourceService.findById(Resource.class, resourceid);
		return "show";
	}

	/**
	 * 列表
	 * 
	 * @return
	 */

	private List<Resource> resources;

	public List<Resource> getResources() {
		return resources;
	}

	public void setResources(List<Resource> resources) {
		this.resources = resources;
	}

	public String list() {
		navs = resourceService.getNavs();
		menus = resourceService.getMenus();
		itemMenus = resourceService.getItemMenus();
		resources = resourceService.getTestResouce();

		return "list";
	}

	/**
	 * 菜单的有关ajax的操作
	 */

	private String menunavid;// menu级别的
	private String itemmenumenuid;// menuitem级别的

	public String getItemmenumenuid() {
		return itemmenumenuid;
	}

	public void setItemmenumenuid(String itemmenumenuid) {
		this.itemmenumenuid = itemmenumenuid;
	}

	public String getMenunavid() {
		return menunavid;
	}

	public void setMenunavid(String menunavid) {
		this.menunavid = menunavid;
	}

	private List<Menu> menus;// menu级别的

	public List<Menu> getMenus() {
		return menus;
	}

	public void setMenus(List<Menu> menus) {
		this.menus = menus;
	}

	private List<MenuItem> itemMenus;

	public List<MenuItem> getItemMenus() {
		return itemMenus;
	}

	public void setItemMenus(List<MenuItem> itemMenus) {
		this.itemMenus = itemMenus;
	}

	public String domenuAjax() {
		System.out.print("menu_nav_id=" + menunavid);
		menus = resourceService.findMenu(menunavid);
		System.out.print("menus=" + menus.size());
		return "menajax";
	}

	public String doitemmenuAjax() {
		System.out.print("itemmenu_menu_id=" + menunavid);
		itemMenus = resourceService.findItemMenu(itemmenumenuid);
		System.out.print("itemMenus=" + itemMenus.size());
		return "itemmenuAjax";
	}

}
