package com.fjsdfx.starerp.purchase.dao;

import java.util.List;

import com.fjsdfx.starerp.common.dao.BaseDao;
import com.fjsdfx.starerp.purchase.model.Requisitions;

/**
 * @author Lu_Zhongchao
 *
 */
public interface RequisitionsDao  extends BaseDao<Requisitions>{
	public List<Requisitions> getAllRequisitionss();

}
