package com.fjsdfx.starerp.warehouse.dao.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.fjsdfx.starerp.common.dao.BaseDaoImpl;
import com.fjsdfx.starerp.warehouse.dao.PicgoodDao;
import com.fjsdfx.starerp.warehouse.model.Picgood;

@Component
public class PicgoodDaoImpl extends BaseDaoImpl<Picgood> implements PicgoodDao{

	public List<Picgood> getSameGeneralItemTypeStochgoods(Integer itemTypeId) {
		// TODO Auto-generated method stub
		return getHibernatetemplate().find("from Picgood s where s.itemType.id = "+itemTypeId+" and s.itemType.bondedNo is null"); 
	}

	public List<Picgood> getSameBondedItemTypeStochgoods(Integer itemTypeId) {
		// TODO Auto-generated method stub
		return getHibernatetemplate().find("from Picgood s where s.itemType.id = "+itemTypeId+" and s.itemType.bondedNo is not null");
	}

	public List<Picgood> getSameItemTypeStochgoods(Integer itemTypeId) {
		// TODO Auto-generated method stub
		return getHibernatetemplate().find("from Picgood s where s.itemType.id = "+itemTypeId);
	}

}
