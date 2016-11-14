package com.fjsdfx.starerp.purchase.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.purchase.dao.SupplierinfoDao;
import com.fjsdfx.starerp.purchase.model.Supplierinfo;
import com.fjsdfx.starerp.purchase.service.SupplierinfoService;

@Service
@Transactional
public class SupplierinfoServiceImpl  extends BaseServiceImpl<Supplierinfo> implements SupplierinfoService{
	
	private SupplierinfoDao supplierinfoDao;

	public SupplierinfoDao getSupplierinfoDao() {
		return supplierinfoDao;
	}

	@Resource(name="supplierinfoDaoImpl")
	public void setSupplierinfoDao(SupplierinfoDao supplierinfoDao) {
		this.supplierinfoDao = supplierinfoDao;
	}
	
	public List<Supplierinfo> getAllSupplierinfos()
	{
		return supplierinfoDao.getAllSupplierinfos();
	}
	
	/* (non-Javadoc)
	 * 通过ID集合获得Item集合
	 * @see com.fjsdfx.starerp.item.service.ItemService#getItemsByIds(java.util.List)
	 */
	public List<Supplierinfo> getSupplierinfosByIds(List<Integer> ids)
	{
		
		List<Supplierinfo> supplierinfos=new ArrayList();
	
	if(!ids.isEmpty())
	{
					
		for(Integer id:ids)
		{
			if(null!=id)
				supplierinfos.add(this.findById(Supplierinfo.class, id));
			
			else if(null==id)
			{
				supplierinfos.add(null);
			}
		}
		
	
	}
		return supplierinfos;		
		}

}
