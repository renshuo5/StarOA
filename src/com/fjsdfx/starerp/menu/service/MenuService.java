package com.fjsdfx.starerp.menu.service;

import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.menu.model.Menu;
//import com.fjsdfx.starerp.menu.model.MenuItem;
//import com.fjsdfx.starerp.menu.model.Nav;
import com.fjsdfx.starerp.security.model.User;

public interface MenuService extends BaseService<Menu>{
	
//	public  void addTool(Root root , Nav nav);
//	
//	public  void addMemu(Nav nav,Menu menu);
//	
//	public  void addItem(Menu menu,MenuItem resource);
	
//	public  MenuItem getResourceByName(Root root,String name);
//	
//	public  Menu getMenuByName(Root root,String name);
//	
//	public  Nav getNavByName(Root root,String name);
//	
//	public  Root addNode(Root root,String s,String url);
//	
//	public  String navListStart(Nav nav);
//	
//	public  String navListEnd(Nav nav);
//	
//	public  String menuListStart(Menu menu);
//	
//	public  String menuListEnd(Menu menu);
//	
//	public  String resourceList(MenuItem item);
//	
//	public  String print(Root root);
	
	public  String writeNavs(User user);
	
	public  String writeMenuItems(Integer menuId, User user);
	
	public  String writeMenus(Integer navId,User user);
}
