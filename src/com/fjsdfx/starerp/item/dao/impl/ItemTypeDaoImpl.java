package com.fjsdfx.starerp.item.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.fjsdfx.starerp.common.dao.BaseDaoImpl;

import com.fjsdfx.starerp.item.dao.ItemTypeDao;

import com.fjsdfx.starerp.item.model.ItemType;
@Component
public class ItemTypeDaoImpl extends BaseDaoImpl<ItemType> implements ItemTypeDao {
	public List<ItemType> getAllItemTypes() {
		return super.getHibernatetemplate().find("from ItemType");
	}

	public List<ItemType> findByItemTypeId(Integer itemTypeId) {
		return super.getHibernatetemplate().find("from ItemType itemType where itemType.id="+itemTypeId);
	}

	public List<ItemType> findByItemId(Integer itemid) {
		return super.getHibernatetemplate().find("from ItemType itemType where itemType.item.id="+itemid);
	}
}
