package com.fjsdfx.starerp.purchase.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.model.ItemRelation;
import com.fjsdfx.starerp.purchase.model.Resgood;
import com.fjsdfx.starerp.purchase.model.Requisitions;
import com.fjsdfx.starerp.purchase.service.ResgoodService;

@Service
@Transactional
public class ResgoodServiceImpl  extends BaseServiceImpl<Resgood> implements ResgoodService{
	public void saveResgood(Requisitions requisitions,ItemType itemtype,Integer unum,Float uprice,Integer reqnum,Date arrivaldate,String payment)
	{
		if(null!=requisitions.getId()&&null!=itemtype.getId()&&null!=unum&&null!=uprice&&null!=reqnum&&null!=arrivaldate&&null!=payment)
		{
			Resgood resgood=new Resgood();
			resgood.setRequisitions(requisitions);
			resgood.setItemtype(itemtype);
			resgood.setUnum(unum);
			resgood.setUprice(uprice);
			resgood.setReqnum(reqnum);
			resgood.setArrivaldate(arrivaldate);
			resgood.setPayment(payment);
			this.saveAndRefresh(resgood);
		}
		
		}
	public void saveResgoods(Requisitions requisitions,List<ItemType> itemtypes,List<Integer> unums,List<Float> uprices,List<Integer> reqnums,List<Date> arrivaldates,List<String> payments)
	{
		int i=0;
		
		for(ItemType itemtype : itemtypes)
		{
			System.out.println("+++++"+itemtype.getId());
			if(null!=itemtype&&null!=unums.get(i)&&null!=uprices.get(i)&&null!=reqnums.get(i)&&null!=arrivaldates.get(i)&&null!=payments.get(i))
			{
				Integer unum=unums.get(i);
				Float uprice=uprices.get(i);
				Integer reqnum=reqnums.get(i);
				Date arrivaldate=arrivaldates.get(i);
				String payment=payments.get(i);
				saveResgood(requisitions,itemtype,unum,uprice,reqnum,arrivaldate,payment);
			}
			i++;
		}
	}
	public List<Resgood> findResgoodsByRequisitionsid(Integer requisitionsid)
	{
		return this.findByHql("from Resgood o where o.requisitions.id="+requisitionsid);
	}
	public void delByObjects(List<Resgood> rgs)
	{
		for(Resgood rg : rgs)
		{
			this.delete(rg);
		}
	}
	public void update(Requisitions requisitions,List<ItemType> itemtypes,List<Integer> unums,List<Float> uprices,List<Integer> reqnums,List<Date> arrivaldates,List<String> payments)
	{
		System.out.println("************************"+requisitions.getId());
		List<Resgood> oldRgs=findResgoodsByRequisitionsid(requisitions.getId());
		this.delByObjects(oldRgs);
		this.saveResgoods(requisitions,itemtypes,unums,uprices,reqnums,arrivaldates,payments);
	}

}
