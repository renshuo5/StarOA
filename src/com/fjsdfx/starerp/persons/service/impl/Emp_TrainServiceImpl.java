package com.fjsdfx.starerp.persons.service.impl;



import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.persons.model.Emp_Train;
import com.fjsdfx.starerp.persons.service.Emp_TrainService;

@Service      //注入到spring的IOC
@Transactional    
public class Emp_TrainServiceImpl  extends BaseServiceImpl<Emp_Train> implements Emp_TrainService{

}
