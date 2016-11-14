package com.fjsdfx.starerp.warehouse.service;

import java.util.List;
import java.util.Map;

import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.persons.model.Employee;
import com.fjsdfx.starerp.warehouse.model.Supsendm;

public interface SupsendmService extends BaseService<Supsendm> {
	public List<Employee> getWorkshopWorkers();
	public List<Employee> getProductionWorkers();
	public List<Employee> getWarehouseWorkers();
	public void saveByPreid(Supsendm supsendm,Integer preid);
	public Map<ItemType, Integer> getPartItemTypes(Map<Integer, Integer> infos);
	public void deleteById(Integer id);
	public Map<ItemType, Integer> getSinglePartItemTypes(Integer itemTypeId,Integer needNum);
	public void update(Supsendm supsendm,List<Integer> itemTypeIds,List<Integer> singlesets,List<Integer> generalnos,List<Integer> bondednums,List<Integer> tbalances,List<Integer> lbalances,List<String> notes);
	public Supsendm findByPergoodId(Integer pergoodId);
	public Integer getLastFeeding(Integer itemTypeId) throws Exception;
}
