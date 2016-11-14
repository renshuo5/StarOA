package com.fjsdfx.starerp.item.dao;

import java.util.List;

import com.fjsdfx.starerp.common.dao.BaseDao;
import com.fjsdfx.starerp.item.model.Item;

/**
 * @author Chen_Luqiang
 *
 */
public interface ItemDao extends BaseDao<Item> {
	public List<Item> getAllItems();
	public boolean checkExistsByName(String itemName);
}
