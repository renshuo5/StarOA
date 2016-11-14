package com.fjsdfx.starerp.purchase.dao;

import java.util.List;

import com.fjsdfx.starerp.common.dao.BaseDao;
import com.fjsdfx.starerp.purchase.model.Testnotes;

/**
 * @author Lu_Zhongchao
 *
 */
public interface TestnotesDao  extends BaseDao<Testnotes>{
	public List<Testnotes> getAllTestnotess();

}
