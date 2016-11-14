package com.fjsdfx.starerp.produce.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.produce.model.Accredition;
import com.fjsdfx.starerp.produce.service.AccreditionService;

@Service
@Transactional
public class AccreditionServiceImpl extends BaseServiceImpl<Accredition> implements AccreditionService {

}
