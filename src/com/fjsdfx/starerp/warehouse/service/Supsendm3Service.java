package com.fjsdfx.starerp.warehouse.service;

import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.warehouse.model.Supsendm3;

public interface Supsendm3Service extends BaseService<Supsendm3> {
	public Supsendm3 saveByPreparationId(Supsendm3 supsendm3,Integer id);
	public void deleteSupsendm3(Supsendm3 supsendm3);
	public void updateSupsendm3(Supsendm3 supsendm3);
}
