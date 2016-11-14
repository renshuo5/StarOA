package com.fjsdfx.starerp.purchase.service;

import java.util.List;

import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.item.model.Item;
import com.fjsdfx.starerp.purchase.model.Supplierinfo;

public interface SupplierinfoService extends BaseService<Supplierinfo> {
	
    public List<Supplierinfo> getAllSupplierinfos();
	
	public List<Supplierinfo> getSupplierinfosByIds(List<Integer> ids);

}
