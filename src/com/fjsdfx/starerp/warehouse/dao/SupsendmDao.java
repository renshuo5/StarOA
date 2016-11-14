package com.fjsdfx.starerp.warehouse.dao;

import java.util.List;
import java.util.Map;

import com.fjsdfx.starerp.common.dao.BaseDao;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.persons.model.Employee;
import com.fjsdfx.starerp.warehouse.model.Supsendm;

public interface SupsendmDao extends BaseDao<Supsendm>{
	public Supsendm save(Supsendm supsendm);
	public List<Employee> getWorkshopWorkers();
	public List<Employee> getProductionWorkers();
	public List<Employee> getWarehouseWorkers();
//	public Map<ItemType, Integer> getAllPartItemTypesByItemTypeIds(List<Integer> itemTypeIds);
}
