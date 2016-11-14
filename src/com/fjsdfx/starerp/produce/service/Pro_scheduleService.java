package com.fjsdfx.starerp.produce.service;

import java.util.Date;
import java.util.List;

import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.item.model.Item;
import com.fjsdfx.starerp.item.model.ItemRelation;
import com.fjsdfx.starerp.produce.model.Pro_schedule;
import com.fjsdfx.starerp.produce.model.Prscheck;

public interface Pro_scheduleService extends BaseService<Pro_schedule> {

	public void saveproschedules(Prscheck prscheck,List<Date> cdates,List<String> pcontents,List<String> pnotes,List<Integer> pnumbers,List<String> punitsn,Integer addplan,List<Integer> itemTypeids);
	public void delproschedules(Prscheck prscheck);
	public void updateschedules(Prscheck prscheck,List<Date> cdates,List<String> pcontents,List<String> pnotes,List<Integer> pnumbers,List<String> punits,List<Integer> itemTypeids);

}
