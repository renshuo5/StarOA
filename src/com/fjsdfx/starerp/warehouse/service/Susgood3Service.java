package com.fjsdfx.starerp.warehouse.service;

import java.util.List;

import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.item.model.ControllerunitInfo;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.warehouse.model.Supsendm3;
import com.fjsdfx.starerp.warehouse.model.Susgood3;

public interface Susgood3Service extends BaseService<Susgood3> {

	public void saveBySupsendm3(Supsendm3 supsendm3,List<Integer> seriNums, List<Integer> itemTypeIds,
			List<ControllerunitInfo> controllerunitInfos, List<Integer> singlesets,
			List<Integer> needNums, List<Integer> pracNums, List<String> notes);
	public List<Susgood3> getSusgood3sBySupsendm3Id(Integer supsendm3Id);
	public List<Susgood3> createDefaultSusgood3s(ItemType itemType, Integer needNum);
	public List<Susgood3> createExtraDefaultSusgood3s(ItemType itemType);
	public void confirm(Supsendm3 supsendm3,List<Integer> susgood3ids,List<Integer> confirms);
	public void deleteExtraSusgood3s(List<Integer> susgood3Ids);
}
