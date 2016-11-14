package com.fjsdfx.starerp.persons.service;

import java.util.List;

import org.slf4j.Logger;

import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.persons.model.Ytrainplan;
import com.fjsdfx.starerp.persons.model.yplanname;


public interface YtrainplanService extends BaseService<Ytrainplan>{

	public String add(Logger logger,List<String> contents,List<Integer> departmentIds,List<Integer> departmentId1s,List<String> adds,List<String> schdate1s,List<String> schdate2s,List<String> schdate3s,List<String> schdate4s,yplanname yplanname1);
	public String edite(Logger logger,List<String> contents,List<Integer> departmentIds,List<Integer> departmentId1s,List<String> adds,List<String> schdate1s,List<String> schdate2s,List<String> schdate3s,List<String> schdate4s,yplanname yplanname1);
	public String del(Logger logger,int yplanId);
}
