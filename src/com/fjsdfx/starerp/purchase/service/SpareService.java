package com.fjsdfx.starerp.purchase.service;

import java.util.List;

import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.item.model.Item;
import com.fjsdfx.starerp.purchase.model.Spare;

public interface SpareService extends BaseService<Spare> {
	
    public List<Spare> getAllSpares();
	
	public List<Spare> getSparesByIds(List<Integer> ids);

}
