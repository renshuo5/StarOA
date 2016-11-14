package com.fjsdfx.starerp.produce.service.impl;


import java.util.Date;
import java.util.List;

import javax.annotation.Resource;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ItemTypeService;

import com.fjsdfx.starerp.produce.model.Pergood;
import com.fjsdfx.starerp.produce.model.Preparation;
import com.fjsdfx.starerp.produce.model.Pro_schedule;
import com.fjsdfx.starerp.produce.model.Prscheck;
import com.fjsdfx.starerp.produce.service.PergoodService;
import com.fjsdfx.starerp.produce.service.Pro_scheduleService;
import com.fjsdfx.starerp.produce.service.PrscheckService;
import com.fjsdfx.starerp.produce.service.PreparationService;

@Service
@Transactional
public class Pro_scheduleServiceImpl  extends BaseServiceImpl<Pro_schedule> implements Pro_scheduleService{

	private PrscheckService prscheckService;
	
	private Preparation preparation;
	
	private List<Pergood> pergoods;
	
	private PergoodService pergoodService;
	
	private ItemTypeService itemTypeService;
	
	private ItemType itemType;
	


public ItemTypeService getItemTypeService() {
		return itemTypeService;
	}
@Resource
	public void setItemTypeService(ItemTypeService itemTypeService) {
		this.itemTypeService = itemTypeService;
	}

public Preparation getPreparation() {
		return preparation;
	}

	public void setPreparation(Preparation preparation) {
		this.preparation = preparation;
	}

private PreparationService preparationService;	


public PreparationService getPreparationService() {
	return preparationService;
}

@Resource
public void setPreparationService(PreparationService preparationService) {
	this.preparationService = preparationService;
}


public PrscheckService getPrscheckService() {
		return prscheckService;
	}


@Resource
	public void setPrscheckService(PrscheckService prscheckService) {
		this.prscheckService = prscheckService;
	}


	public void saveproschedules(Prscheck prscheck,List<Date> cdates,List<String> pcontents,List<String> pnotes,List<Integer> pnumbers,List<String> punits,Integer addplan,List<Integer> itemTypeids){


		System.out.println("---------------------"+addplan);
		prscheck.setPreparation(preparationService.findById(Preparation.class, addplan));
		
			if (prscheck.getDepartment().getId()!=null) {
				prscheckService.saveAndRefresh(prscheck);
			}
			for (int i = 0; i < itemTypeids.size(); i++) {
				
					Pro_schedule ps=new Pro_schedule();
					if (itemTypeids.get(i)!=null&&pcontents.get(i)!=null) {
						itemType=itemTypeService.findById(ItemType.class, itemTypeids.get(i));
					
				
				
					String string=itemType.getItem().getName()+itemType.getName();
					
					
					
						ps.setItemType(itemType);
					
					ps.setPrscheck(prscheck);
					ps.setCdate(cdates.get(i));
					ps.setPcontent(string);
					ps.setPnote(pnotes.get(i));
					ps.setPnumber(pnumbers.get(i));
					ps.setPunit(punits.get(i));
				
					this.saveAndRefresh(ps);
				}
					
					System.out.println("ps_________________>"+ps.getPrs_id());
		
				
		
			}
			
		
	}
	public void delproschedules(Prscheck prscheck)
	{
		

		List<Pro_schedule> proSchedules=this.getPagerDesc(Pro_schedule.class, "where o.prscheck.id ="+prscheck.getId()).getDatas();
		
		for (int i = 0; i < proSchedules.size(); i++) {
			this.deleteById(Pro_schedule.class, proSchedules.get(i).getPrs_id());
		
		}
	  
		prscheckService.deleteById(Prscheck.class, prscheck.getId());
		

	}
		
	public void updateschedules(Prscheck prscheck,List<Date> cdates,List<String> pcontents,List<String> pnotes,List<Integer> pnumbers,List<String> punits,List<Integer> itemTypeids){
		

		prscheckService.update(prscheck);
		
    List<Pro_schedule> proSchedules=this.getPagerDesc(Pro_schedule.class, "where o.prscheck.id ="+prscheck.getId()).getDatas();
		
		for (int i = 0; i < proSchedules.size(); i++) {
			this.deleteById(Pro_schedule.class, proSchedules.get(i).getPrs_id());
		
		}
		Integer addplan=1;
		
		
		

		for (int i = 0; i < itemTypeids.size(); i++) {
			if (itemTypeids.get(i)!=null) {
			Pro_schedule ps=new Pro_schedule();
			
			itemType=itemTypeService.findById(ItemType.class, itemTypeids.get(i));
			
			String string=itemType.getItem().getName()+itemType.getName();
			
			
			ps.setItemType(itemType);
			ps.setPrscheck(prscheck);
			ps.setCdate(cdates.get(i));
			ps.setPcontent(string);
			ps.setPnote(pnotes.get(i));
		
			ps.setPnumber(pnumbers.get(i));
			ps.setPunit(punits.get(i));
		
			this.saveAndRefresh(ps);
			System.out.println("ps_________________>"+ps.getPrs_id());

		

	}
		
	}
	}


@Resource
	public void setPergoodService(PergoodService pergoodService) {
		this.pergoodService = pergoodService;
	}

	public PergoodService getPergoodService() {
		return pergoodService;
	}
	
}
