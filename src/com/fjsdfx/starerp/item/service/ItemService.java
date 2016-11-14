package com.fjsdfx.starerp.item.service;

import java.util.List;

import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.item.dao.ItemDao;
import com.fjsdfx.starerp.item.model.Item;

public interface ItemService extends BaseService<Item>{
	public List<Item> getAllItems();
	public List<Item> getItemsByIds(List<Integer> ids);
	public void deleteById(Integer integer);
    public Item save(Item item);
    public String checkExistsByName(String itemName);
}
