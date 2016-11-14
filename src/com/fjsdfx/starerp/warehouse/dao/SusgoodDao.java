package com.fjsdfx.starerp.warehouse.dao;

import java.util.List;

import com.fjsdfx.starerp.common.dao.BaseDao;
import com.fjsdfx.starerp.warehouse.model.Susgood;

public interface SusgoodDao extends BaseDao<Susgood> {
	public List<Susgood> getSusgoodsBySupsendmId(Integer supsendmId);
	public void deleteBySupsendmId(Integer supsendmId);
}
