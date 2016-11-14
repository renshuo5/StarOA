package com.fjsdfx.starerp.persons.dao;


import java.util.Map;

import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.common.dao.BaseDao;
import com.fjsdfx.starerp.persons.model.Recruitment;

public interface RecruitmentDao  extends BaseDao<Recruitment>{

	/**
	 * 根据是否审核字段来查询
	 * @param entityClass
	 * @param isCheck
	 * @return
	 */
	public PagerModel checkQuery(Class entityClass,Map<String,Integer> likeMap);
}
