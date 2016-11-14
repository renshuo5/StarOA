package com.fjsdfx.starerp.common.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.fjsdfx.starerp.common.bean.PagerModel;






/**
 * @author chenluqiang
 *
 * @param <T>
 */

public interface BaseDao <T extends Serializable>{
	


	public<T> T get(Class<T> entityclass,Serializable id);

	/**
	 * 
	 * 通过ID读出
	 * @param id
	 *           
	 * @return
	 */
	public<T> T load(Class<T> entityclass ,Serializable id);

	

	public T save(T entity);

	/**
	 * 更新实体
	 * 
	 * @param entity
	 *           
	 * @return
	 */
	public Object update(Object entity);

	/**
	 * 保存或更新实�?
	 * 
	 * @param entity
	 * 
	 * @return
	 */
	public Object saveOrUpdate(Object entity);


	/**
	 *删除实体
	 * 
	 * @param entity
	 *        
	 */
	public void delete(Object entity);

	/**
	 *通过ID删除
	 * 
	 * @param id
	 *      
	 */
	public <T> T deleteById(Class<T> entityclass ,Serializable id);

	/**
	 *刷新实体
	 * 
	 * @param entity
	 */
	public void refresh(Object entity);


	
	
	/**
	 * 分页
	 * @param offset
	 * @param entityClass
	 * @param pagesize
	 * @param wherehql
	 * @return
	 */
	public PagerModel getPager(int offset,Class<T> entityClass, int pagesize,String wherehql,String orderby);
	
	
	
	/**
	 * QBE
	 * @param entityClass
	 * @return
	 */
	public PagerModel findByExample(Class<T> entityClass,T instance);
	
	/**
	 * @param hql
	 * @return
	 */
	public List<T> findByHql(String hql);
	public PagerModel fuzzyQuery(Class<T> entityClass,Map<String,String> likeMap);
}
