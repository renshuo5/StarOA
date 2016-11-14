package com.fjsdfx.starerp.warehouse.service;

import java.util.List;

import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.persons.model.Employee;
import com.fjsdfx.starerp.purchase.model.Quaprolist;
import com.fjsdfx.starerp.security.model.User;
import com.fjsdfx.starerp.warehouse.model.Feedexamine;

public interface FeedexamineService extends BaseService<Feedexamine>{

	public void save(Feedexamine feedexamine,List<Integer> bsnos,
			List<Integer> itemTypeIds, List<Integer> fpnums, List<String> fnotes);

	public void confirm(Integer feedexamineId,User whmanager, List<Boolean> confirmnums, List<Integer> factnos);

	public void delfeexexamine(Integer feedexamineId);

	public void examinefeedexamine(Integer feedexamineId, User finspector,
			List<Integer> factnos, List<Boolean> exresults);

	public void updatefeedexamine(Feedexamine feedexamine, List<Integer> bsnos,
			List<Integer> itemTypeIds, List<Integer> fpnums, List<String> fnotes);

}
