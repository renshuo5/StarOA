package com.fjsdfx.starerp.sales.service;

import java.util.Date;
import java.util.List;

import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.sales.model.Unqmessage;
import com.fjsdfx.starerp.sales.model.Unqualified;

public interface UnqmessageService extends BaseService<Unqmessage> {

	void deleteunqmessages(List<Unqmessage> unqmessages);

	void saveunqumessages(Unqualified unqualified,
			List<String> unmcode, List<String> unmstatus, List<Date> fdate,
			List<String> bdepartment);

}
