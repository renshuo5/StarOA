package com.fjsdfx.starerp.purchase.dao.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.fjsdfx.starerp.common.dao.BaseDaoImpl;
import com.fjsdfx.starerp.purchase.dao.TestnotesDao;
import com.fjsdfx.starerp.purchase.model.Testnotes;
@Component
public class TestnotesDaoImpl extends BaseDaoImpl<Testnotes> implements TestnotesDao{
	
	public List<Testnotes> getAllTestnotess()
	{
		return super.getHibernatetemplate().find("from Testnotes");
	}

}
