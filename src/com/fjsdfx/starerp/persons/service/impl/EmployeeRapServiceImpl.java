package com.fjsdfx.starerp.persons.service.impl;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.persons.model.EmployeeRap;
import com.fjsdfx.starerp.persons.service.EmployeeRapService;

@Service      //注入到spring的IOC
@Transactional    
public class EmployeeRapServiceImpl  extends BaseServiceImpl<EmployeeRap> implements EmployeeRapService{

}
