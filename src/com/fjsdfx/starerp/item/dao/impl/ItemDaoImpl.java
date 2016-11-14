package com.fjsdfx.starerp.item.dao.impl;


import java.util.List;

import org.springframework.stereotype.Component;


import com.fjsdfx.starerp.common.dao.BaseDaoImpl;
import com.fjsdfx.starerp.item.dao.ItemDao;
import com.fjsdfx.starerp.item.model.Item;
@Component
public class ItemDaoImpl extends BaseDaoImpl<Item> implements ItemDao {

	public List<Item> getAllItems()
	{
		return super.getHibernatetemplate().find("from Item");
	}

	public boolean checkExistsByName(String itemName) {
		System.out.println("itemName in itemDao = "+itemName);
		List<Item> items =  super.getHibernatetemplate().find("from Item i where i.name = '"+itemName+"'");
		System.out.println("items's size = "+items.size());
		if(null!=items&&items.size()>0)
		{
			return true;
		}
		return false;
	}

}
