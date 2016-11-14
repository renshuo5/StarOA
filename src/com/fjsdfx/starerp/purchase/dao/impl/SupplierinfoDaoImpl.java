package com.fjsdfx.starerp.purchase.dao.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.fjsdfx.starerp.common.dao.BaseDaoImpl;
import com.fjsdfx.starerp.purchase.dao.SupplierinfoDao;
import com.fjsdfx.starerp.purchase.model.Supplierinfo;
@Component
public class SupplierinfoDaoImpl extends BaseDaoImpl<Supplierinfo> implements SupplierinfoDao{
	
	public List<Supplierinfo> getAllSupplierinfos()
	{
		return super.getHibernatetemplate().find("from Supplierinfo");
	}

}
