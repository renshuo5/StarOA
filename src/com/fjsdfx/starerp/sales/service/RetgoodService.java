package com.fjsdfx.starerp.sales.service;

import java.util.List;

import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.sales.model.Retgood;
import com.fjsdfx.starerp.sales.model.Returned;
import com.fjsdfx.starerp.sales.model.Shippingnote1;

public interface RetgoodService extends BaseService<Retgood> {


    public void saveretgoods(Returned returned , List<Integer> itemTypeIds, List<Integer> retnos);
	
	public void updateretgoods(Returned returned , List<Integer> itemTypeIds, List<Integer> retnos);

	public void deleteregoods(List<Retgood> retgoods);

	public void delall(Integer returnedId);
	
}
