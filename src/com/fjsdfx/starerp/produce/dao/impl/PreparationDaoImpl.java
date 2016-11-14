package com.fjsdfx.starerp.produce.dao.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.fjsdfx.starerp.common.dao.BaseDaoImpl;
import com.fjsdfx.starerp.produce.dao.PreparationDao;
import com.fjsdfx.starerp.produce.model.Pergood;
import com.fjsdfx.starerp.produce.model.Preparation;

@Component
public class PreparationDaoImpl extends BaseDaoImpl<Preparation> implements PreparationDao {

	public List<Pergood> getAllPergoods(Preparation p) {
		return super.getHibernatetemplate().find("from Pergood p where p.preparation.id = "+p.getId());
	}
	
}
