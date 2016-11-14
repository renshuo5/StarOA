package com.fjsdfx.starerp.purchase.dao.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.fjsdfx.starerp.common.dao.BaseDaoImpl;
import com.fjsdfx.starerp.purchase.dao.SamidentifiedDao;
import com.fjsdfx.starerp.purchase.model.Samidentified;
@Component
public class SamidentifiedDaoImpl extends BaseDaoImpl<Samidentified> implements SamidentifiedDao{
	
	public List<Samidentified> getAllSamidentifieds()
	{
		return super.getHibernatetemplate().find("from Samidentified");
	}

}
