package com.fjsdfx.starerp.warehouse.service;

import java.util.List;
import java.util.Map;

import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.warehouse.model.Supsendm;
import com.fjsdfx.starerp.warehouse.model.Susgood;

public interface SusgoodService extends BaseService<Susgood>{
	public List<Susgood> createDefaultSusgoodsByPartItemTypes(Map<ItemType, Integer> partItemTypes,Integer needNum);
	public void saveSusgoods(Supsendm supsendm,List<Integer> itemTypeIds,List<Integer> singlesets,List<Integer> generalnos,List<Integer> bondednums,List<Integer> tbalances,List<Integer> lbalances,List<String> notes);
	public List<Susgood> getSusgoodsBySupsendmId(Integer supsendmId);
	public Integer getLastSurplus(Integer supsendmId,Integer itemTypeId);
}
