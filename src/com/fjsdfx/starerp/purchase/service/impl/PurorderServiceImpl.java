package com.fjsdfx.starerp.purchase.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.purchase.dao.PurorderDao;
import com.fjsdfx.starerp.purchase.model.Purorder;
import com.fjsdfx.starerp.purchase.service.PurorderService;

@Service
@Transactional
public class PurorderServiceImpl  extends BaseServiceImpl<Purorder> implements PurorderService{
	
	private PurorderDao purorderDao;

	public PurorderDao getPurorderDao() {
		return purorderDao;
	}

	@Resource(name="purorderDaoImpl")
	public void setPurorderDao(PurorderDao purorderDao) {
		this.purorderDao = purorderDao;
	}
	
	public List<Purorder> getAllPurorders()
	{
		return purorderDao.getAllPurorders();
	}
	
	/* (non-Javadoc)
	 * 通过ID集合获得Item集合
	 * @see com.fjsdfx.starerp.item.service.ItemService#getItemsByIds(java.util.List)
	 */
	public List<Purorder> getPurordersByIds(List<Integer> ids)
	{
		
		List<Purorder> purorders=new ArrayList();
	
	if(!ids.isEmpty())
	{
					
		for(Integer id:ids)
		{
			if(null!=id)
				purorders.add(this.findById(Purorder.class, id));
			
			else if(null==id)
			{
				purorders.add(null);
			}
		}
		
	
	}
		return purorders;		
		}

}
