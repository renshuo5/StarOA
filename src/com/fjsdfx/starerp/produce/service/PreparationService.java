package com.fjsdfx.starerp.produce.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.produce.model.Pergood;
import com.fjsdfx.starerp.produce.model.Preparation;

public interface PreparationService extends BaseService<Preparation> {

	public List<ItemType> getItemTypeByIds(List<Integer> itemTypeIds);
	
	public Boolean savePergoods(Preparation preparation, List<Integer> itemTypeIds, List<Integer> preNums, List<Date> eDates, List<String> preNotes);
	public Boolean updatePergoods(Preparation preparation, List<Integer> itemTypeIds, List<Integer> preNums, List<Date> eDates, List<String> preNotes, Integer preparationId);
	public Boolean deleteByPreparationId(Integer preparationId);
	public List<Pergood> getAllPergoods(Preparation p);
	public Map<Integer,Integer> getPreparationItemTypeInfos(Preparation p);
	public String checkExistsByNO(String presn);
}
