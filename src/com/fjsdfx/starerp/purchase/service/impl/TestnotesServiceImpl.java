package com.fjsdfx.starerp.purchase.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.purchase.dao.TestnotesDao;
import com.fjsdfx.starerp.purchase.model.Testnotes;
import com.fjsdfx.starerp.purchase.service.TestnotesService;

@Service
@Transactional
public class TestnotesServiceImpl  extends BaseServiceImpl<Testnotes> implements TestnotesService{
	
	private TestnotesDao testnotesDao;

	public TestnotesDao getTestnotesDao() {
		return testnotesDao;
	}

	@Resource(name="testnotesDaoImpl")
	public void setTestnotesDao(TestnotesDao testnotesDao) {
		this.testnotesDao = testnotesDao;
	}
	
	public List<Testnotes> getAllTestnotess()
	{
		return testnotesDao.getAllTestnotess();
	}
	
	/* (non-Javadoc)
	 * 通过ID集合获得Item集合
	 * @see com.fjsdfx.starerp.item.service.ItemService#getItemsByIds(java.util.List)
	 */
	public List<Testnotes> getTestnotessByIds(List<Integer> ids)
	{
		
		List<Testnotes> testnotess=new ArrayList();
	
	if(!ids.isEmpty())
	{
		for(Integer id:ids)
		{
			if(null!=id)
				testnotess.add(this.findById(Testnotes.class, id));
			
			else if(null==id)
			{
				testnotess.add(null);
			}
		}
		
	
	}
		return testnotess;		
		}

}
