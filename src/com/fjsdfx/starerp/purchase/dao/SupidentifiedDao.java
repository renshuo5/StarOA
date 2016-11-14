package com.fjsdfx.starerp.purchase.dao;

import java.util.List;

import com.fjsdfx.starerp.common.dao.BaseDao;
import com.fjsdfx.starerp.purchase.model.Supidentified;

/**
 * @author Lu_Zhongchao
 *
 */
public interface SupidentifiedDao extends BaseDao<Supidentified>{
	public List<Supidentified> getAllSupidentifieds();

}
