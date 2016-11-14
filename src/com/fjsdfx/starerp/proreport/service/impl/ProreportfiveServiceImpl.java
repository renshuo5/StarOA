package com.fjsdfx.starerp.proreport.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.proreport.model.Proreportfive;
import com.fjsdfx.starerp.proreport.service.ProreportfiveService;

@Service      //注入到spring的IOC
@Transactional    

public class ProreportfiveServiceImpl extends BaseServiceImpl<Proreportfive> implements ProreportfiveService{

}