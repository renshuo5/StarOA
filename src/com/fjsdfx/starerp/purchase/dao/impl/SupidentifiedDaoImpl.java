package com.fjsdfx.starerp.purchase.dao.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.fjsdfx.starerp.common.dao.BaseDaoImpl;
import com.fjsdfx.starerp.purchase.dao.SupidentifiedDao;
import com.fjsdfx.starerp.purchase.model.Supidentified;
@Component
public class SupidentifiedDaoImpl extends BaseDaoImpl<Supidentified> implements SupidentifiedDao{
	
	public List<Supidentified> getAllSupidentifieds()
	{
		return super.getHibernatetemplate().find("from Supidentified");
	}

}
