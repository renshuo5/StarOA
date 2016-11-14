package com.fjsdfx.starerp.warehouse.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ItemTypeService;
import com.fjsdfx.starerp.security.model.User;
import com.fjsdfx.starerp.warehouse.model.Picgood;
import com.fjsdfx.starerp.warehouse.model.Requisition;
import com.fjsdfx.starerp.warehouse.model.Rewgood;
import com.fjsdfx.starerp.warehouse.service.InventoryService;
import com.fjsdfx.starerp.warehouse.service.MaccountingService;
import com.fjsdfx.starerp.warehouse.service.PicgoodService;
import com.fjsdfx.starerp.warehouse.service.RequisitionService;
import com.fjsdfx.starerp.warehouse.service.StockService;
import com.sun.org.apache.commons.digester.rss.Image;


@Service
@Transactional
public class PicgoodServiceImpl extends BaseServiceImpl<Picgood> implements PicgoodService{
	
	private ItemTypeService itemTypeService;

	private RequisitionService requisitionService;
	
	private StockService stockService;
	
	private MaccountingService maccountingService;
	
	private InventoryService inventoryService;
	

	public StockService getStockService() {
		return stockService;
	}

	@Resource
	public void setStockService(StockService stockService) {
		this.stockService = stockService;
	}

	public MaccountingService getMaccountingService() {
		return maccountingService;
	}

	@Resource
	public void setMaccountingService(MaccountingService maccountingService) {
		this.maccountingService = maccountingService;
	}

	public InventoryService getInventoryService() {
		return inventoryService;
	}

	@Resource
	public void setInventoryService(InventoryService inventoryService) {
		this.inventoryService = inventoryService;
	}

	public RequisitionService getRequisitionService() {
		return requisitionService;
	}

	@Resource
	public void setRequisitionService(RequisitionService requisitionService) {
		this.requisitionService = requisitionService;
	}


	public ItemTypeService getItemTypeService() {
		return itemTypeService;
	}


	@Resource
	public void setItemTypeService(ItemTypeService itemTypeService) {
		this.itemTypeService = itemTypeService;
	}

	/**
	 * 添加
	 */
	public void savepicgoods(Requisition requisition,
			List<Integer> itemTypeIds, List<String> calunits,
			List<Integer> reqnums, List<Float> ruprices, 
			List<String> userfs) {
		requisitionService.saveAndRefresh(requisition);
		for(int i  = 0; i<itemTypeIds.size(); i++){
			if (itemTypeIds.get(i)!=null&&ruprices.get(i)!=null&&calunits.get(i)!=null&&reqnums!=null) {
				Picgood picgood = new Picgood();
				picgood.setRequisition(requisition);
				picgood.setItemType(itemTypeService.findById(ItemType.class,
						itemTypeIds.get(i)));
				picgood.setCalunit(calunits.get(i));
				picgood.setReqnum(reqnums.get(i));
				picgood.setRuprice(ruprices.get(i));
				picgood.setRprice(reqnums.get(i)*ruprices.get(i));
				picgood.setUserf(userfs.get(i));
				this.saveAndRefresh(picgood);
			}
		}
	}

	/**
	 * 更新
	 */
	public void updatepicgoods(Requisition requisition,
			List<Integer> itemTypeIds, List<String> calunits,
			List<Integer> reqnums, List<Float> ruprices, List<Float> rprices,
			List<String> userfs) {
		// TODO Auto-generated method stub

		for(int i=0;i<itemTypeIds.size();i++)
		{
			
			if(null==itemTypeIds.get(i))
			{
				itemTypeIds.remove(i);
				calunits.remove(i);
				reqnums.remove(i);
				ruprices.remove(i);
				rprices.remove(i);
				userfs.remove(i);
			}	
		}
		
		List<Picgood> picgoods = this.findByHql("from Picgood p where p.requisition.req_id="+requisition.getReq_id());
		for(Picgood p:picgoods)
		{
			this.delete(p);
		}
		for(int i  = 0; i<itemTypeIds.size(); i++){
			if (itemTypeIds.get(i)!=null&&ruprices.get(i)!=null&&calunits.get(i)!=null&&reqnums!=null) {
				Picgood picgood2 = new Picgood();
				picgood2.setRequisition(requisition);
				picgood2.setItemType(itemTypeService.findById(ItemType.class,
						itemTypeIds.get(i)));
				picgood2.setCalunit(calunits.get(i));
				picgood2.setReqnum(reqnums.get(i));
				picgood2.setRuprice(ruprices.get(i));
				picgood2.setRprice(reqnums.get(i)*ruprices.get(i));
				picgood2.setUserf(userfs.get(i));
				this.saveAndRefresh(picgood2);
			}
		}
		
		
	}

	/**
	 * 删除
	 */
	public void delpicgoods(Integer requisitionId) {
		List<Picgood>picgoods = this.findByHql("from Picgood p where p.requisition.req_id="+requisitionId);
		for(int i = 0; i<picgoods.size(); i++){
			this.delete( picgoods.get(i));
		}
		requisitionService.deleteById(Requisition.class, requisitionId);
	}

	/**
	 * 检验
	 */
	public void examine(Integer requisitionId, List<Integer> factnums,
			User confirmper, Date deliverDate) {
		Requisition requisition=requisitionService.findById(Requisition.class, requisitionId);
		List<Picgood>picgoods = this.findByHql("from Picgood pg where pg.requisition.req_id="+requisitionId);
			for(int i = 0; i<factnums.size(); i++){
				picgoods.get(i).setFactnum(factnums.get(i));
				this.saveOrUpdate(picgoods.get(i));
			}
			if(confirmper !=null &&deliverDate !=null){
			requisition.setConfirmper(confirmper.getEmployee());
			requisition.setDeliverDate(deliverDate);
			}
	
		this.saveOrUpdate(requisition);
		for(int i = 0; i<picgoods.size(); i++){
			stockService.subNumber(picgoods.get(i).getItemType(), picgoods.get(i).getFactnum());
			maccountingService.addOutNumber(requisition.getDeliverDate(), picgoods.get(i).getItemType(), picgoods.get(i).getFactnum());
			inventoryService.addWsNumber(picgoods.get(i).getItemType(), picgoods.get(i).getFactnum());
		}		
	}
}
