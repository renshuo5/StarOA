package com.fjsdfx.starerp.produce.service;

import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.produce.model.ProductionSchdul;


public interface ProductionSchdulService extends BaseService<ProductionSchdul> {
	public PagerModel getPreparationPager();
}
