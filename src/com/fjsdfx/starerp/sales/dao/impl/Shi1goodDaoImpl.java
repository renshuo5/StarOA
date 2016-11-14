package com.fjsdfx.starerp.sales.dao.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.fjsdfx.starerp.common.dao.BaseDaoImpl;
import com.fjsdfx.starerp.sales.model.Shi1good;
import com.fjsdfx.starerp.sales
.dao.Shi1goodDao;
@Component
public class Shi1goodDaoImpl extends BaseDaoImpl<Shi1good> implements Shi1goodDao{

	public List<Shi1good> getSameGeneralItemTypeStochgoods(Integer itemTypeId) {
		// TODO Auto-generated method stub
		return getHibernatetemplate().find("from Shi1good s where s.itemType.id = "+itemTypeId+" and s.itemType.bondedNo is null");
	}

	public List<Shi1good> getSameBondedItemTypeStochgoods(Integer itemTypeId) {
		// TODO Auto-generated method stub
		return getHibernatetemplate().find("from Shi1good s where s.itemType.id = "+itemTypeId+" and s.itemType.bondedNo is not null");
	}

}
