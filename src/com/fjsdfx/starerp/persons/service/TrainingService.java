package com.fjsdfx.starerp.persons.service;


import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.persons.model.Training;


public interface TrainingService extends BaseService<Training>{

	public void delTraining(Integer trainingId);
}
