package com.fjsdfx.starerp.sales.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.sales.model.Unqualified;
import com.fjsdfx.starerp.sales.service.UnqualifiedService;


@Service
@Transactional
public class UnqualifiedServiceImpl  extends BaseServiceImpl<Unqualified>  implements UnqualifiedService{

}
