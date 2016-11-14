package com.fjsdfx.starerp.persons.service.impl;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.persons.model.Jobs;
import com.fjsdfx.starerp.persons.service.JobsService;

@Service      //注入到spring的IOC
@Transactional    

public class JobsServiceImpl extends BaseServiceImpl<Jobs> implements JobsService{

}
