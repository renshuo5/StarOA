package com.fjsdfx.starerp.sales.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.sales.model.Shi1good;
import com.fjsdfx.starerp.sales.model.Shippingnote1;
import com.fjsdfx.starerp.sales.service.Shi1goodService;
import com.fjsdfx.starerp.sales.service.Shippingnote1Service;
import com.fjsdfx.starerp.warehouse.service.MaccountingService;
import com.fjsdfx.starerp.warehouse.service.StockService;


@Service
@Transactional
public class Shippingnote1ServiceImpl  extends BaseServiceImpl<Shippingnote1>  implements Shippingnote1Service{


}
