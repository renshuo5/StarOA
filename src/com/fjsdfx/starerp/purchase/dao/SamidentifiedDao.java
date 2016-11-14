package com.fjsdfx.starerp.purchase.dao;

import java.util.List;

import com.fjsdfx.starerp.common.dao.BaseDao;
import com.fjsdfx.starerp.purchase.model.Samidentified;

/**
 * @author Lu_Zhongchao
 *
 */
public interface SamidentifiedDao  extends BaseDao<Samidentified>{
	public List<Samidentified> getAllSamidentifieds();

}
