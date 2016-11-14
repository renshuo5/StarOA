package com.fjsdfx.starerp.purchase.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.purchase.dao.SamidentifiedDao;
import com.fjsdfx.starerp.purchase.model.Samidentified;
import com.fjsdfx.starerp.purchase.service.SamidentifiedService;

@Service
@Transactional
public class SamidentifiedServiceImpl  extends BaseServiceImpl<Samidentified> implements SamidentifiedService{
	
	private SamidentifiedDao samidentifiedDao;

	public SamidentifiedDao getSamidentifiedDao() {
		return samidentifiedDao;
	}

	@Resource(name="samidentifiedDaoImpl")
	public void setSamidentifiedDao(SamidentifiedDao samidentifiedDao) {
		this.samidentifiedDao = samidentifiedDao;
	}
	
	public List<Samidentified> getAllSamidentifieds()
	{
		return samidentifiedDao.getAllSamidentifieds();
	}
	
	/* (non-Javadoc)
	 * 通过ID集合获得Item集合
	 * @see com.fjsdfx.starerp.item.service.ItemService#getItemsByIds(java.util.List)
	 */
	public List<Samidentified> getSamidentifiedsByIds(List<Integer> ids)
	{
		
		List<Samidentified> samidentifieds=new ArrayList();
	
	if(!ids.isEmpty())
	{
					
		for(Integer id:ids)
		{
			if(null!=id)
				samidentifieds.add(this.findById(Samidentified.class, id));
			
			else if(null==id)
			{
				samidentifieds.add(null);
			}
		}
		
	
	}
		return samidentifieds;		
		}

}
