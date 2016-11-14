package com.fjsdfx.starerp.item.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.item.dao.ItemDao;
import com.fjsdfx.starerp.item.dao.ItemRelationDao;
import com.fjsdfx.starerp.item.dao.ItemTypeDao;
import com.fjsdfx.starerp.item.model.Item;
import com.fjsdfx.starerp.item.model.ItemRelation;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ItemService;
import com.fjsdfx.starerp.item.service.ItemTypeService;

@Service
@Transactional
public class ItemServiceImpl extends BaseServiceImpl<Item> implements ItemService {

	private ItemTypeDao itemTypeDao;
	private ItemRelationDao itemRelationDao;

	public ItemRelationDao getItemRelationDao() {
		return itemRelationDao;
	}

	@Resource(name="itemRelationDaoImpl")
	public void setItemRelationDao(ItemRelationDao itemRelationDao) {
		this.itemRelationDao = itemRelationDao;
	}

	public ItemTypeDao getItemTypeDao() {
		return itemTypeDao;
	}

	@Resource(name="itemTypeDaoImpl")
	public void setItemTypeDao(ItemTypeDao itemTypeDao) {
		this.itemTypeDao = itemTypeDao;
	}

	private ItemDao itemDao;

	public ItemDao getItemDao() {
		return itemDao;
	}

	@Resource(name="itemDaoImpl")
	public void setItemDao(ItemDao itemDao) {
		this.itemDao = itemDao;
	}
	
	public List<Item> getAllItems()
	{
		return itemDao.getAllItems();
	}
	
	/* (non-Javadoc)
	 * 通过ID集合获得Item集合
	 * @see com.fjsdfx.starerp.item.service.ItemService#getItemsByIds(java.util.List)
	 */
	public List<Item> getItemsByIds(List<Integer> ids)
	{
		
		List<Item> items=new ArrayList<Item>();
	
		if(!ids.isEmpty())
		{
						
			for(Integer id:ids)
			{
				if(null!=id)
				{
					List<Item> tempItems = findByHql("from Item i where i.id = "+id);
					if(null!=tempItems&&tempItems.size()>0)
					{
						items.add(tempItems.get(0));
					}
				}
				else if(null==id)
				{
					items.add(null);
				}
			}
		
		}
		return items;
	}

	public void deleteById(Integer itemid) {
		deleteById(Item.class, itemid);
	}
	
	public Item save(Item item)
    {
        return super.saveAndRefresh(item);
    }

	public String checkExistsByName(String itemName) {
		if(itemDao.checkExistsByName(itemName))
		{
			return "该部品名已经存在，请重新输入！";
		}
		return "ok";
	}
	
}
