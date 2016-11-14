package com.fjsdfx.starerp.warehouse.service;

import java.util.List;

import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.persons.model.Employee;
import com.fjsdfx.starerp.warehouse.model.Rewgood;
import com.fjsdfx.starerp.warehouse.model.Rewinder;

public interface RewgoodService extends BaseService<Rewgood>{

	public void saverewgoods(Rewinder rewinder ,List<Integer> bsnos, List<Integer> itemTypeIds,List<String> rewunits,List<Integer> rewnos,List<Float> rewuprices,List<Float> rewprices,List<String> rewnotes);

	public void updaterewgoods(Rewinder rewinder, List<Integer>itemTypeIds, List<String>rewunits, List<Integer>rewnos, List<String>rewnotes);

	public void delrewgoods(Integer rewinderId);

	public void examinerewgoods(Rewinder rewinder, List<Rewgood> rewgoods,
			Employee rewinspector,List<Boolean> rewexamines);

	public void saverewgoods2(Rewinder rewinder,List<Integer> itemTypeIds,
			List<String> rewunits, List
			<Integer> factnos, List<String> rewnotes);

	
	
}

