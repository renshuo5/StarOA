package com.fjsdfx.starerp.purchase.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.purchase.dao.SupidentifiedDao;
import com.fjsdfx.starerp.purchase.model.Supidentified;
import com.fjsdfx.starerp.purchase.service.SupidentifiedService;

@Service
@Transactional
public class SupidentifiedServiceImpl  extends BaseServiceImpl<Supidentified> implements SupidentifiedService{
	
	private SupidentifiedDao supidentifiedDao;

	public SupidentifiedDao getSupidentifiedDao() {
		return supidentifiedDao;
	}

	@Resource(name="supidentifiedDaoImpl")
	public void setSupidentifiedDao(SupidentifiedDao supidentifiedDao) {
		this.supidentifiedDao = supidentifiedDao;
	}
	
	public List<Supidentified> getAllSupidentifieds()
	{
		return supidentifiedDao.getAllSupidentifieds();
	}
	
	/* (non-Javadoc)
	 * 通过ID集合获得Item集合
	 * @see com.fjsdfx.starerp.item.service.ItemService#getItemsByIds(java.util.List)
	 */
	public List<Supidentified> getSupidentifiedsByIds(List<Integer> ids)
	{
		
		List<Supidentified> supidentifieds=new ArrayList();
	
	if(!ids.isEmpty())
	{
					
		for(Integer id:ids)
		{
			if(null!=id)
				supidentifieds.add(this.findById(Supidentified.class, id));
			
			else if(null==id)
			{
				supidentifieds.add(null);
			}
		}
		
	
	}
		return supidentifieds;		
		}

}
