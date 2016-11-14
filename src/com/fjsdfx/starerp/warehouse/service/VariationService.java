package com.fjsdfx.starerp.warehouse.service;

import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.warehouse.model.Vargood;
import com.fjsdfx.starerp.warehouse.model.Variation;

public interface VariationService extends BaseService<Variation> {
	public void save(Variation variation,Vargood vargood);
	public void updateByAudit(Integer var_id,Integer quaadvice,String quanote);
}
