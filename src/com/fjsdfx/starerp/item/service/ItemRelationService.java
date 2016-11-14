package com.fjsdfx.starerp.item.service;

import java.util.List;

import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.item.model.ControllerunitInfo;
import com.fjsdfx.starerp.item.model.ItemRelation;
import com.fjsdfx.starerp.item.model.ItemType;

public interface ItemRelationService  extends BaseService<ItemRelation>{
	
	public void saveRelation(ItemType pitem,ItemType part,Integer amount,Integer isCon,ControllerunitInfo controllerunit);
	public void saveRelations(ItemType item,List<Integer> partids,List<Integer> amounts, List<Integer> isCons,
			List<ControllerunitInfo> controllerunits);
	public List<ItemRelation> findRelationsByPitemid(Integer pitemid);
	public void delByObjects(List<ItemRelation> irs);
	public void update(ItemType pitem,List<Integer> partids,List<Integer> amounts, List<Integer> isCons,
			List<ControllerunitInfo> controllerunits);
	public List<ItemRelation> getAllItemRelations();
	public List<ItemRelation> findByItemTypeId(Integer itemTypeId);
	public void saveitemType(ItemType itemType,Integer siemid,List<Integer> partids,List<Integer> amounts, List<Integer> isCons, List<ControllerunitInfo> controllerunits);
	public void updateitemType(ItemType itemType,Integer siemid,List<Integer> partids,List<Integer> amounts, List<Integer> isCons,
			List<ControllerunitInfo> controllerunits);
	public List<ItemRelation> findPitemByPartId(Integer partId);
}
