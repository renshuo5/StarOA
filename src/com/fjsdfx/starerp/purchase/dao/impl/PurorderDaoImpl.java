package com.fjsdfx.starerp.purchase.dao.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.fjsdfx.starerp.common.dao.BaseDaoImpl;
import com.fjsdfx.starerp.purchase.dao.PurorderDao;
import com.fjsdfx.starerp.purchase.model.Purorder;
@Component
public class PurorderDaoImpl extends BaseDaoImpl<Purorder> implements PurorderDao{
	
	public List<Purorder> getAllPurorders()
	{
		return super.getHibernatetemplate().find("from Purorder");
	}

}
