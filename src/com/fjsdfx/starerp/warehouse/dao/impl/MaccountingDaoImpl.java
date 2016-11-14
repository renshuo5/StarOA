package com.fjsdfx.starerp.warehouse.dao.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.fjsdfx.starerp.common.dao.BaseDaoImpl;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.warehouse.dao.MaccountingDao;
import com.fjsdfx.starerp.warehouse.model.Maccounting;
import com.fjsdfx.starerp.warehouse.model.Stock;
import com.fjsdfx.starerp.warehouse.service.StockService;

@Component
public class MaccountingDaoImpl extends BaseDaoImpl<Maccounting> implements
		MaccountingDao {

	private StockService stockService;

	public StockService getStockService() {
		return stockService;
	}

	@Resource
	public void setStockService(StockService stockService) {
		this.stockService = stockService;
	}

	/**
	 * 增加入库数量
	 */
	public void addEnNumber(Date date, ItemType itemType, String whname,
			Integer num) {
		HibernateTemplate hibernateTemplate = getHibernatetemplate();
		if (!hibernateTemplate.find(
				"from Maccounting m where m.itemType.id = " + itemType.getId())
				.isEmpty()) {
			Maccounting m = (Maccounting) hibernateTemplate.find(
					"from Maccounting m where m.itemType.id = "
							+ itemType.getId()).get(0);
			if (m.getEnnum() != null) {
				if (num != null) {
					m.setEnnum(m.getEnnum() + num);
				}
				if (date != null) {
					m.setMacdate(date);
				} else {
					Date date2 = new Date();
					m.setMacdate(date2);
				}

				hibernateTemplate.update(m);
			} else {
				if (num != null) {
					m.setEnnum(num);
				}
				if (date != null) {
					m.setMacdate(date);
				} else {
					Date date2 = new Date();
					m.setMacdate(date2);
				}

				hibernateTemplate.update(m);
			}

		} else {
			Maccounting m = new Maccounting();
			if (itemType != null) {
				m.setItemType(itemType);
			}
			if (whname != null) {
				m.setWhname(whname);
			}
			if (date != null) {
				m.setMacdate(date);
			} else {
				Date date2 = new Date();
				m.setMacdate(date2);
			}
			if (m.getEnnum() == null) {
				if (num != null) {
					m.setEnnum(num);
				}

			} else {
				if (num != null) {
					m.setEnnum(m.getEnnum() + num);
				}

			}
			hibernateTemplate.save(m);
		}

	}

	/**
	 * 增加出库数量
	 */
	public void addOutNumber(Date date, ItemType itemType, Integer num) {
		HibernateTemplate hibernateTemplate = getHibernatetemplate();
		if (!hibernateTemplate.find(
				"from Maccounting m where m.itemType.id = " + itemType.getId())
				.isEmpty()) {
			Maccounting m = (Maccounting) hibernateTemplate.find(
					"from Maccounting m where m.itemType.id = "
							+ itemType.getId()).get(0);
			if (m.getOutnum() != null) {
				m.setOutnum(m.getOutnum() + num);
				m.setMacdate(date);
				hibernateTemplate.update(m);
			} else {
				m.setOutnum(num);
				m.setMacdate(date);
				hibernateTemplate.update(m);
			}
		} else {
			Maccounting m = new Maccounting();
			m.setItemType(itemType);
			m.setMacdate(date);
			if (m.getOutnum() == null) {
				m.setOutnum(num);
			} else {
				m.setOutnum(m.getEnnum() + num);
			}
			hibernateTemplate.save(m);
		}

	}

	/**
	 * 库存量
	 */
	public void setStonum() {
		HibernateTemplate hibernateTemplate = getHibernatetemplate();
		List<Maccounting> maccountings = hibernateTemplate
				.find("from Maccounting");
		if (maccountings.size() != 0) {
			for (int i = 0; i < maccountings.size(); i++) {
				if (hibernateTemplate.find("from Stock") != null) {
					if (!stockService
							.findByHql(
									"from Stock s where s.itemType.id="
											+ maccountings.get(i).getItemType()
													.getId()).isEmpty()) {
						Stock stock = stockService.findByHql(
								"from Stock s where s.itemType.id="
										+ maccountings.get(i).getItemType()
												.getId()).get(0);
						maccountings.get(i).setStonum(stock.getStonum());
						hibernateTemplate.update(maccountings.get(i));
					}
				}

			}

		}
	}

}
