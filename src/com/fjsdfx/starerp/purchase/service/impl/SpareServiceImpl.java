package com.fjsdfx.starerp.purchase.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.purchase.dao.SpareDao;
import com.fjsdfx.starerp.purchase.model.Spare;
import com.fjsdfx.starerp.purchase.service.SpareService;

@Service
@Transactional
public class SpareServiceImpl  extends BaseServiceImpl<Spare> implements SpareService{
	
	private SpareDao spareDao;

	public SpareDao getSpareDao() {
		return spareDao;
	}

	@Resource(name="spareDaoImpl")
	public void setSpareDao(SpareDao spareDao) {
		this.spareDao = spareDao;
	}
	
	public List<Spare> getAllSpares()
	{
		return spareDao.getAllSpares();
	}
	
	/* (non-Javadoc)
	 * 通过ID集合获得Item集合
	 * @see com.fjsdfx.starerp.item.service.ItemService#getItemsByIds(java.util.List)
	 */
	public List<Spare> getSparesByIds(List<Integer> ids)
	{
		
		List<Spare> spares=new ArrayList();
	
	if(!ids.isEmpty())
	{
					
		for(Integer id:ids)
		{
			if(null!=id)
				spares.add(this.findById(Spare.class, id));
			
			else if(null==id)
			{
				spares.add(null);
			}
		}
		
	
	}
		return spares;		
		}

}
