package com.fjsdfx.starerp.warehouse.service;

import java.util.List;

import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.warehouse.model.Feedexamine;
import com.fjsdfx.starerp.warehouse.model.Feegood;

public interface FeegoodService extends BaseService<Feegood>{

	public void savefeegoods(Feedexamine feedexamine, List<Integer> bsnos,
			List<Integer> itemTypeIds, List<Integer> fpnums,
			List<String> fnotes);

	public void updatefeegoods(Feedexamine feedexamine,List<Integer> bsnos, List<Integer> itemTypeIds,
			List<Integer> fpnums, List<String> fnotes);


}

