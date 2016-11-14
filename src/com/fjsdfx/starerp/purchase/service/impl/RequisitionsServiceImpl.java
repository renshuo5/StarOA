package com.fjsdfx.starerp.purchase.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.purchase.dao.RequisitionsDao;
import com.fjsdfx.starerp.purchase.model.Requisitions;
import com.fjsdfx.starerp.purchase.service.RequisitionsService;

@Service
@Transactional
public class RequisitionsServiceImpl  extends BaseServiceImpl<Requisitions> implements RequisitionsService{
	
	private RequisitionsDao requisitionsDao;

	public RequisitionsDao getRequisitionsDao() {
		return requisitionsDao;
	}

	@Resource(name="requisitionsDaoImpl")
	public void setRequisitionsDao(RequisitionsDao requisitionsDao) {
		this.requisitionsDao = requisitionsDao;
	}
	
	public List<Requisitions> getAllRequisitionss()
	{
		return requisitionsDao.getAllRequisitionss();
	}
	
	/* (non-Javadoc)
	 * 通过ID集合获得Item集合
	 * @see com.fjsdfx.starerp.item.service.ItemService#getItemsByIds(java.util.List)
	 */
	public List<Requisitions> getRequisitionssByIds(List<Integer> ids)
	{
		
		List<Requisitions> requisitionss=new ArrayList();
	
	if(!ids.isEmpty())
	{
					
		for(Integer id:ids)
		{
			if(null!=id)
				requisitionss.add(this.findById(Requisitions.class, id));
			
			else if(null==id)
			{
				requisitionss.add(null);
			}
		}
		
	
	}
		return requisitionss;		
		}

}
