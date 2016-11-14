package com.fjsdfx.starerp.produce.service.impl;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.item.model.Item;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ItemTypeService;
import com.fjsdfx.starerp.produce.model.Shogood;
import com.fjsdfx.starerp.produce.model.Shortm;
import com.fjsdfx.starerp.produce.service.ShogoodService;

@Service
@Transactional
public  class ShogoodServiceImpl extends BaseServiceImpl<Shogood> implements ShogoodService{
	
	/*private ItemTypeService itemTypeService;
	
		public void saveshogoods(Shortm shortm,List<Integer> itemTypeIds,List<String> units,List<Integer> nums,
				 List<String> userfs,
				 List<Float> prices,
				 List<Float> uprices){
			 Shogood shogood=new Shogood();
			for (int i = 0; i < itemTypeIds.size(); i++) {
				ItemType itemType=itemTypeService.findById(ItemType.class, itemTypeIds.get(i));
				
				 shogood.setShortm(shortm);
				 shogood.setItemType(itemType);
				 shogood.setUnit(units.get(i));
				 shogood.setNum(nums.get(i));
				 shogood.setUserf(userfs.get(i));
				shogood.setPrice(prices.get(i));
				shogood.setUprice(uprices.get(i));
			}
		}

		public ItemTypeService getItemTypeService() {
			return itemTypeService;
		}
        @Resource
		public void setItemTypeService(ItemTypeService itemTypeService) {
			this.itemTypeService = itemTypeService;
		}*/
}
		

		
		
		
	


