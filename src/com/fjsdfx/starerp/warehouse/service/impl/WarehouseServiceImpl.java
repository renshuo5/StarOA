package com.fjsdfx.starerp.warehouse.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.warehouse.model.Warehouse;
import com.fjsdfx.starerp.warehouse.service.WarehouseService;

@Service
@Transactional
public class WarehouseServiceImpl  extends BaseServiceImpl<Warehouse> implements WarehouseService{

}
