package com.fjsdfx.starerp.warehouse.dao.impl;

import java.util.List;

import org.hibernate.dialect.IngresDialect;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.fjsdfx.starerp.common.dao.BaseDaoImpl;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.warehouse.dao.StockDao;
import com.fjsdfx.starerp.warehouse.model.Stock;
import com.fjsdfx.starerp.warehouse.model.Stoschgood;

@Component
public class StockDaoImpl extends BaseDaoImpl<Stock> implements StockDao {

	public void deleleAllStocks() {
		HibernateTemplate hibernateTemplate = super.getHibernatetemplate();
		List<Stock> stocks = this.getAllStocks();
		for (Stock s : stocks) {
			hibernateTemplate.delete(s);
		}
	}

	@SuppressWarnings("unchecked")
	public List<Stock> getAllStocks() {
		HibernateTemplate hibernateTemplate = getHibernatetemplate();
		List<Stock> stocks = hibernateTemplate.find("from Stock");
		return stocks;
	}

	public void addNumber(ItemType itemType, String whname, Integer num)
			throws Exception {
		if (itemType != null && whname != null && num != null) {
			HibernateTemplate hibernateTemplate = getHibernatetemplate();
			if (!(hibernateTemplate.find(
					"from Stock s where s.itemType.id = " + itemType.getId())
					.isEmpty())) {
				Stock s = (Stock) hibernateTemplate.find(
						"from Stock s where s.itemType.id = "
								+ itemType.getId()).get(0);
				if (s.getStonum() == null) {
					s.setStonum(num);
					s.setWhname(whname);
					s.setEnnum(num);
					hibernateTemplate.update(s);
				} else if (num != null) {
					s.setStonum(s.getStonum() + num);
					s.setWhname(whname);
					s.setEnnum(s.getEnnum().intValue() + num.intValue());
					hibernateTemplate.update(s);
				}
				
			} else {
				Stock s = new Stock();
				s.setItemType(itemType);
				if (num != null) {
					s.setStonum(num);
					s.setEnnum(num);
					s.setWhname(whname);
					s.setOutnum(0);
					s.setScrnum(0);
					hibernateTemplate.save(s);
				}
			}
		}

	}

	public void subNumber(ItemType itemType, Integer num) throws Exception {
		if (itemType != null && num != null) {
			HibernateTemplate hibernateTemplate = getHibernatetemplate();
			if (!hibernateTemplate.find(
					"from Stock s where s.itemType.id = " + itemType.getId())
					.isEmpty()) {
				Stock s = (Stock) hibernateTemplate.find(
						"from Stock s where s.itemType.id = "
								+ itemType.getId()).get(0);
				if (s.getStonum() == null || s.getStonum() - num < 0) {
					throw new Exception("库存小于0！！！");
				} else {
					s.setStonum(s.getStonum() - num);
					s.setOutnum(s.getOutnum() + num);
				}
				hibernateTemplate.update(s);
			} else {
				throw new Exception("（系统异常）该部品无库存！！！");
			}
		}

	}

	public void addScrnum(ItemType itemType, Integer num) throws Exception {
		if (itemType != null && num != null) {
			HibernateTemplate hibernateTemplate = getHibernatetemplate();
			if ((hibernateTemplate.find(
					"from Stock s where s.itemType.id = " + itemType.getId())
					.size() != 0)) {
				Stock s = (Stock) hibernateTemplate.find(
						"from Stock s where s.itemType.id = "
								+ itemType.getId()).get(0);
				if (s.getStonum() == null) {
					s.setScrnum(num);
				} else {
					s.setScrnum(s.getScrnum() + num);
				}
				hibernateTemplate.update(s);
			} else {
				Stock s = new Stock();
				s.setItemType(itemType);
				s.setScrnum(num==null?0:num);
				s.setOutnum(0);
				s.setStonum(0);
				hibernateTemplate.save(s);
			}
		}

	}
	
	

	public List<Stock> getBondedList() {
		HibernateTemplate hibernateTemplate = getHibernatetemplate();
		return hibernateTemplate
				.find("from Stock s where s.itemType.isbonded = 1");
	}

	public List<Stock> getGeneralList() {
		HibernateTemplate hibernateTemplate = getHibernatetemplate();
		return hibernateTemplate
				.find("from Stock s where s.itemType.isbonded = 0");
	}

	public Integer getNumberByItemTypeId(Integer itemTypeId) {
		List<Stock> stocks = getHibernatetemplate().find(
				"from Stock s where s.itemType.id = " + itemTypeId);
		if(null==stocks||stocks.size()==0)
		{
			return 0;
		}
		return ((Stock)stocks.get(0)).getStonum();
	}

	public String getWhnameByItemTypeId(Integer itemTypeId) {
		List<Stock> stocks = getHibernatetemplate().find("from Stock s where s.itemType.id = "+itemTypeId);
		if(stocks.size()<=0)
		{
			return null;
		}
		return stocks.get(0).getWhname();
	}

}
