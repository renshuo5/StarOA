package com.fjsdfx.starerp.menu.service.impl;

import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.menu.dao.MenuItemDao;
import com.fjsdfx.starerp.menu.dao.NavDao;
import com.fjsdfx.starerp.menu.model.Menu;
import com.fjsdfx.starerp.menu.model.MenuItem;
import com.fjsdfx.starerp.menu.model.Nav;
import com.fjsdfx.starerp.menu.service.MenuService;
import com.fjsdfx.starerp.security.dao.ResourceDao;
import com.fjsdfx.starerp.security.model.Resource;
import com.fjsdfx.starerp.security.model.User;

@org.springframework.stereotype.Service("menuServiceImpl")
public class MenuServiceImpl extends BaseServiceImpl<Menu> implements MenuService{
	private NavDao navDao;
	private MenuItemDao menuItemDao;
	private ResourceDao resourceDao;
//	public void addTool(Root root , Nav nav)
//	{
//		root.getNavs().add(nav);
//	}
//	
//	public void addMemu(Nav nav,Menu menu)
//	{
//		nav.getMenus().add(menu);
//	}
//	
//	public void addItem(Menu menu,MenuItem resource)
//	{
//		menu.getResources().add(resource);
//	}
	
//	public MenuItem getResourceByName(Root root,String name)
//	{
//		List<Nav> navs = root.getNavs();
//		for(int i = 0;i<navs.size();i++)
//		{
//			List<Menu> menus = navs.get(i).getMenus();
//			for(int j = 0;j<menus.size();j++)
//			{
//				List<MenuItem> resources = menus.get(j).getResources();
//				for(int k=0;k<resources.size();k++)
//				{
//					MenuItem resource = resources.get(k);
//					if(resource.getContent().equals(name))
//					{
//						return resource;
//					}
//				}
//			}
//		}
//		return null;
//	}
//	
//	public Menu getMenuByName(Root root,String name)
//	{
//		List<Nav> navs = root.getNavs();
//		for(int i = 0;i<navs.size();i++)
//		{
//			List<Menu> menus = navs.get(i).getMenus();
//			for(int j = 0;j<menus.size();j++)
//			{
//				Menu menu = menus.get(j);
//				if(menu.getContent().equals(name))
//				{
//					return menu;
//				}
//			}
//		}
//		return null;
//	}
//	
//	public Nav getNavByName(Root root,String name)
//	{
//		List<Nav> navs = root.getNavs();
//		for(int i = 0;i<navs.size();i++)
//		{
//			Nav nav = navs.get(i);
//			if(nav.getContent().equals(name))
//			{
//				return nav;
//			}
//		}
//		return null;
//	}
	
//	public Root addNode(Root root,String s,String url)
//	{
//		String[] strings = s.split("-");
//		if(strings.length==3)
//		{
//			Menu menu = null;
//			Nav nav = null;
//			MenuItem resource = null;
//			Menu oldMenu = getMenuByName(root, strings[1]);
//			Nav oldTool = getNavByName(root, strings[0]);
//			if(oldTool!=null)
//			{
//				nav=oldTool;
//			}
//			else{
//				nav=new Nav(strings[0]);
//				root.getNavs().add(nav);
//			}
//			if(oldMenu!=null)
//			{
//				menu=oldMenu;
//			}
//			else{
//				menu = new Menu(strings[1]);
//				nav.getMenus().add(menu);
//			}
//			resource = new MenuItem(strings[2]);
//			resource.setUrl(url);
//			menu.getResources().add(resource);
//		}
//		else if(strings.length==2)
//		{
//			Menu menu = null;
//			Nav nav = null;
//			Menu oldMenu = getMenuByName(root, strings[1]);
//			Nav oldTool = getNavByName(root, strings[0]);
//			if(oldTool!=null)
//			{
//				nav=oldTool;
//			}
//			else{
//				nav=new Nav(strings[0]);
//				root.getNavs().add(nav);
//			}
//			if(oldMenu!=null)
//			{
//				menu=oldMenu;
//			}
//			else{
//				menu = new Menu(strings[1]);
//				nav.getMenus().add(menu);
//			}
//		}
//		else if(strings.length==1)
//		{
//			Nav nav = null;
//			Nav oldTool = getNavByName(root, strings[0]);
//			if(oldTool!=null)
//			{
//				nav=oldTool;
//			}
//			else{
//				nav=new Nav(strings[0]);
//				root.getNavs().add(nav);
//			}
//		}
//		return root;
//	}
	
//	public String navListStart(Nav nav)
//	{
//		String rt="\r\n";
//		String content = "";
//		content+=
//			"	<TABLE cellSpacing=0 cellPadding=0 width=150 border=0>	"+rt+
//			"	<TR height=22>	"+rt+
//			"	<TD style=\"PADDING-LEFT: 30px\" background=/oa/images/menu_bt.jpg><A class=menuParent onclick=expand("+nav.getId()+") href=\"javascript:void(0);\">"+nav.getContent()+"</A></TD>	"+rt+
//			"	</TR>	"+rt+
//			"	<TR height=4>	"+rt+
//			"	<TD></TD>	"+rt+
//			"	</TR>	"+rt+
//			"	</TABLE>	"+rt+
//			"	<TABLE id=child"+nav.getId()+" style=\"DISPLAY: none\" cellSpacing=0 cellPadding=0 width=150 border=0>	"+rt;
//			
//			
//			
//
//
//		return content;
//	}
//	
//	public String navListEnd(Nav nav)
//	{
//		String rt="\r\n";
//		String content="";
//		content+=	
//			"	<TR height=4>	"+rt+
//			"	          <TD colSpan=2></TD>	"+rt+
//			"	        </TR>	"+rt+
//
//			"	</TABLE>	"+rt;
//		return content;
//	}
//	
//	public String menuListStart(Menu menu)
//	{
//		String rt="\r\n";
//		String content="";
//		if(menu.getResources().size()==0)
//		{
//			content+=
//				"	        <TR height=20>	"+rt+
//				"	          <TD align=middle width=30><IMG height=9 	"+rt+
//				"	            src=\"/oa/images/menu_icon.gif\" width=9></TD>	"+rt+
//				"	          <TD><A class=menuChild 	"+rt+
//				"	            href=\"/oa/party/personlist.html\" 	"+rt+
//				"	            target=main>"+menu.getContent()+"</A></TD>	"+rt+
//				"	        </TR>	"+rt;
//		}
//		else
//		{
//			content+=
//				"	<TR height=20>	"+rt+
//				"	          <TD align=middle width=30><IMG height=9 	"+rt+
//				"	            src=\"/oa/images/menu_icon.gif\" width=9></TD>	"+rt+
//				"	          <TD><A class=menuChild onclick=expand("+menu.getId()+")	"+rt+
//				"	            href=\"javascript:void(0);\" 	"+rt+
//				"	            >"+menu.getContent()+"</A></TD>	"+rt+
//				"	</TR>	"+rt+
//				"	<TR height=20  id=child"+menu.getId()+" style=\"DISPLAY: none\">	"+rt+
//				"	<TD align=middle width=30> </TD>	"+rt+
//				"	<TD width=120>	"+rt+
//				"	<TABLE  cellSpacing=0 cellPadding=0	"+rt+
//				"	width=100 border=0>	"+rt;
//
//		}
//		return content;
//	}
//	
//	public String menuListEnd(Menu menu)
//	{
//		String rt="\r\n";
//		String content="";
//		if(menu.getResources().size()==0)
//		{
//			
//		}
//		else
//		{
//			content+=
//			"	</TABLE>	"+rt+
//			"	        </TD></TR>	"+rt;
//
//		}
//		return content;
//	}
//	
//	public String resourceList(MenuItem item)
//	{
//		String rt="\r\n";//回车换行
//		String content = "		<TR height=20>"+rt+
//	          "		<TD align=middle width=30><IMG height=9"+ rt+
//	            "		src=\"/oa/images/menu_icon.gif\" width=9></TD>"+rt+
//	          "		<TD><A class=menuChild"+ rt+
//	            "		href=\"url\""+ rt+
//	            "		target=main>"+item.getContent()+"</A></TD>"+rt+
//	        "		</TR>"+rt;
//		return content;
//	}
//	
//	public String print(Root root)
//	{
//		String result="";
//		List<Nav> navs = root.getNavs();
//		for(int i=0;i<navs.size();i++)
//		{
//			Nav nav = navs.get(i);
//			nav.setId(i+1);
//			List<Menu> menus = nav.getMenus();
//			result+=navListStart(nav);
//			for(int j=0;j<menus.size();j++)
//			{
//				Menu menu = menus.get(j);
//				menu.setId((i+1)*10+j+1);
//				List<MenuItem> items = menu.getResources();
//				result+=menuListStart(menu);
//				for(int k=0;k<items.size();k++)
//				{
//					MenuItem resource = items.get(k);
//					resource.setId((i+1)*100+(j+1)*10+k+1);
//					result+=resourceList(resource);
//				}
//				result+=menuListEnd(menu);
//			}
//			result+=navListEnd(nav);
//		}
//		return result;
//	}
	
