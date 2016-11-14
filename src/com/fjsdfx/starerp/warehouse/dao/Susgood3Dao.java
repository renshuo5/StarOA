package com.fjsdfx.starerp.warehouse.dao;

import java.util.List;

import com.fjsdfx.starerp.common.dao.BaseDao;
import com.fjsdfx.starerp.warehouse.model.Susgood3;

public interface Susgood3Dao extends BaseDao<Susgood3> {
	public List<Susgood3> getSusgood3sBySupsendm3Id(Integer supsendm3Id);
}
