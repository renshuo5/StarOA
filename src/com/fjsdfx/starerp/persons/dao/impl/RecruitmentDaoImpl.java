package com.fjsdfx.starerp.persons.dao.impl;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.bean.PagerInfo;
import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.common.dao.BaseDaoImpl;
import com.fjsdfx.starerp.persons.dao.RecruitmentDao;
import com.fjsdfx.starerp.persons.model.Recruitment;
@Component
@Transactional
public class RecruitmentDaoImpl extends BaseDaoImpl<Recruitment> implements RecruitmentDao{
	private HibernateTemplate hibernatetemplate;

	public HibernateTemplate getHibernatetemplate() {
		return hibernatetemplate;
	}

	@Resource
	public void setHibernatetemplate(HibernateTemplate hibernatetemplate) {
		this.hibernatetemplate = hibernatetemplate;
	}


	public PagerModel checkQuery(Class entityClass,Map<String,Integer> likeMap) {
		PagerModel pm=new PagerModel();
		StringBuffer datasHql=new StringBuffer();	
		StringBuffer countHql=new StringBuffer();
		datasHql.append("from "+entityClass.getName()+" where ").append(likeMap.keySet()+"=1");
		countHql.append("select count(*) from "+entityClass.getName()+"where ").append(likeMap.keySet()+"=1");
		         
//		for(String key: likeMap.keySet())
//		{
//			datasHql.append(key).append("="+likeMap.get(key)).append(" and ");
//			countHql.append(key).append("="+likeMap.get(key)).append(" and ");
//		}
//		//datasHql.deleteCharAt(datasHql.length()-5);
//		datasHql.delete(datasHql.length()-5, datasHql.length()-1);
//		countHql.delete(countHql.length()-5, countHql.length()-1);
		
		System.out.println(datasHql.toString());
		System.out.println(countHql.toString());
		Query quaryDatas = hibernatetemplate.getSessionFactory().getCurrentSession().createQuery(datasHql.toString()).setFirstResult(PagerInfo.getOffset()).setMaxResults(PagerInfo.getPagesize());
		List<Recruitment> datas=quaryDatas.list();
		
		Query quaryCount =hibernatetemplate.getSessionFactory().getCurrentSession().createQuery(countHql.toString());
		int total = ((Long) quaryCount.uniqueResult()).intValue();
		
		pm.setDatas(datas);
		pm.setTotal(total);
		return pm;
	}

}
