package com.fjsdfx.starerp.produce.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.bean.PagerInfo;
import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.produce.dao.ProductionSchdulDao;
import com.fjsdfx.starerp.produce.dto.PrsListInfo;
import com.fjsdfx.starerp.produce.model.Preparation;
import com.fjsdfx.starerp.produce.model.ProductionSchdul;
import com.fjsdfx.starerp.produce.model.Prscheck;
import com.fjsdfx.starerp.produce.service.PreparationService;
import com.fjsdfx.starerp.produce.service.ProductionSchdulService;
import com.fjsdfx.starerp.produce.service.PrscheckService;
import com.fjsdfx.starerp.warehouse.dao.SupsendmDao;
import com.fjsdfx.starerp.warehouse.model.Supsendm;

@Service
@Transactional
public class ProductionSchdulServiceImpl extends BaseServiceImpl<ProductionSchdul> implements ProductionSchdulService {

	private SupsendmDao supsendmDao;
	private PrscheckService prscheckService;
	private PreparationService preparationService;
	private ProductionSchdulDao productionSchdulDao;
	public ProductionSchdulDao getProductionSchdulDao() {
		return productionSchdulDao;
	}
	@Resource
	public void setProductionSchdulDao(ProductionSchdulDao productionSchdulDao) {
		this.productionSchdulDao = productionSchdulDao;
	}
	public PreparationService getPreparationService() {
		return preparationService;
	}
	@Resource
	public void setPreparationService(PreparationService preparationService) {
		this.preparationService = preparationService;
	}
	public SupsendmDao getSupsendmDao() {
		return supsendmDao;
	}
	@Resource
	public void setSupsendmDao(SupsendmDao supsendmDao) {
		this.supsendmDao = supsendmDao;
	}
	public PrscheckService getPrscheckService() {
		return prscheckService;
	}
	@Resource
	public void setPrscheckService(PrscheckService prscheckService) {
		this.prscheckService = prscheckService;
	}
	
	public PagerModel getPreparationPager() {
		HibernateTemplate hibernatetemplate = productionSchdulDao.getHibernateTemplate();
		PagerModel pm = new PagerModel();
		List<PrsListInfo> infos = new ArrayList<PrsListInfo>();
		Query quary = hibernatetemplate.getSessionFactory().getCurrentSession().createQuery("select count(*) from Preparation p where (select count(*) from Supsendm s where s.preparation.id=p.id)>0 or (select count(*) from Supsendm3 s3 where s3.preparation.id=p.id)>0 order by p.id desc");
		int total = ((Long) quary.uniqueResult()).intValue();
		List preparations = hibernatetemplate.getSessionFactory().getCurrentSession().createQuery("from Preparation p where (select count(*) from Supsendm s where s.preparation.id=p.id)>0 or (select count(*) from Supsendm3 s3 where s3.preparation.id=p.id)>0 order by p.id desc")
				.setFirstResult(PagerInfo.getOffset()).setMaxResults(PagerInfo.getPagesize()).list();
		if(null!=preparations&&preparations.size()>0)
		{
			for(Object p:preparations)
			{
				PrsListInfo listInfo = new PrsListInfo();
				listInfo.setPreparation((Preparation)p);
				Prscheck prscheck = null;
				List<Prscheck> prschecks = prscheckService.findByHql("from Prscheck p where p.preparation.id = "+((Preparation)p).getId());
				if(null!=prschecks&&prschecks.size()>0)
				{
					prscheck = prschecks.get(0);
					listInfo.setPrscheck(prscheck);
				}else{
					listInfo.setPrscheck(null);
				}
				infos.add(listInfo);
			}
		}
		int maxSize = infos.size();
		pm.setTotal(total);
		pm.setDatas(infos);
		System.out.println("offset " + PagerInfo.getOffset());
		System.out.println("pagesize " + PagerInfo.getPagesize());
		System.out.println("maxSize " + maxSize);
		return pm;
	}
}
