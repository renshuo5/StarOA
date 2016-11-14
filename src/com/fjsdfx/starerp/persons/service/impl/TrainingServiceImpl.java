package com.fjsdfx.starerp.persons.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.persons.dao.TrainingDao;
import com.fjsdfx.starerp.persons.dao.YtrainplanDao;
import com.fjsdfx.starerp.persons.model.Training;
import com.fjsdfx.starerp.persons.model.Ytrainplan;
import com.fjsdfx.starerp.persons.service.TrainingService;

@Service      //注入到spring的IOC
@Transactional    
public class TrainingServiceImpl extends BaseServiceImpl<Training> implements TrainingService{

	private TrainingDao trainingDao;
	private YtrainplanDao ytrainplanDao;
	
	
	public TrainingDao getTrainingDao() {
		return trainingDao;
	}

    @Resource
	public void setTrainingDao(TrainingDao trainingDao) {
		this.trainingDao = trainingDao;
	}


	public YtrainplanDao getYtrainplanDao() {
		return ytrainplanDao;
	}

   @Resource
	public void setYtrainplanDao(YtrainplanDao ytrainplanDao) {
		this.ytrainplanDao = ytrainplanDao;
	}


	public void delTraining(Integer trainingId) {
		// TODO Auto-generated method stub
//		List<Ytrainplan> lists=ytrainplanDao.findByHql("from Ytrainplan where training.id="+trainingId);
//		
//		if(lists.size()!=0){
//			for (Ytrainplan ytrainplan1 : lists) {
//				ytrainplanDao.delete(ytrainplan1);
//			}
//		}
//		trainingDao.deleteById(Training.class, trainingId);
	}

}
