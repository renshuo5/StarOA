package com.fjsdfx.starerp.warehouse.dao;

import java.util.List;

import com.fjsdfx.starerp.common.dao.BaseDao;
import com.fjsdfx.starerp.warehouse.model.Picgood;

public interface PicgoodDao extends BaseDao<Picgood>{

	public List<Picgood> getSameGeneralItemTypeStochgoods(Integer itemTypeId);

	public List<Picgood> getSameBondedItemTypeStochgoods(Integer itemTypeId);

	public List<Picgood> getSameItemTypeStochgoods(Integer itemTypeId);

}
