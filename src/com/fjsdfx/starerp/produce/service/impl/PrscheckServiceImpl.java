package com.fjsdfx.starerp.produce.service.impl;



import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.item.dao.ItemDao;
import com.fjsdfx.starerp.item.model.Item;
import com.fjsdfx.starerp.produce.dao.PrscheckDao;
import com.fjsdfx.starerp.produce.model.Prscheck;
import com.fjsdfx.starerp.produce.service.PrscheckService;

@Service
@Transactional
public class PrscheckServiceImpl extends BaseServiceImpl<Prscheck> implements PrscheckService {

}
