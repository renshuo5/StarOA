package com.fjsdfx.starerp.produce.dao;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.fjsdfx.starerp.common.dao.BaseDao;
import com.fjsdfx.starerp.produce.model.ProductionSchdul;

public interface ProductionSchdulDao extends BaseDao<ProductionSchdul> {

	public HibernateTemplate getHibernateTemplate();
	
}
