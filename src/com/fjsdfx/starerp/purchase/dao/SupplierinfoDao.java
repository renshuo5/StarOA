package com.fjsdfx.starerp.purchase.dao;

import java.util.List;

import com.fjsdfx.starerp.common.dao.BaseDao;
import com.fjsdfx.starerp.item.model.Item;
import com.fjsdfx.starerp.purchase.model.Supplierinfo;

/**
 * @author Lu_Zhongchao
 *
 */
public interface SupplierinfoDao  extends BaseDao<Supplierinfo>{
	public List<Supplierinfo> getAllSupplierinfos();

}
