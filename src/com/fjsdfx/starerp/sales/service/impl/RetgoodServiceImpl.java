package com.fjsdfx.starerp.sales.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ItemTypeService;
import com.fjsdfx.starerp.sales.model.Retgood;
import com.fjsdfx.starerp.sales.model.Returned;
import com.fjsdfx.starerp.sales.model.Shi1good;
import com.fjsdfx.starerp.sales.model.Unqmessage;
import com.fjsdfx.starerp.sales.model.Unqualified;
import com.fjsdfx.starerp.sales.service.RetgoodService;
import com.fjsdfx.starerp.sales.service.ReturnedService;
import com.fjsdfx.starerp.sales.service.UnqmessageService;
import com.fjsdfx.starerp.sales.service.UnqualifiedService;


@Service
@Transactional
public class RetgoodServiceImpl  extends BaseServiceImpl<Retgood>  implements RetgoodService{

	private ReturnedService returnedService;
	
	private List<Unqualified> unqualifieds;
	
	private List<Unqmessage> unqmessages;
	
	private UnqualifiedService unqualifiedService;
	
	private UnqmessageService unqmessageService;
	
	private List<Retgood> retgoods;
	
	
	
	
	public List<Unqualified> getUnqualifieds() {
		return unqualifieds;
	}
	public void setUnqualifieds(List<Unqualified> unqualifieds) {
		this.unqualifieds = unqualifieds;
	}
	public List<Unqmessage> getUnqmessages() {
		return unqmessages;
	}
	public void setUnqmessages(List<Unqmessage> unqmessages) {
		this.unqmessages = unqmessages;
	}
	public UnqualifiedService getUnqualifiedService() {
		return unqualifiedService;
	}
	@Resource
	public void setUnqualifiedService(UnqualifiedService unqualifiedService) {
		this.unqualifiedService = unqualifiedService;
	}
	public UnqmessageService getUnqmessageService() {
		return unqmessageService;
	}
	@Resource
	public void setUnqmessageService(UnqmessageService unqmessageService) {
		this.unqmessageService = unqmessageService;
	}
	public List<Retgood> getRetgoods() {
		return retgoods;
	}
	public void setRetgoods(List<Retgood> retgoods) {
		this.retgoods = retgoods;
	}
	public ReturnedService getReturnedService() {
		return returnedService;
	}
@Resource
	public void setReturnedService(ReturnedService returnedService) {
		this.returnedService = returnedService;
	}

	private ItemTypeService itemTypeService;
		
		private Integer itemTypeId;
		
		public Integer getItemTypeId() {
			return itemTypeId;
		}

		public void setItemTypeId(Integer itemTypeId) {
			this.itemTypeId = itemTypeId;
		}

		public ItemTypeService getItemTypeService() {
			return itemTypeService;
		}

		@Resource
		public void setItemTypeService(ItemTypeService itemTypeService) {
			this.itemTypeService = itemTypeService;
		}
		
		
	
	
	public void saveretgoods(Returned returned, List<Integer> itemTypeIds,
			List<Integer> retnos) {
		// TODO Auto-generated method stub
		returnedService.saveAndRefresh(returned);
		if (itemTypeIds.size()!=0 ) {
		for(int i= 0; i<itemTypeIds.size();i++){
			if (itemTypeIds.get(i)!=null&&retnos.get(i)!=null) {
				Retgood retgood = new Retgood();
				retgood.setReturned(returned);
				retgood.setRetno(retnos.get(i));
				retgood.setItemType(itemTypeService.findById(ItemType.class, itemTypeIds.get(i)));
				this.saveAndRefresh(retgood);
			}
		}
		}
	}

	public void updateretgoods(Returned returned, List<Integer> itemTypeIds,
			List<Integer> retnos) {
		// TODO Auto-generated method stub
        Retgood retgood = new Retgood();
		 if(itemTypeIds!=null){
		 for(int i=0;i<itemTypeIds.size();i++)
			{
				if(null==itemTypeIds.get(i))
				{
					itemTypeIds.remove(i);
					retnos.remove(i);
				}	
			}
		 List<Retgood> retgoods = this.findByHql("from Retgood s where s.returned.retid="+ returned.getRetid());
			for(Retgood s:retgoods)
			{
				this.delete(s);
			}
			this.saveretgoods(returned, itemTypeIds, retnos);
		 }
	}

	public void deleteregoods(List<Retgood> retgoods) {
		// TODO Auto-generated method stub
		for(int i=0; i<retgoods.size();i++){
			this.delete(retgoods.get(i));
		}
	}
	public void delall(Integer returnedId) {
		// TODO Auto-generated method stub
        unqualifieds=unqualifiedService.findByHql("from Unqualified un where un.returned.retid ="+returnedId);
		unqmessages=unqmessageService.findByHql("from Unqmessage us where us.unqualified.unq_id in (select un.unq_id from Unqualified un where un.returned.retid ="+returnedId+" )");
		unqmessageService.deleteunqmessages(unqmessages);
		for(int i=0;i<unqualifieds.size();i++){
			unqualifiedService.delete(unqualifieds.get(i));
		}
		retgoods = this.findByHql("from Retgood s1g where s1g.returned.retid ="+returnedId);
		this.deleteregoods(retgoods);
		returnedService.deleteById(Returned.class, returnedId);
	}

	
	
}
