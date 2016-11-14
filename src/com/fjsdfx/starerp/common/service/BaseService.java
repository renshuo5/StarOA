package com.fjsdfx.starerp.common.service;

import java.io.File;
import java.io.Serializable;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.item.model.Item;



/**
 * @author chenluqiang
 *
 * @param <T>
 */
public interface BaseService <T extends Serializable>{
	/**
	 * 
	 * 通过ID查询实体
	 * @param id
	 *           
	 * @return 返回实体
	 */
	
	public T findById(Class<T> entityclass,Serializable id);

	/**
	 * 通过ID读取实体
	 * @param entityclass 
	 * @param id
	 * @return 返回实体
	 */
	public T load(Class<T> entityclass,Serializable id);

	


	 
	/**
	 * 保存实体
	 * @param entity
	 * @return
	 */
	public T save(T entity);

	/**
	 * 更新实体
	 * @param o
	 * @return
	 */
	public Object update(Object o);

	/**
	 * 保存并更新
	 * @param o
	 * @return
	 */
	public Object saveOrUpdate(Object o);

	/**
	 * 删除实体
	 * @param o
	 */
	public void delete(Object o);

	
	/**
	 * 通过ID删除实体
	 * @param <T>
	 * @param entityclass
	 * @param id
	 * @return
	 */
	public <T> T deleteById(Class<T> entityclass ,Serializable id);

	
	/**
	 * 
	 * 通过ID列表 删除一组实体
	 * @param <T>
	 * @param entityclass
	 * @param ids
	 * @return
	 */
	public<T> List<T> deleteById(Class<T> entityclass ,Serializable[] ids);

	
	/**
	 * 保存刷新
	 * @param entity
	 * @return
	 */
	public T saveAndRefresh(T entity);

	/**
	 * 查询
	 * @param entityClass
	 * @param wherehql 查询中的 where语句
	 * @return
	 */
	public PagerModel getPager(Class<T> entityClass,String wherehql);
	/**
	 * 查询该实体所有对象
	 * @param entityClass
	 * @return
	 */
	public PagerModel getPager(Class<T> entityClass);
	/**
	 * 查询该实体多游对象，按逆序排列
	 * @param entityClass
	 * @return
	 */
	public PagerModel getPagerDesc(Class<T> entityClass);
	/**
	 * 查询该实体多游对象，按逆序排列
	 * @param entityClass
	 * @param wherehql 查询中的 where语句
	 * @return
	 */
	public PagerModel getPagerDesc(Class<T> entityClass,String wherehql);
	/**
	 * 通过Example查询（多对多映射时官方有bug，暂无解决，查询用fuzzyQuery方法）
	 * @param entityClass
	 * @param instance
	 * @return
	 */
	public PagerModel findByExample(Class<T> entityClass,T instance);

	/**
	 * 通过HQL语句查询
	 * @param hql
	 * @return
	 */
	public List<T> findByHql(String hql);
	/**
	 * 模糊查询
	 * likeMap：
	 * 
	 * Map<String,String> like=new HashMap<String,String>();
		like.put("name", "fuzzyName");
		like.put("description", "fuzzyDescription");
		pm=itemService.fuzzyQuery(Item.class,like);
		
		如上例子 进行对name属性和description属性 进行模糊查询，关键字为fuzzyName和fuzzyDescription
	 * @param entityClass
	 * @param likeMap
	 * @return
	 */
	public PagerModel fuzzyQuery(Class<T> entityClass,Map<String,String> likeMap);
	
	
}
