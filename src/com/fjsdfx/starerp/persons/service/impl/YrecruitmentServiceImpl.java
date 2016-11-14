package com.fjsdfx.starerp.persons.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.persons.dao.RecruitmentDao;
import com.fjsdfx.starerp.persons.dao.YrecruitmentDao;
import com.fjsdfx.starerp.persons.model.Recruitment;
import com.fjsdfx.starerp.persons.model.Yrecruitment;
import com.fjsdfx.starerp.persons.service.YrecruitmentService;

@Service      //注入到spring的IOC
@Transactional    

public class YrecruitmentServiceImpl extends BaseServiceImpl<Yrecruitment> implements YrecruitmentService{

//	private RecruitmentDao recruitmentDao;
//	private YrecruitmentDao yrecruitmentDao;
//	
//	public RecruitmentDao getRecruitmentDao() {
//		return recruitmentDao;
//	}
//
//	@Resource
//	public void setRecruitmentDao(RecruitmentDao recruitmentDao) {
//		this.recruitmentDao = recruitmentDao;
//	}
//
//	
//	
//	public YrecruitmentDao getYrecruitmentDao() {
//		return yrecruitmentDao;
//	}
//
//	@Resource
//	public void setYrecruitmentDao(YrecruitmentDao yrecruitmentDao) {
//		this.yrecruitmentDao = yrecruitmentDao;
//	}
//
//	public void ydel(List<Yrecruitment> yrecruitmentTemp,
//			List<Recruitment> recruitmentlist) {
//		// TODO Auto-generated method stub
//		for (Recruitment recruitment : recruitmentlist) {
//			recruitmentDao.delete(recruitment);
//		}
//		//yrecruitmentDao.delete(yrecruitmentTemp.get(0));
//	}

}
