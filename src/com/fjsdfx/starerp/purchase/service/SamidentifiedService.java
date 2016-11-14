package com.fjsdfx.starerp.purchase.service;

import java.util.List;

import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.purchase.model.Samidentified;

public interface SamidentifiedService extends BaseService<Samidentified> {
	
    public List<Samidentified> getAllSamidentifieds();
	
	public List<Samidentified> getSamidentifiedsByIds(List<Integer> ids);

}
