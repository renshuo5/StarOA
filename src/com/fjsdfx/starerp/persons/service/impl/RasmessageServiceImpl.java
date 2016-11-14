package com.fjsdfx.starerp.persons.service.impl;



import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.persons.dao.RasmessageDao;
import com.fjsdfx.starerp.persons.model.Rasmessage;
import com.fjsdfx.starerp.persons.service.RasmessageService;

@Service      //注入到spring的IOC
@Transactional    
public class RasmessageServiceImpl  extends BaseServiceImpl<Rasmessage> implements RasmessageService{

	private RasmessageDao rasmessageDao;

	public RasmessageDao getRasmessageDao() {
		return rasmessageDao;
	}

	@Resource
	public void setRasmessageDao(RasmessageDao rasmessageDao) {
		this.rasmessageDao = rasmessageDao;
	}
	
	public String getMessg(int id){
		List<Rasmessage> lists= rasmessageDao.findByHql("from Rasmessage o where o.rper.id="+id+" and o.fla3='0' and o.rasstatus='0' ");
		
		if(lists.size()>0){
			return "0";
		}else{
			return "1";
		}
	
	}
}
