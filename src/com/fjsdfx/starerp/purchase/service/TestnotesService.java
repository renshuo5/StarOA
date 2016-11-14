package com.fjsdfx.starerp.purchase.service;

import java.util.List;

import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.purchase.model.Testnotes;

public interface TestnotesService extends BaseService<Testnotes> {
	
    public List<Testnotes> getAllTestnotess();
	
	public List<Testnotes> getTestnotessByIds(List<Integer> ids);

}
