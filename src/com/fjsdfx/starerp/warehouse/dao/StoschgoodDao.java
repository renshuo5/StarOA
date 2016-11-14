package com.fjsdfx.starerp.warehouse.dao;

import java.util.List;

import com.fjsdfx.starerp.common.dao.BaseDao;
import com.fjsdfx.starerp.warehouse.model.Stoschgood;

public interface StoschgoodDao extends BaseDao<Stoschgood>{
	public List<Stoschgood> getSameGeneralItemTypeStochgoods(Integer itemTypeId);

	public List<Stoschgood> getSameBondedItemTypeStochgoods(Integer id);

	public List<Stoschgood> getSameItemTypeStochgoods(Integer itemTypeId);
}
