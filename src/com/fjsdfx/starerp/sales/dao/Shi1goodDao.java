package com.fjsdfx.starerp.sales.dao;

import java.util.List;

import com.fjsdfx.starerp.common.dao.BaseDao;
import com.fjsdfx.starerp.sales.model.Shi1good;


public interface Shi1goodDao  extends BaseDao<Shi1good>{

	public List<Shi1good> getSameGeneralItemTypeStochgoods(Integer itemTypeId);

	public List<Shi1good> getSameBondedItemTypeStochgoods(Integer itemTypeId);

}
