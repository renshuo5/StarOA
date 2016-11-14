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
	 * ͨ��ID��ѯʵ��
	 * @param id
	 *           
	 * @return ����ʵ��
	 */
	
	public T findById(Class<T> entityclass,Serializable id);

	/**
	 * ͨ��ID��ȡʵ��
	 * @param entityclass 
	 * @param id
	 * @return ����ʵ��
	 */
	public T load(Class<T> entityclass,Serializable id);

	


	 
	/**
	 * ����ʵ��
	 * @param entity
	 * @return
	 */
	public T save(T entity);

	/**
	 * ����ʵ��
	 * @param o
	 * @return
	 */
	public Object update(Object o);

	/**
	 * ���沢����
	 * @param o
	 * @return
	 */
	public Object saveOrUpdate(Object o);

	/**
	 * ɾ��ʵ��
	 * @param o
	 */
	public void delete(Object o);

	
	/**
	 * ͨ��IDɾ��ʵ��
	 * @param <T>
	 * @param entityclass
	 * @param id
	 * @return
	 */
	public <T> T deleteById(Class<T> entityclass ,Serializable id);

	
	/**
	 * 
	 * ͨ��ID�б� ɾ��һ��ʵ��
	 * @param <T>
	 * @param entityclass
	 * @param ids
	 * @return
	 */
	public<T> List<T> deleteById(Class<T> entityclass ,Serializable[] ids);

	
	/**
	 * ����ˢ��
	 * @param entity
	 * @return
	 */
	public T saveAndRefresh(T entity);

	/**
	 * ��ѯ
	 * @param entityClass
	 * @param wherehql ��ѯ�е� where���
	 * @return
	 */
	public PagerModel getPager(Class<T> entityClass,String wherehql);
	/**
	 * ��ѯ��ʵ�����ж���
	 * @param entityClass
	 * @return
	 */
	public PagerModel getPager(Class<T> entityClass);
	/**
	 * ��ѯ��ʵ����ζ��󣬰���������
	 * @param entityClass
	 * @return
	 */
	public PagerModel getPagerDesc(Class<T> entityClass);
	/**
	 * ��ѯ��ʵ����ζ��󣬰���������
	 * @param entityClass
	 * @param wherehql ��ѯ�е� where���
	 * @return
	 */
	public PagerModel getPagerDesc(Class<T> entityClass,String wherehql);
	/**
	 * ͨ��Example��ѯ����Զ�ӳ��ʱ�ٷ���bug�����޽������ѯ��fuzzyQuery������
	 * @param entityClass
	 * @param instance
	 * @return
	 */
	public PagerModel findByExample(Class<T> entityClass,T instance);

	/**
	 * ͨ��HQL����ѯ
	 * @param hql
	 * @return
	 */
	public List<T> findByHql(String hql);
	/**
	 * ģ����ѯ
	 * likeMap��
	 * 
	 * Map<String,String> like=new HashMap<String,String>();
		like.put("name", "fuzzyName");
		like.put("description", "fuzzyDescription");
		pm=itemService.fuzzyQuery(Item.class,like);
		
		�������� ���ж�name���Ժ�description���� ����ģ����ѯ���ؼ���ΪfuzzyName��fuzzyDescription
	 * @param entityClass
	 * @param likeMap
	 * @return
	 */
	public PagerModel fuzzyQuery(Class<T> entityClass,Map<String,String> likeMap);
	
	
}
