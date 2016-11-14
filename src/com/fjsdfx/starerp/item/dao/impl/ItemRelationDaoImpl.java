package com.fjsdfx.starerp.item.dao.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.fjsdfx.starerp.common.dao.BaseDaoImpl;
import com.fjsdfx.starerp.item.dao.ItemRelationDao;
import com.fjsdfx.starerp.item.model.ItemRelation;

@Component
public class ItemRelationDaoImpl  extends BaseDaoImpl<ItemRelation> implements ItemRelationDao{

	public List<ItemRelation> getAllItemRelations() {
		return super.getHibernatetemplate().find("from ItemRelation");
	}

	public List<ItemRelation> findRelationsByItemTypeId(Integer itemTypeId) {
		return super.getHibernatetemplate().find("from ItemRelation ir where ir.pitem.id = "+itemTypeId);
	}

	public List<ItemRelation> findByItemTypeId(Integer itemTypeId) {
		return super.getHibernatetemplate().find("from ItemRelation ir where ir.pitem.id = "+itemTypeId);
	}
	public Integer getNumByItemTypeId(Integer itemTypeId) {
		Long number = (Long) super.getHibernatetemplate().find("select count(*) from ItemRelation ir where ir.pitem.id = "+itemTypeId).get(0);
		return new Integer(number.intValue());
	}

	public List<ItemRelation> findPitemByPartId(Integer partId) {
		return getHibernatetemplate().find("from ItemRelation ir where ir.part.id = "+partId);
	}
}
