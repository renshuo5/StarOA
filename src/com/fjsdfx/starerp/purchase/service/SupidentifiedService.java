package com.fjsdfx.starerp.purchase.service;

import java.util.List;

import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.purchase.model.Supidentified;

public interface SupidentifiedService extends BaseService<Supidentified> {
	
    public List<Supidentified> getAllSupidentifieds();
	
	public List<Supidentified> getSupidentifiedsByIds(List<Integer> ids);

}
