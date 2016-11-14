package com.fjsdfx.starerp.warehouse.dao;

import java.util.Date;

import com.fjsdfx.starerp.common.dao.BaseDao;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.warehouse.model.Maccounting;

public interface MaccountingDao extends BaseDao<Maccounting>{

	public void addEnNumber(Date date, ItemType itemType,String whname, Integer num)throws Exception;
	
	public void addOutNumber(Date date, ItemType itemType, Integer num)throws Exception;

	public void setStonum();
}
