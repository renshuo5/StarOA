package com.fjsdfx.starerp.proreport.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.proreport.model.Proreportthree;
import com.fjsdfx.starerp.proreport.service.ProreportthreeService;

@Service      //注入到spring的IOC
@Transactional    

public class ProreportthreeServiceImpl extends BaseServiceImpl<Proreportthree> implements ProreportthreeService{

}