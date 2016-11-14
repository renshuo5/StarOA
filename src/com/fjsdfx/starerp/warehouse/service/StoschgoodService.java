package com.fjsdfx.starerp.warehouse.service;

import java.util.List;

import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.security.model.User;
import com.fjsdfx.starerp.warehouse.model.Storescheduling;
import com.fjsdfx.starerp.warehouse.model.Stoschgood;
import com.fjsdfx.starerp.warehouse.model.Warehouse;

public interface StoschgoodService extends BaseService<Stoschgood>{



	public void savestoschgoods(Storescheduling storescheduling,
			List<Integer> itemTypeIds, List<Integer> qualitynums,
			List<Integer> stonums, List<Integer> departmentIds);

	public void addwarehouse(Storescheduling storescheduling, User whmanager, Integer warehouseId, Integer stonum, Department department);

	public void addrewinder(Storescheduling storescheduling,
			Integer rewinderId, User whmanager, List<Integer> itemTypeIds,
			List<Integer> qualitynums, List<Integer> stonums,
			List<Integer> departmentIds);

	public void addfeedexamine(Storescheduling storescheduling,
			Integer feedexamineId, User whmanager2, List<Integer> itemTypeIds,
			List<Integer> qualitynums, List<Integer> stonums,
			List<Integer> departmentIds);

}

