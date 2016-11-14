package com.fjsdfx.starerp.sales.dao;

import java.util.List;

import com.fjsdfx.starerp.common.dao.BaseDao;
import com.fjsdfx.starerp.sales.model.Shi2good;


public interface Shi2goodDao  extends BaseDao<Shi2good>{

	public List<Shi2good> getSameGeneralItemTypeStochgoods(Integer itemTypeId);

	public List<Shi2good> getSameBondedItemTypeStochgoods(Integer itemTypeId);

}

