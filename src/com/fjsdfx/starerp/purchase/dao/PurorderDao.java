package com.fjsdfx.starerp.purchase.dao;

import java.util.List;

import com.fjsdfx.starerp.common.dao.BaseDao;
import com.fjsdfx.starerp.purchase.model.Purorder;

/**
 * @author Lu_Zhongchao
 *
 */
public interface PurorderDao  extends BaseDao<Purorder>{
	public List<Purorder> getAllPurorders();

}
