package com.fjsdfx.starerp.produce.service;

import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.item.model.Item;
import com.fjsdfx.starerp.item.model.ItemType;

import com.fjsdfx.starerp.produce.model.Repairproduction;

public interface RepairproductionService extends BaseService<Repairproduction> {
	public Repairproduction saveOrUpdate(Repairproduction repairproduction);
	//public Repairproduction update(Repairproduction repairproduction);
}