	public ResourceDao getResourceDao() {
		return resourceDao;
	}

	@javax.annotation.Resource
	public void setResourceDao(ResourceDao resourceDao) {
		this.resourceDao = resourceDao;
	}

	public MenuItemDao getMenuItemDao() {
		return menuItemDao;
	}

	@javax.annotation.Resource
	public void setMenuItemDao(MenuItemDao menuItemDao) {
		this.menuItemDao = menuItemDao;
	}

	public NavDao getNavDao() {
		return navDao;
	}

	@javax.annotation.Resource
	public void setNavDao(NavDao navDao) {
		this.navDao = navDao;
	}

	public String writeNavs(User user)
	{
		String result="";
		String rt="\r\n";//回车换行
		Set<Integer> ids = new HashSet<Integer>();
		Map<String, List<com.fjsdfx.starerp.security.model.Resource>> roleResources = user.getRoleResources();
		Collection<List<com.fjsdfx.starerp.security.model.Resource>> values = roleResources.values();
		for (Iterator iterator = values.iterator(); iterator.hasNext();) {
			List<Resource> list = (List<Resource>) iterator.next();
			for (Iterator iterator2 = list.iterator(); iterator2.hasNext();) {
				Resource resource = (Resource) iterator2.next();
				if(resource.getMenuItem()!=null)
				{
					ids.add(resource
					.getMenuItem()
					.getMenu()
					.getNav()
					.getId());
				}
			}
		}
		StringBuffer hqlString = new StringBuffer("from Nav nav where nav.id in (");
		for (Iterator iterator = ids.iterator(); iterator.hasNext();) {
			Integer id = (Integer) iterator.next();
			hqlString.append(id+",");
		}
		hqlString.deleteCharAt(hqlString.length()-1);
		hqlString.append(")");
		System.out.println("hql = "+hqlString);
		List<Nav> navs = navDao.findByHql(hqlString.toString());
		result+="<ul class='nav_content'>"+rt;
		for(int i=0;i<navs.size();i++)
		{
			Nav nav = navs.get(i);
			if(i==0)
			{
				result+="<li class='current'>"+rt;
			}
			else
			{
				result+="<li>"+rt;
			}
			result+="<a href='menu/menu?navId="+nav.getId()+"&index="+i+"' title='"+nav.getContent()+"' target=menu>"+nav.getContent()+"</a>"+rt;
			result+="</li>"+rt;
		}
		result+="</ul>"+rt;
		return result;
	}
	
