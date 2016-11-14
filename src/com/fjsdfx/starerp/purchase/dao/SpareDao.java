package com.fjsdfx.starerp.purchase.dao;

import java.util.List;

import com.fjsdfx.starerp.common.dao.BaseDao;
import com.fjsdfx.starerp.purchase.model.Spare;
import com.fjsdfx.starerp.purchase.model.Supplierinfo;

/**
 * @author Lu_Zhongchao
 *
 */
public interface SpareDao extends BaseDao<Spare>{
	public List<Spare> getAllSpares();

}
