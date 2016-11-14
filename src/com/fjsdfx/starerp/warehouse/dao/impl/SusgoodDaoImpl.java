package com.fjsdfx.starerp.warehouse.dao.impl;

import java.util.List;

import javax.annotation.Resource;


import org.springframework.stereotype.Component;

import com.fjsdfx.starerp.common.dao.BaseDaoImpl;
import com.fjsdfx.starerp.warehouse.dao.StockDao;
import com.fjsdfx.starerp.warehouse.dao.SusgoodDao;
import com.fjsdfx.starerp.warehouse.model.Susgood;

@Component
public class SusgoodDaoImpl extends BaseDaoImpl<Susgood> implements SusgoodDao {
	
	private StockDao stockDao;
	
	public StockDao getStockDao() {
		return stockDao;
	}

	@Resource
	public void setStockDao(StockDao stockDao) {
		this.stockDao = stockDao;
	}

	public List<Susgood> getSusgoodsBySupsendmId(Integer supsendmId) {
		return super.getHibernatetemplate().find("from Susgood s where s.supsendm.sus_id = "+supsendmId);
	}

	public void deleteBySupsendmId(Integer supsendmId) {
		List<Susgood> susgoods = getSusgoodsBySupsendmId(supsendmId);
		System.out.println("susgoods's size = "+susgoods.size());
		for(Susgood s:susgoods)
		{
			delete(s);
			try {
				stockDao.addNumber(s.getItemType(),stockDao.getWhnameByItemTypeId(s.getItemType().getId()), s.getSingleset());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
}