	public String writeMenuItems(Integer menuId, User user)
	{
		Set<Integer> ids = new HashSet<Integer>();
		Map<String, List<com.fjsdfx.starerp.security.model.Resource>> roleResources = user.getRoleResources();
		Collection<List<com.fjsdfx.starerp.security.model.Resource>> values = roleResources.values();
		for (Iterator iterator = values.iterator(); iterator.hasNext();) {
			List<Resource> list = (List<Resource>) iterator.next();
			for (Iterator iterator2 = list.iterator(); iterator2.hasNext();) {
				Resource resource = (Resource) iterator2.next();
				if(resource.getMenuItem()!=null)
				{
					ids.add(resource
					.getMenuItem()
					.getId());
				}
			}
		}
		StringBuffer hqlString = new StringBuffer("from Resource r where r.menuItem.menu.id = "+menuId+" and r.menuItem.id in (");
		for (Iterator iterator = ids.iterator(); iterator.hasNext();) {
			Integer id = (Integer) iterator.next();
			hqlString.append(id+",");
		}
		hqlString.deleteCharAt(hqlString.length()-1);
		hqlString.append(")");
		String result="";
		String rt="\r\n";//回车换行
		List<Resource> resources = resourceDao.findByHql(hqlString.toString());
		for (Iterator iterator = resources.iterator(); iterator.hasNext();) {
			Resource resource = (Resource) iterator.next();
			result+="<li>"+rt+
            "<a href='.."+resource.getValue().replace("**", "")+"' target=main>"+resource.getMenuItem().getContent()+"</a>"+rt+
          "</li>"+rt;
		}
		return result;
	}
	
	public String writeMenus(Integer navId,User user)
	{
		Menu menu = null;
		Set<Integer> ids = new HashSet<Integer>();
		Map<String, List<com.fjsdfx.starerp.security.model.Resource>> roleResources = user.getRoleResources();
		Collection<List<com.fjsdfx.starerp.security.model.Resource>> values = roleResources.values();
		for (Iterator iterator = values.iterator(); iterator.hasNext();) {
			List<Resource> list = (List<Resource>) iterator.next();
			for (Iterator iterator2 = list.iterator(); iterator2.hasNext();) {
				Resource resource = (Resource) iterator2.next();
				if(resource.getMenuItem()!=null)
				{
					ids.add(resource
					.getMenuItem()
					.getMenu()
					.getId());
				}
			}
		}
		StringBuffer hqlString = new StringBuffer("from Menu menu where menu.nav.id = "+navId+" and menu.id in (");
		for (Iterator iterator = ids.iterator(); iterator.hasNext();) {
			Integer id = (Integer) iterator.next();
			hqlString.append(id+",");
		}
		hqlString.deleteCharAt(hqlString.length()-1);
		hqlString.append(")");
		String result="";
		String rt="\r\n";//回车换行
		result+="<ul class='container'>"+rt;
		List<Menu> menus = findByHql(hqlString.toString());
		for(int i=0;i<menus.size();i++)
		{
			menu = menus.get(i);
			result+="<li class='menu'>"+rt;
			result+="<ul>"+rt+
            "<li class='button'>"+rt+
              "<a href='#' class='blue'>" +
              /*"<img src="+menu.getMenuImage().getUrl()+" />"+*/
              menu.getContent()+"</a>"+
            "</li>"+rt+
            "<li class='dropdown'>"+rt+
            "<ul>"+rt;
			result+=writeMenuItems(menu.getId(),user);
			result+="</ul>"+rt+
			"</li>"+rt+
			"</ul>"+rt+
            "</li>"+rt;
		}
		result+="</ul>";
		return result;
	}


}
