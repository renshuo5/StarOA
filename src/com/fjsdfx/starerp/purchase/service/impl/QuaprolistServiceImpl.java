package com.fjsdfx.starerp.purchase.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.purchase.model.Quaprolist;
import com.fjsdfx.starerp.purchase.service.QuaprolistService;

@Service
@Transactional
public class QuaprolistServiceImpl  extends BaseServiceImpl<Quaprolist> implements QuaprolistService{

}
