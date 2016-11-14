package com.fjsdfx.starerp.persons.service;


import java.util.List;

import org.slf4j.Logger;

import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.persons.model.Recruitment;
import com.fjsdfx.starerp.persons.model.Yrecruitment;

public interface RecruitmentService extends BaseService<Recruitment> {

 public String  yadd(Logger logger,Yrecruitment yrecruitment,List<String> recstylelist,List<String>  recnaturelist,List<Integer> recnolist,List<String> basereclist,List<Integer> departmentIds); 
 public String  yedite(List<Recruitment> recruitments,Logger logger,Yrecruitment yrecruitment,List<String> recstylelist,List<String>  recnaturelist,List<Integer> recnolist,List<String> basereclist,List<Integer> departmentIds);
 public String ydel(Logger logger,List<Recruitment> recruitments,Integer yrecruitmentId);
	
}
