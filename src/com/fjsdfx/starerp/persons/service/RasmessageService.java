package com.fjsdfx.starerp.persons.service;

import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.persons.model.Rasmessage;

public interface RasmessageService extends BaseService<Rasmessage> {
 
	public String getMessg(int id);
}
