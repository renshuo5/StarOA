package com.fjsdfx.starerp.warehouse.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.common.dao.BaseDaoImpl;
import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.item.service.ItemTypeService;
import com.fjsdfx.starerp.warehouse.action.RequisitionAction;
import com.fjsdfx.starerp.warehouse.model.Picgood;
import com.fjsdfx.starerp.warehouse.model.Requisition;
import com.fjsdfx.starerp.warehouse.service.InventoryService;
import com.fjsdfx.starerp.warehouse.service.MaccountingService;
import com.fjsdfx.starerp.warehouse.service.PicgoodService;
import com.fjsdfx.starerp.warehouse.service.RequisitionService;
import com.fjsdfx.starerp.warehouse.service.StockService;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;

@Service
@Transactional
public class RequisitionServiceImpl extends BaseServiceImpl<Requisition> implements RequisitionService{

private List<String> calunits;
	


}
