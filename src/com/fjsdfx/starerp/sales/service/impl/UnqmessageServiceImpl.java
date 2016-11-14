package com.fjsdfx.starerp.sales.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ItemTypeService;
import com.fjsdfx.starerp.sales.model.Shi2good;
import com.fjsdfx.starerp.sales.model.Unqmessage;
import com.fjsdfx.starerp.sales.model.Unqualified;
import com.fjsdfx.starerp.sales.service.UnqmessageService;


@Service
@Transactional
public class UnqmessageServiceImpl  extends BaseServiceImpl<Unqmessage>  implements UnqmessageService{

	
	private ItemTypeService itemTypeService;
	
	private Integer itemTypeId;
	
	private List<Unqmessage> unqmessages;
	
	
	public List<Unqmessage> getUnqmessages() {
		return unqmessages;
	}


	public void setUnqmessages(List<Unqmessage> unqmessages) {
		this.unqmessages = unqmessages;
	}


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
	
	
	public void deleteunqmessages(List<Unqmessage> unqmessages) {
		// TODO Auto-generated method stub
		for(int i=0; i<unqmessages.size();i++){
			this.delete(unqmessages.get(i));
		}
	}

	public void saveunqumessages(Unqualified unqualified,
		    List<String> unmcode,
			List<String> unmstatus, List<Date> fdate, List<String> bdepartment) {
		// TODO Auto-generated method stub
        for(int i= 0; i<unmcode.size();i++){
			
			System.out.print("-----------------------"+"itemTypeId");
			if (unmcode.get(i)!=null) {
				Unqmessage unqmessage = new Unqmessage();
				unqmessage.setUnqualified(unqualified);
				unqmessage.setUnmcode(unmcode.get(i));
				unqmessage.setFdate(fdate.get(i));
				unqmessage.setUnmstatus(unmstatus.get(i));
				unqmessage.setBdepartment(bdepartment.get(i));
				this.saveAndRefresh(unqmessage);
			}
		
        }
	}

}
