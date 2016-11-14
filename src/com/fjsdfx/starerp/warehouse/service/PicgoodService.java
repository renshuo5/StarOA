package com.fjsdfx.starerp.warehouse.service;

import java.util.Date;
import java.util.List;

import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.security.model.User;
import com.fjsdfx.starerp.warehouse.model.Picgood;
import com.fjsdfx.starerp.warehouse.model.Requisition;

public interface PicgoodService extends BaseService<Picgood>{

	public void savepicgoods(Requisition requisition, List<Integer> itemTypeIds,
			List<String> calunits, List<Integer> reqnums, List<Float> ruprices,
			List<String> userfs);

	public void updatepicgoods(Requisition requisition,
			List<Integer> itemTypeIds, List<String> calunits,
			List<Integer> reqnums, List<Float> ruprices, List<Float> rprices,
			List<String> userfs);

	public void delpicgoods(Integer requisitionId);

	public void examine(Integer requisitionId, List<Integer> factnums,
			User confirmper, Date deliverDate);
	

}
