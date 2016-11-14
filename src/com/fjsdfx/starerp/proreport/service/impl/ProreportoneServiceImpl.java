package com.fjsdfx.starerp.proreport.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.proreport.model.Proreportone;
import com.fjsdfx.starerp.proreport.service.ProreportoneService;

@Service      //注入到spring的IOC
@Transactional    

public class ProreportoneServiceImpl extends BaseServiceImpl<Proreportone> implements ProreportoneService{

}