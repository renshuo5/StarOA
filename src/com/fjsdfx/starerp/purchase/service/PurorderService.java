package com.fjsdfx.starerp.purchase.service;

import java.util.List;

import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.purchase.model.Purorder;

public interface PurorderService extends BaseService<Purorder> {
	
    public List<Purorder> getAllPurorders();
	
	public List<Purorder> getPurordersByIds(List<Integer> ids);

}
