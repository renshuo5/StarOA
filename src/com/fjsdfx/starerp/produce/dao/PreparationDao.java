package com.fjsdfx.starerp.produce.dao;

import java.util.List;

import com.fjsdfx.starerp.common.dao.BaseDao;
import com.fjsdfx.starerp.produce.model.Pergood;
import com.fjsdfx.starerp.produce.model.Preparation;

public interface PreparationDao extends BaseDao<Preparation> {
	public List<Pergood> getAllPergoods(Preparation p);
}
