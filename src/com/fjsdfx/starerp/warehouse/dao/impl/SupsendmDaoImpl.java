package com.fjsdfx.starerp.warehouse.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.fjsdfx.starerp.common.dao.BaseDaoImpl;
import com.fjsdfx.starerp.item.dao.ItemRelationDao;
import com.fjsdfx.starerp.item.model.ItemRelation;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.persons.model.Employee;
import com.fjsdfx.starerp.warehouse.dao.SupsendmDao;
import com.fjsdfx.starerp.warehouse.model.Supsendm;

@Component
public class SupsendmDaoImpl extends BaseDaoImpl<Supsendm> implements SupsendmDao{
	private ItemRelationDao itemRelationDao;

	public ItemRelationDao getItemRelationDao() {
		return itemRelationDao;
	}

	@Resource
	public void setItemRelationDao(ItemRelationDao itemRelationDao) {
		this.itemRelationDao = itemRelationDao;
	}

	public List<Employee> getProductionWorkers() {
		return getHibernatetemplate().find("from Employee e where e.department.id=2");
	}

	public List<Employee> getWarehouseWorkers() {
		return getHibernatetemplate().find("from Employee e where e.department.dptType=3");
	}

	public List<Employee> getWorkshopWorkers() {
		return getHibernatetemplate().find("from Employee e where e.department.dptType=2");
	}

//	public Map<ItemType, Integer> getAllPartItemTypesByItemTypeIds(
//			List<Integer> itemTypeIds) {
//		HibernateTemplate hibernateTemplate = getHibernatetemplate();
//		Map<ItemType, Integer> resultItemTypes = new HashMap<ItemType, Integer>();
//		List<ItemRelation> itemRelations = null;
//		for(Integer i:itemTypeIds)
//		{
//			itemRelations = itemRelationDao.findRelationsByItemTypeId(i);
//			for(ItemRelation ir:itemRelations)
//			{
//				resultItemTypes.put(ir.getPart(), ir.getPartamount());
//			}
//			//resultItemTypes.add((ItemType) hibernateTemplate.get(ItemType.class, i));
//		}
//		return resultItemTypes;
//	}
	
}
