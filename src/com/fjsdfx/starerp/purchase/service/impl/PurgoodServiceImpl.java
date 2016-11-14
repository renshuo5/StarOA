package com.fjsdfx.starerp.purchase.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.model.ItemRelation;
import com.fjsdfx.starerp.purchase.model.Purgood;
import com.fjsdfx.starerp.purchase.model.Purorder;
import com.fjsdfx.starerp.purchase.service.PurgoodService;

@Service
@Transactional
public class PurgoodServiceImpl  extends BaseServiceImpl<Purgood> implements PurgoodService{
	public void savePurgood(Purorder purorder,ItemType itemtype,String unit,Integer num,Float uprice,Date delydate,String note)
	{
		Purgood purgood=new Purgood();
		purgood.setPurorder(purorder);
		purgood.setItemtype(itemtype);
		purgood.setUnit(unit);
		purgood.setNum(num);
		purgood.setUprice(uprice);
		purgood.setDelydate(delydate);
		purgood.setNote(note);
		this.saveAndRefresh(purgood);
	}
	public void savePurgoods(Purorder purorder,List<ItemType> itemtypes,List<String> units,List<Integer> nums,List<Float> uprices,List<Date> delydates,List<String> notes)
	{
		int i=0;
		for(ItemType itemtype : itemtypes)
		{
			if(null!=itemtype&&null!=units.get(i)&&null!=nums.get(i)&&null!=uprices.get(i)&&null!=delydates.get(i)&&null!=notes.get(i))
			{
				String unit=units.get(i);
				Integer num=nums.get(i);
				Float uprice=uprices.get(i);
				Date delydate=delydates.get(i);
				String note=notes.get(i);
				savePurgood(purorder,itemtype,unit,num,uprice,delydate,note);
			}
			i++;
		}
	}
	public List<Purgood> findPurgoodsByPurorderid(Integer purorderid)
	{
		return this.findByHql("from Purgood rg where rg.purorder.id="+purorderid);
	}
	public void delByObjects(List<Purgood> rgs)
	{
		for(Purgood rg : rgs)
		{
			this.delete(rg);
		}
	}
	public void update(Purorder purorder,List<ItemType> itemtypes,List<String> units,List<Integer> nums,List<Float> uprices,List<Date> delydates,List<String> notes)
	{
		List<Purgood> oldRgs=findPurgoodsByPurorderid(purorder.getId());
		this.delByObjects(oldRgs);
		this.savePurgoods(purorder,itemtypes,units,nums,uprices,delydates,notes);
	}

}
