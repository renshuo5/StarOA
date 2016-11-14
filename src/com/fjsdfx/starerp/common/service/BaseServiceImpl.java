package com.fjsdfx.starerp.common.service;

import java.io.File;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.bean.FileUpload;
import com.fjsdfx.starerp.common.bean.PagerInfo;
import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.common.dao.BaseDao;




@Service
@Transactional
public  class BaseServiceImpl <T extends Serializable> implements BaseService<T>{

	private BaseDao<T> dao;
	public BaseDao<T> getDao() {
		return dao;
	}
	@Resource(name="baseDaoImpl")
	public void setDao(BaseDao<T> dao) {
		this.dao = dao;
	}

	public void delete(Object o) {
		// TODO Auto-generated method stub
		dao.delete(o);
	}

	public <T> T deleteById(Class<T> entityclass ,Serializable id) {
		// TODO Auto-generated method stub
		if (id == null) {
			return null;
		}
		return dao.deleteById(entityclass,id);
	}

	public<T> List<T> deleteById(Class<T> entityclass ,Serializable[] ids) {
		List<T> dts = new ArrayList<T>();
		T del = null;
		if (ids != null && ids.length > 0) {
			for (Serializable id : ids) {
			del = deleteById(entityclass,id);
			if (del != null) {
				dts.add(del);
				}
			}
		}
		return dts;
	}
	@Transactional(readOnly = true)
	public T findById(Class<T> entityclass,Serializable id) {
		// TODO Auto-generated method stub
		
		return dao.get(entityclass,id);
	}
	@Transactional(readOnly = true)
	public T load(Class<T> entityclass,Serializable id) {
		// TODO Auto-generated method stub
		return dao.load(entityclass,id);
	}

	public T save(T entity) {
		// TODO Auto-generated method stub
		return dao.save(entity);
	}

	public T saveAndRefresh(T entity) {
		// TODO Auto-generated method stub
		dao.save(entity);
		 dao.refresh(entity);
		return entity;
	}

	public Object saveOrUpdate(Object o) {
		// TODO Auto-generated method stub
		dao.saveOrUpdate(o);
		return o;
	}

	public Object update(Object o) {
		// TODO Auto-generated method stub
		return dao.update(o);
	}

	public PagerModel findByExample(Class<T> entityClass,T instance)
	{
		return dao.findByExample(entityClass,instance);
	}

	public PagerModel getPager(Class<T> entityClass,String wherehql)
	{
		return dao.getPager(PagerInfo.getOffset(), entityClass, PagerInfo.getPagesize(), wherehql ,"");
	}
	public PagerModel getPager(Class<T> entityClass)
	{
		return getPager(entityClass,"");
	}
	public PagerModel getPagerDesc(Class<T> entityClass)
	{
		return dao.getPager(PagerInfo.getOffset(), entityClass, PagerInfo.getPagesize(), "" ," order by o.id desc");
	}
	public PagerModel getPagerDesc(Class<T> entityClass,String wherehql)
	{
		return dao.getPager(PagerInfo.getOffset(), entityClass, PagerInfo.getPagesize(), wherehql ," order by o.id desc");
	}

	public List<T> findByHql(String hql)
	{
		return dao.findByHql(hql);
	}
	public PagerModel fuzzyQuery(Class<T> entityClass,Map<String,String> likeMap)
	{
		return dao.fuzzyQuery(entityClass, likeMap);
	}

	
}
