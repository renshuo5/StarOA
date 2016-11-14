package com.fjsdfx.starerp.warehouse.service;

import java.util.Date;

import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.warehouse.model.Maccounting;

public interface MaccountingService extends BaseService<Maccounting>{

	public void addEnNumber(Date date, ItemType itemType,String whname, Integer num);
	
	public void addOutNumber(Date date , ItemType itemType, Integer num);

	public void setstonum();
}
