package com.fjsdfx.starerp.purchase.service;

import java.util.Date;
import java.util.List;

import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.purchase.model.Purgood;
import com.fjsdfx.starerp.purchase.model.Purorder;

public interface PurgoodService extends BaseService<Purgood> {
	public void savePurgood(Purorder purorder,ItemType itemtype,String unit,Integer num,Float uprice,Date delydate,String note);
	public void savePurgoods(Purorder purorder,List<ItemType> itemtypes,List<String> units,List<Integer> nums,List<Float> uprices,List<Date> delydates,List<String> notes);
	public List<Purgood> findPurgoodsByPurorderid(Integer purorderid);
	public void delByObjects(List<Purgood> rgs);
	public void update(Purorder purorder,List<ItemType> itemtypes,List<String> units,List<Integer> nums,List<Float> uprices,List<Date> delydates,List<String> notes);

}
