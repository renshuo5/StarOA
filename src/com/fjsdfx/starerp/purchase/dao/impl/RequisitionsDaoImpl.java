package com.fjsdfx.starerp.purchase.dao.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.fjsdfx.starerp.common.dao.BaseDaoImpl;
import com.fjsdfx.starerp.purchase.dao.RequisitionsDao;
import com.fjsdfx.starerp.purchase.model.Requisitions;
@Component
public class RequisitionsDaoImpl extends BaseDaoImpl<Requisitions> implements RequisitionsDao{
	
	public List<Requisitions> getAllRequisitionss()
	{
		return super.getHibernatetemplate().find("from Requisitions");
	}

}
