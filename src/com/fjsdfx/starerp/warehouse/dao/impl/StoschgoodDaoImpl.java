package com.fjsdfx.starerp.warehouse.dao.impl;

import java.util.List;

import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.stereotype.Component;

import com.fjsdfx.starerp.common.dao.BaseDaoImpl;
import com.fjsdfx.starerp.warehouse.dao.StockDao;
import com.fjsdfx.starerp.warehouse.dao.StoschgoodDao;
import com.fjsdfx.starerp.warehouse.model.Stoschgood;

@Component
public class StoschgoodDaoImpl extends BaseDaoImpl<Stoschgood> implements StoschgoodDao{

	public List<Stoschgood> getSameGeneralItemTypeStochgoods(Integer itemTypeId) {
		return getHibernatetemplate().find("from Stoschgood s where s.itemType.id = "+itemTypeId);
	}

	public List<Stoschgood> getSameBondedItemTypeStochgoods(Integer itemTypeId) {
		// TODO Auto-generated method stub
		return getHibernatetemplate().find("from Stoschgood s where s.itemType.id="+itemTypeId+" and s.itemType.bondedNo is not null");
	}

	public List<Stoschgood> getSameItemTypeStochgoods(Integer itemTypeId) {
		// TODO Auto-generated method stub
		return getHibernatetemplate().find("from Stoschgood s where s.itemType.id = "+itemTypeId);
	}

}
