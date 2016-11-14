package com.fjsdfx.starerp.purchase.dao.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.fjsdfx.starerp.common.dao.BaseDaoImpl;
import com.fjsdfx.starerp.purchase.dao.SpareDao;
import com.fjsdfx.starerp.purchase.model.Spare;
@Component
public class SpareDaoImpl extends BaseDaoImpl<Spare> implements SpareDao{
	
	public List<Spare> getAllSpares()
	{
		return super.getHibernatetemplate().find("from Spare");
	}

}
