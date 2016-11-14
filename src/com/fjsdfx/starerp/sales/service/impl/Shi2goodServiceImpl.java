package com.fjsdfx.starerp.sales.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.security.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.model.ItemRelation;
import com.fjsdfx.starerp.item.service.ItemTypeService;
import com.fjsdfx.starerp.persons.model.Employee;
import com.fjsdfx.starerp.sales.model.Shi2good;
import com.fjsdfx.starerp.sales.model.Shinote2;
import com.fjsdfx.starerp.sales.service.Shi2goodService;
import com.fjsdfx.starerp.sales.service.Shinote2Service;
import com.fjsdfx.starerp.security.model.User;
import com.fjsdfx.starerp.warehouse.service.MaccountingService;
import com.fjsdfx.starerp.warehouse.service.StockService;


@Service
@Transactional
public class Shi2goodServiceImpl  extends BaseServiceImpl<Shi2good>  implements Shi2goodService{

	
	private ItemTypeService itemTypeService;
	
	private Integer itemTypeId;
	
	private Shinote2 shinote2;
	
	private Shinote2Service shinote2Service;
	
	private List<Shi2good> shi2goods;
	
	private Shi2good shi2good;
	
	private StockService stockService;
	
	private MaccountingService maccountingService;
	
	
	
	public Shinote2 getShinote2() {
		return shinote2;
	}


	public void setShinote2(Shinote2 shinote2) {
		this.shinote2 = shinote2;
	}


	public Shinote2Service getShinote2Service() {
		return shinote2Service;
	}

@Resource
	public void setShinote2Service(Shinote2Service shinote2Service) {
		this.shinote2Service = shinote2Service;
	}


	public List<Shi2good> getShi2goods() {
		return shi2goods;
	}


	public void setShi2goods(List<Shi2good> shi2goods) {
		this.shi2goods = shi2goods;
	}


	public Shi2good getShi2good() {
		return shi2good;
	}


	public void setShi2good(Shi2good shi2good) {
		this.shi2good = shi2good;
	}


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

	/**
	 * 添加方法
	 */
	public void savesh2goods(Shinote2 shinote2, List<Integer> orderids,
			List<Integer> itemTypeIds, List<Integer> shi2nos,
			List<Integer> shi2no2s, List<String> shi2notes) {
		// TODO Auto-generated method stub
		/*ItemType itemType=itemTypeService.findById(ItemType.class, itemTypeId);*/
		if(itemTypeIds!=null && shi2no2s!=null){
			shinote2Service.saveAndRefresh(shinote2);
		for(int i= 0; i<itemTypeIds.size();i++){
			
			if (itemTypeIds.get(i)!=null&&shi2nos.get(i)!=null) {
				System.out.print("-----------------------" + "itemTypeId");
				Shi2good shi2good = new Shi2good();
				shi2good.setShinote2(shinote2);
				shi2good.setOrderid(orderids.get(i));
				shi2good.setShi2no(shi2nos.get(i));
				shi2good.setShi2no2(shi2no2s.get(i));
				shi2good.setShi2note(shi2notes.get(i));
				shi2good.setItemType(itemTypeService.findById(ItemType.class,
						itemTypeIds.get(i)));
				this.saveAndRefresh(shi2good);
			}
		}
	}
}

/**
 * 更新方法
 */
	public void updatesh2goods(Shinote2 shinote2, List<Integer> orderids,
			List<Integer> itemTypeIds, List<Integer> shi2nos,
			List<Integer> shi2no2s, List<String> shi2notes) {
		// TODO Auto-generated method stub
		 Shi2good shi2good = new Shi2good();
		 if(itemTypeIds!=null){
		 for(int i=0;i<itemTypeIds.size();i++)
			{
				
				if(null==itemTypeIds.get(i))
				{
					itemTypeIds.remove(i);
					orderids.remove(i);
					shi2nos.remove(i);
					shi2no2s.remove(i);
					shi2notes.remove(i);
					
				}	
			}
			
		 List<Shi2good> shi2goods = this.findByHql("from Shi2good s where s.shinote2.shi2id="+shinote2.getShi2id());
			for(Shi2good s:shi2goods)
			{
				this.delete(s);
			}
			this.savesh2goods(shinote2, orderids, itemTypeIds, shi2nos, shi2no2s, shi2notes);
		 }
		}


/**
 * 审核
 */
  public void examine(Integer shinote2Id, String schper, String storageper,
		User whmger) {
	// TODO Auto-generated method stub
	
	shinote2=shinote2Service.findById(Shinote2.class, shinote2Id);
	
	User currentUser = (User) SecurityContextHolder.getContext()
	.getAuthentication().getPrincipal();
	whmger = currentUser;
	System.out.print("------------rerereerer-------------"+shinote2Id);
		if(schper !=null)
		shinote2.setSchper(schper);
		if(storageper!=null)
		shinote2.setStorageper(storageper);
		System.out.print("-------------fdfdf-------"+whmger);
		if(whmger!=null)
			shinote2.setWhmger(whmger.getEmployee());
		if(null!= schper && null!= storageper && null!= whmger)
		{
		Date date = new Date();
		shinote2.setShi2date(date);
		}
		shinote2Service.saveOrUpdate(shinote2);
			
		shi2goods = this.findByHql("from Shi2good s2g where s2g.shinote2.shi2id="+shinote2Id);
		for(int i= 0; i<shi2goods.size();i++){
			if(shi2goods.get(i).getShinote2().getShi2id()== shinote2Id){
				shi2good = shi2goods.get(i);
				stockService.subNumber(shi2good.getItemType(), shi2good.getShi2no());
				maccountingService.addOutNumber(shinote2.getShi2date(), shi2good.getItemType(), shi2good.getShi2no());
			}
		}
}


  /**
   * 删除方法
   */

public void deleteshi2goods(List<Shi2good> shi2goods, Integer shinote2Id) {
	// TODO Auto-generated method stub
	for(int i=0; i<shi2goods.size();i++){
		this.delete(shi2goods.get(i));
	}
	shinote2Service.deleteById(Shinote2.class, shinote2Id);
}

}	

