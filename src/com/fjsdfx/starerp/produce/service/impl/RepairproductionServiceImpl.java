package com.fjsdfx.starerp.produce.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;


import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.item.model.ItemRelation;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.produce.dao.RepairproductionDao;
import com.fjsdfx.starerp.produce.model.Repairproduction;
import com.fjsdfx.starerp.produce.service.RepairproductionService;

@Service
@Transactional
public class RepairproductionServiceImpl  extends BaseServiceImpl<Repairproduction> implements RepairproductionService{
private RepairproductionDao repairproductionDao;

public RepairproductionDao getRepairproductionDao() {
	return repairproductionDao;
}

public void setRepairproductionDao(RepairproductionDao repairproductionDao) {
	this.repairproductionDao = repairproductionDao;
}
public Repairproduction saveOrUpdate(Repairproduction repairproduction)
{
//    if(null == repairproduction.getItemType().getName()||"".equals(repairproduction.getItemType().getName()))
//    {
//		repairproduction.setItemType(repairproduction.getItemType());
//    }
//    if(null == repairproduction.getPno()||"".equals(repairproduction.getPno()))
//    {
//    	repairproduction.setPno(null);
//    }

    return super.save(repairproduction);
}


}
