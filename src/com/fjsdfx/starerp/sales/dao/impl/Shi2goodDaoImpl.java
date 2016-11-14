package com.fjsdfx.starerp.sales.dao.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.fjsdfx.starerp.common.dao.BaseDaoImpl;
import com.fjsdfx.starerp.sales.model.Shi2good;
import com.fjsdfx.starerp.sales
.dao.Shi2goodDao;
@Component
public class Shi2goodDaoImpl extends BaseDaoImpl<Shi2good> implements Shi2goodDao{

	public List<Shi2good> getSameGeneralItemTypeStochgoods(Integer itemTypeId) {
		// TODO Auto-generated method stub
		return getHibernatetemplate().find("from Shi2good s where s.itemType.id = "+itemTypeId+" and s.itemType.bondedNo is null"); 
	}

	public List<Shi2good> getSameBondedItemTypeStochgoods(Integer itemTypeId) {
		// TODO Auto-generated method stub
		return getHibernatetemplate().find("from Shi2good s where s.itemType.id = "+itemTypeId+" and s.itemType.bondedNo is not null");
	}

}
