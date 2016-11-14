package com.fjsdfx.starerp.warehouse.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ItemTypeService;
import com.fjsdfx.starerp.persons.model.Employee;
import com.fjsdfx.starerp.purchase.model.Quaprolist;
import com.fjsdfx.starerp.purchase.model.Requisitions;
import com.fjsdfx.starerp.purchase.model.Resgood;
import com.fjsdfx.starerp.purchase.service.RequisitionsService;
import com.fjsdfx.starerp.purchase.service.ResgoodService;
import com.fjsdfx.starerp.security.model.User;
import com.fjsdfx.starerp.warehouse.model.Feedexamine;
import com.fjsdfx.starerp.warehouse.model.Feegood;
import com.fjsdfx.starerp.warehouse.service.FeedexamineService;
import com.fjsdfx.starerp.warehouse.service.FeegoodService;
import com.opensymphony.xwork2.validator.annotations.RegexFieldValidator;

@Service
@Transactional
public class FeedexamineServiceImpl extends BaseServiceImpl<Feedexamine>
		implements FeedexamineService {



	private FeegoodService feegoodService;


	private ItemTypeService itemTypeService; 
	
private Requisitions requisitions;
	
	private RequisitionsService requisitionsService;
	
	private List<Resgood> resgoods;
	
	private ResgoodService resgoodService;
	
	
	
	public Requisitions getRequisitions() {
		return requisitions;
	}
	public void setRequisitions(Requisitions requisitions) {
		this.requisitions = requisitions;
	}
	public RequisitionsService getRequisitionsService() {
		return requisitionsService;
	}
	@Resource
	public void setRequisitionsService(RequisitionsService requisitionsService) {
		this.requisitionsService = requisitionsService;
	}

	public List<Resgood> getResgoods() {
		return resgoods;
	}
	public void setResgoods(List<Resgood> resgoods) {
		this.resgoods = resgoods;
	}
	public ResgoodService getResgoodService() {
		return resgoodService;
	}
	@Resource
	public void setResgoodService(ResgoodService resgoodService) {
		this.resgoodService = resgoodService;
	}
	

	public FeegoodService getFeegoodService() {
		return feegoodService;
	}


	public ItemTypeService getItemTypeService() {
		return itemTypeService;
	}
	
	@Resource
	public void setFeegoodService(FeegoodService feegoodService) {
		this.feegoodService = feegoodService;
	}


	@Resource
	public void setItemTypeService(ItemTypeService itemTypeService) {
		this.itemTypeService = itemTypeService;
	}
	
	/**
	 * 核对数量
	 */
	public void confirm(Integer feedexamineId,User whmanager, List<Boolean> confirmnums, List<Integer> factnos) {
		// TODO Auto-generated method stub
		Feedexamine feedexamine = this.findById(Feedexamine.class, feedexamineId);
		List<Feegood>feegoods = feegoodService.findByHql("from Feegood f where f.feedexamine.fee_id="+feedexamineId);
		for(int i = 0; i<feegoods.size(); i ++){
			if(confirmnums.get(i)!=null){
				feegoods.get(i).setConfirmnum(confirmnums.get(i));
			}
			else if(factnos.get(i)!=null){
				feegoods.get(i).setFactno(factnos.get(i));
			}
			Feegood feegood = feegoods.get(i);
			this.saveOrUpdate(feegood);
			
		}
		
		feedexamine.setConfirm(true);
		feedexamine.setWhmanager(whmanager.getEmployee());
		this.saveOrUpdate(feedexamine);
	}

	/**
	 * 删除
	 */
	public void delfeexexamine(Integer feedexamineId) {
		// TODO Auto-generated method stub
		List<Feegood>feegoods = feegoodService.findByHql("from Feegood fg where fg.feedexamine.fee_id="+ feedexamineId);
		for(int i = 0; i<feegoods.size(); i++){
			feegoodService.delete(feegoods.get(i));
		}
		this.deleteById(Feedexamine.class, feedexamineId);
	}

	/**
	 * 检验
	 */
	public void examinefeedexamine(Integer feedexamineId, User finspector,
			List<Integer> factnos, List<Boolean> exresults) {
		// TODO Auto-generated method stub
		Feedexamine feedexamine = this.findById(Feedexamine.class, feedexamineId);
		List<Feegood>feegoods = feegoodService.findByHql("from Feegood f where f.feedexamine.fee_id="+feedexamineId);
		for(int i = 0; i<feegoods.size(); i++){
			Feegood feegood = feegoods.get(i);
			if(!factnos.isEmpty()){
				feegood.setFactno(factnos.get(i));
			}
			else{
				feegood.setFactno(feegoods.get(i).getFpnum());
			}
			if(!exresults.isEmpty()){
				feegood.setExresult(exresults.get(i));
				feegoodService.saveOrUpdate(feegood);
				feegoodService.saveOrUpdate(feegood);
			}
		}
		if(finspector != null){
			feedexamine.setFinspector(finspector.getEmployee());
		}
		this.saveOrUpdate(feedexamine);
		
	}


	

	/**
	 * 添加
	 */
	public void save(Feedexamine feedexamine, List<Integer> bsnos,
			List<Integer> itemTypeIds, List<Integer> fpnums, List<String> fnotes) {
		// TODO Auto-generated method stub
	//	System.out.println("33333------"+feedexamine.getSupplier().getSupplierinfo().getSupcname());
		
			this.saveAndRefresh(feedexamine);
			feegoodService.savefeegoods(feedexamine, bsnos, itemTypeIds,
					fpnums, fnotes);
	}


	

	/**
	 * 更新
	 */
	public void updatefeedexamine(Feedexamine feedexamine, List<Integer> bsnos,
			List<Integer> itemTypeIds, List<Integer> fpnums, List<String> fnotes) {
		// TODO Auto-generated method stub
		feegoodService.updatefeegoods(feedexamine,bsnos,itemTypeIds,fpnums,fnotes);
	}

}
