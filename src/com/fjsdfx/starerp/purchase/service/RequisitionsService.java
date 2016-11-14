package com.fjsdfx.starerp.purchase.service;

import java.util.List;

import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.item.model.Item;
import com.fjsdfx.starerp.purchase.model.Requisitions;

public interface RequisitionsService extends BaseService<Requisitions> {
	
    public List<Requisitions> getAllRequisitionss();
	
	public List<Requisitions> getRequisitionssByIds(List<Integer> ids);

}
