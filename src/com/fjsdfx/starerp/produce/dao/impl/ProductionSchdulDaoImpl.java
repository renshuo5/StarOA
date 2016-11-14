package com.fjsdfx.starerp.produce.dao.impl;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.fjsdfx.starerp.common.dao.BaseDaoImpl;
import com.fjsdfx.starerp.produce.dao.ProductionSchdulDao;
import com.fjsdfx.starerp.produce.model.ProductionSchdul;

@Component
public class ProductionSchdulDaoImpl extends BaseDaoImpl<ProductionSchdul>implements ProductionSchdulDao{

	public HibernateTemplate getHibernateTemplate() {
		return super.getHibernatetemplate();
	}

}
