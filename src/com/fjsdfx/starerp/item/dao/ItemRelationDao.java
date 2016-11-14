package com.fjsdfx.starerp.item.dao;

import java.util.List;

import com.fjsdfx.starerp.common.dao.BaseDao;
import com.fjsdfx.starerp.item.model.ItemRelation;

public interface ItemRelationDao extends BaseDao<ItemRelation>{
	public List<ItemRelation> getAllItemRelations();
	public List<ItemRelation> findRelationsByItemTypeId(Integer itemTypeId);
	public List<ItemRelation> findByItemTypeId(Integer itemTypeId);
	public Integer getNumByItemTypeId(Integer itemTypeId);
	public List<ItemRelation> findPitemByPartId(Integer partId);
}
