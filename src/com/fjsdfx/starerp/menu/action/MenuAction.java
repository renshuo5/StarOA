package com.fjsdfx.starerp.menu.action;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.security.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;

import com.fjsdfx.starerp.menu.model.Nav;
import com.fjsdfx.starerp.menu.service.MenuService;
import com.fjsdfx.starerp.security.model.User;
import com.fjsdfx.starerp.security.service.UserService;

@Controller
@Scope("prototype")
public class MenuAction {
	private Integer navId;
	public Integer getNavId() {
		return navId;
	}
	public void setNavId(Integer navId) {
		this.navId = navId;
	}
	private User curUser;
	public MenuAction(){
		httpServletResponse = ServletActionContext.getResponse();
		httpServletResponse.setContentType("text/html;charset=UTF-8");
		httpServletResponse.setCharacterEncoding("UTF-8");
		curUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	}
	private HttpServletResponse httpServletResponse = null;
	private String navString;
	private String menuString;
	private Integer index;
	private Set<String> menuStringList;
	private UserService userService;
	public UserService getUserService() {
		return userService;
	}
	@Resource
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public Set<String> getMenuStringList() {
		return menuStringList;
	}
	public void setMenuStringList(Set<String> menuStringList) {
		this.menuStringList = menuStringList;
	}
	public Integer getIndex() {
		return index;
	}
	public void setIndex(Integer index) {
		this.index = index;
	}
	public String getMenuString() {
		return menuString;
	}
	public void setMenuString(String menuString) {
		this.menuString = menuString;
	}
	public String getNavString() {
		return navString;
	}
	public void setNavString(String navString) {
		this.navString = navString;
	}
	private List<Nav> navs;
	public List<Nav> getNavs() {
		return navs;
	}
	public void setNavs(List<Nav> navs) {
		this.navs = navs;
	}
	private MenuService menuService;
	
	public MenuService getMenuService() {
		return menuService;
	}
	@javax.annotation.Resource(name="menuServiceImpl")
	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}
	
	public String menu()
	{
		menuString = menuService.writeMenus(navId,curUser);
		return "success";
	}
//	public String personalCenter()
//	{
//		User curUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		menuStringList = userService.getMenuStringSet(curUser);
//		userMenu = new UserMenu(menuStringList);
//		menuString = menuService.writeMenus(userMenu.getRoot().getNavs().get(index));
//		httpServletResponse.setContentType("text/html;charset=UTF-8");
//		httpServletResponse.setCharacterEncoding("UTF-8");
//		return "personalCenter";
//	}
//	public String personalmanage()
//	{
//		User curUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		menuStringList = userService.getMenuStringSet(curUser);
//		userMenu = new UserMenu(menuStringList);
//		menuString = menuService.writeMenus(userMenu.getRoot().getNavs().get(index));
//		httpServletResponse.setContentType("text/html;charset=UTF-8");
//		httpServletResponse.setCharacterEncoding("UTF-8");
//		return "personalmanage";
//	}
//	public String procurement()
//	{
//		User curUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		menuStringList = userService.getMenuStringSet(curUser);
//		userMenu = new UserMenu(menuStringList);
//		menuString = menuService.writeMenus(userMenu.getRoot().getNavs().get(index));
//		httpServletResponse.setContentType("text/html;charset=UTF-8");
//		httpServletResponse.setCharacterEncoding("UTF-8");
//		return "procurement";
//	}
//	public String product()
//	{
//		User curUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		menuStringList = userService.getMenuStringSet(curUser);
//		userMenu = new UserMenu(menuStringList);
//		menuString = menuService.writeMenus(userMenu.getRoot().getNavs().get(index));
//		httpServletResponse.setContentType("text/html;charset=UTF-8");
//		httpServletResponse.setCharacterEncoding("UTF-8");
//		return "product";
//	}
//	public String qualitycontrol()
//	{
//		User curUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		menuStringList = userService.getMenuStringSet(curUser);
//		userMenu = new UserMenu(menuStringList);
//		menuString = menuService.writeMenus(userMenu.getRoot().getNavs().get(index));
//		httpServletResponse.setContentType("text/html;charset=UTF-8");
//		httpServletResponse.setCharacterEncoding("UTF-8");
//		System.out.println("menuString = "+menuString);
//		return "qualitycontrol";
//	}
//	public String systemmanage()
//	{
//		User curUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		menuStringList = userService.getMenuStringSet(curUser);
//		userMenu = new UserMenu(menuStringList);
//		menuString = menuService.writeMenus(userMenu.getRoot().getNavs().get(index));
//		httpServletResponse.setContentType("text/html;charset=UTF-8");
//		httpServletResponse.setCharacterEncoding("UTF-8");
//		return "systemmanage";
//	}
//	public String warehouse()
//	{
//		User curUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		menuStringList = userService.getMenuStringSet(curUser);
//		userMenu = new UserMenu(menuStringList);
//		httpServletResponse.setContentType("text/html;charset=UTF-8");
//		httpServletResponse.setCharacterEncoding("UTF-8");
//		menuString = menuService.writeMenus(userMenu.getRoot().getNavs().get(index));
//		return "warehouse";
//	}
	public String navigate()
	{
		navString = menuService.writeNavs(curUser);
		return "navigate";
	}
}
