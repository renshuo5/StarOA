package com.fjsdfx.starerp.warehouse.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.dao.BaseDaoImpl;
import com.fjsdfx.starerp.warehouse.dao.Susgood3Dao;
import com.fjsdfx.starerp.warehouse.model.Susgood3;

@Component
@Transactional
public class Susgood3DaoImpl extends BaseDaoImpl<Susgood3> implements Susgood3Dao {
	public List<Susgood3> getSusgood3sBySupsendm3Id(Integer supsendm3Id) {
		return getHibernatetemplate().find("from Susgood3 s where s.isExtra!=1 and s.supsendm3.id="+supsendm3Id);
	}
}
