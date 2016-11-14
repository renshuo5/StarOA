package com.fjsdfx.starerp.produce.service;

import java.util.List;

import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.produce.model.Pergood;

public interface PergoodService extends BaseService<Pergood> {
	public List<Pergood> getPergoods(Integer preparationId);
	public Pergood getPergoodByItemTypeId(Integer itemTypeId) throws Exception;
}
