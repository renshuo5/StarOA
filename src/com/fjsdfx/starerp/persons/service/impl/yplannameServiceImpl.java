package com.fjsdfx.starerp.persons.service.impl;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.persons.model.yplanname;
import com.fjsdfx.starerp.persons.service.yplannameService;

@Service      //注入到spring的IOC
@Transactional    

public class yplannameServiceImpl extends BaseServiceImpl<yplanname> implements yplannameService{

}
