package com.fjsdfx.starerp.common.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;


import javax.annotation.Resource;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateTemplate;

import org.springframework.stereotype.Repository;

import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.bean.PagerInfo;
import com.fjsdfx.starerp.common.bean.PagerModel;



/**
 * @author chenluqiang
 *
 * @param <T>
 */

@Repository
@Transactional
public class BaseDaoImpl <T extends Serializable> implements BaseDao<T>{

	private HibernateTemplate hibernatetemplate;

	public HibernateTemplate getHibernatetemplate() {
		return hibernatetemplate;
	}

	@Resource
	public void setHibernatetemplate(HibernateTemplate hibernatetemplate) {
		this.hibernatetemplate = hibernatetemplate;
	}


	public void delete(Object entity) {
		// TODO Auto-generated method stub
		hibernatetemplate.delete(entity);
	}

	public <T> T deleteById(Class<T> entityclass ,Serializable id) {
		// TODO Auto-generated method stub
		T entity = load(entityclass,id);
		hibernatetemplate.delete(entity);
		return entity;
		
	}




	public<T> T get (Class<T> entityclass ,Serializable id) {
		// TODO Auto-generated method stub
		
		return   (T)hibernatetemplate.get(entityclass, id);
	}

	


	public<T> T load(Class<T> entityclass ,Serializable id) {
		// TODO Auto-generated method stub
	
		return (T)hibernatetemplate.load(entityclass, id);
	}

	public void refresh(Object entity) {
		// TODO Auto-generated method stub
		hibernatetemplate.refresh(entity);
	}

	public T save(T entity) {
		// TODO Auto-generated method stub
		hibernatetemplate.save(entity);
		return entity;
		
	}

	public Object saveOrUpdate(Object entity) {
		// TODO Auto-generated method stub
		
		hibernatetemplate.saveOrUpdate(entity);
		return entity;
	}

	public Object update(Object entity) {
		// TODO Auto-generated method stub
		hibernatetemplate.update(entity);
		return entity;
	}

	public PagerModel getPager(int offset,Class<T> entityClass, int pagesize,String wherehql,String orderby)
	{
		// 得到总记录数
		String queryCountHqlString = "select count(*) from "+ entityClass.getName() +" o "+wherehql;
		String quaryPageItemsHql="from "+entityClass.getName()+" o "+wherehql+orderby;
		Query quary = hibernatetemplate.getSessionFactory().getCurrentSession().createQuery(queryCountHqlString);
		int total = ((Long) quary.uniqueResult()).intValue();
		List datas = hibernatetemplate.getSessionFactory().getCurrentSession().createQuery(quaryPageItemsHql)
				.setFirstResult(offset).setMaxResults(pagesize).list();
		PagerModel pm=new PagerModel();
		pm.setTotal(total);
		pm.setDatas(datas);
		return pm;
	}
	
	
	
	/* (non-Javadoc)
	 * @see com.fjsdfx.starerp.common.dao.BaseDao#fuzzyQuery(java.lang.Class, java.util.Map)
	 */
	public PagerModel fuzzyQuery(Class<T> entityClass,Map<String,String> likeMap)
	{
		PagerModel pm=new PagerModel();
		StringBuffer datasHql=new StringBuffer();	
		StringBuffer countHql=new StringBuffer();
		datasHql.append("from "+entityClass.getName()+" o where ");
		countHql.append("select count(*) from "+entityClass.getName()+" o where ");
		for(String key: likeMap.keySet())
		{
			datasHql.append("o.").append(key).append(" like ").append("'%"+likeMap.get(key)+"%'").append(" and ");
			countHql.append("o.").append(key).append("  like ").append("'%"+likeMap.get(key)+"%'").append(" and ");
		}
		//datasHql.deleteCharAt(datasHql.length()-5);
		datasHql.delete(datasHql.length()-5, datasHql.length()-1);
		countHql.delete(countHql.length()-5, countHql.length()-1);
		
		Query quaryDatas = hibernatetemplate.getSessionFactory().getCurrentSession().createQuery(datasHql.toString()).setFirstResult(PagerInfo.getOffset()).setMaxResults(PagerInfo.getPagesize());
		List<T> datas=quaryDatas.list();
		
		Query quaryCount =hibernatetemplate.getSessionFactory().getCurrentSession().createQuery(countHql.toString());
		int total = ((Long) quaryCount.uniqueResult()).intValue();
		
		pm.setDatas(datas);
		pm.setTotal(total);
		return pm;

	}
	
	

	
	@SuppressWarnings("unchecked")
	public PagerModel findByExample(Class<T> entityClass,T instance)
	{
		PagerModel pm=new PagerModel();
		  
	        
			Example example = Example.create(instance).ignoreCase().enableLike(
					MatchMode.ANYWHERE);
			
		
			Criteria datasCriteria=getHibernatetemplate()
			.getSessionFactory().getCurrentSession().createCriteria(
					entityClass);
			
			List<T> datas=datasCriteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).add(example).setFirstResult(PagerInfo.getOffset()).setMaxResults(PagerInfo.getPagesize()).list();
			
			Criteria countCriteria=getHibernatetemplate()
			.getSessionFactory().getCurrentSession().createCriteria(
					entityClass);
			int total=(Integer)countCriteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).add(example).setProjection(Projections.rowCount()).uniqueResult();
			
			/*List<T> datas = (List<T>)getHibernatetemplate()
			.getSessionFactory().getCurrentSession().createCriteria(
					entityClass).add(example).setFirstResult(PagerInfo.getOffset()).setMaxResults(PagerInfo.getPagesize()).list();

			
			int total=(Integer)getHibernatetemplate()
			.getSessionFactory().getCurrentSession().createCriteria(
					entityClass).add(example).setProjection(Projections.rowCount()).uniqueResult();
			
			*/
			
			pm.setDatas(datas);
			pm.setTotal(total);
			return pm;
	}
	
	
	public List<T> findByHql(String hql)
	{
		return hibernatetemplate.find(hql);
	}

}
