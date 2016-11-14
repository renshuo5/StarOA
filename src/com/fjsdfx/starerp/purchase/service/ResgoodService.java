package com.fjsdfx.starerp.purchase.service;

import java.util.Date;
import java.util.List;

import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.model.ItemRelation;
import com.fjsdfx.starerp.purchase.model.Resgood;
import com.fjsdfx.starerp.purchase.model.Requisitions;

public interface ResgoodService extends BaseService<Resgood> {
	public void saveResgood(Requisitions requisitions,ItemType itemtype,Integer unum,Float uprice,Integer reqnum,Date arrivaldate,String payment);
	public void saveResgoods(Requisitions requisitions,List<ItemType> itemtypes,List<Integer> unums,List<Float> uprices,List<Integer> reqnums,List<Date> arrivaldates,List<String> payments);
	public List<Resgood> findResgoodsByRequisitionsid(Integer requisitionsid);
	public void delByObjects(List<Resgood> rgs);
	public void update(Requisitions requisitions,List<ItemType> itemtypes,List<Integer> unums,List<Float> uprices,List<Integer> reqnums,List<Date> arrivaldates,List<String> payments);

}
