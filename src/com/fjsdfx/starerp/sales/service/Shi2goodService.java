package com.fjsdfx.starerp.sales.service;

import java.util.List;

import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.persons.model.Employee;
import com.fjsdfx.starerp.sales.model.Shi2good;
import com.fjsdfx.starerp.sales.model.Shinote2;
import com.fjsdfx.starerp.security.model.User;

public interface Shi2goodService extends BaseService<Shi2good> {

	public void savesh2goods(Shinote2 shinote2 ,List<Integer> orderids, List<Integer> itemTypeIds,List<Integer>shi2nos,List<Integer> shi2no2s,List<String> shi2notes);
	
	public void updatesh2goods(Shinote2 shinote2 ,List<Integer> orderids, List<Integer> itemTypeIds,List<Integer>shi2nos,List<Integer> shi2no2s,List<String> shi2notes);

	public void examine(Integer shinote2Id, String schper, String storageper,
			User whmger);

	public void deleteshi2goods(List<Shi2good> shi2goods, Integer shinote2Id);
}
