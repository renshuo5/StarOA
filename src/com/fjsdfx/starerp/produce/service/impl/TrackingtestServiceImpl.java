package com.fjsdfx.starerp.produce.service.impl;



import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.produce.model.Trackingtest;
import com.fjsdfx.starerp.produce.service.TrackingtestService;
import com.fjsdfx.starerp.purchase.model.Testnotes;
import com.fjsdfx.starerp.purchase.service.TestnotesService;

@Service
@Transactional
public class TrackingtestServiceImpl extends BaseServiceImpl<Trackingtest> implements TrackingtestService {

	private TestnotesService testnotesService;
	public void savetrackingtestAndupdatetestnotes(Trackingtest trackingtest) {
		// TODO Auto-generated method stub
		
		
	this.saveAndRefresh(trackingtest);
	

	Testnotes testnotes = trackingtest.getTestnotes();
	testnotes.setTracktestId(1);
	testnotesService.saveOrUpdate(testnotes);
	}
	@Resource
	public void setTestnotesService(TestnotesService testnotesService) {
		this.testnotesService = testnotesService;
	}
	public TestnotesService getTestnotesService() {
		return testnotesService;
	}

}
