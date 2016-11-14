package com.fjsdfx.starerp.sales.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.omg.CORBA.PRIVATE_MEMBER;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ItemTypeService;
import com.fjsdfx.starerp.sales.model.Shi1good;
import com.fjsdfx.starerp.sales.model.Shi2good;
import com.fjsdfx.starerp.sales.model.Shippingnote1;
import com.fjsdfx.starerp.sales.model.Taxboard;
import com.fjsdfx.starerp.sales.model.Taxstampingparts;
import com.fjsdfx.starerp.sales.service.Shi1goodService;
import com.fjsdfx.starerp.sales.service.Shippingnote1Service;
import com.fjsdfx.starerp.sales.service.TaxboardService;
import com.fjsdfx.starerp.sales.service.TaxstampingpartsService;
import com.fjsdfx.starerp.warehouse.service.MaccountingService;
import com.fjsdfx.starerp.warehouse.service.StockService;


@Service
@Transactional
public class Shi1goodServiceImpl  extends BaseServiceImpl<Shi1good>  implements Shi1goodService{

	
	
private ItemTypeService itemTypeService;

	private List<Shi1good> shi1goods;
	
	private List<Taxboard> taxboards;
	
	private List<Taxstampingparts> taxstampingparts2;
	
	private TaxboardService taxboardService;
	
    private TaxstampingpartsService taxstampingpartsService;
    
    private Shippingnote1Service shippingnote1Service;
    
    private Shippingnote1 shippingnote1;
    
    private StockService stockService;
	
	private MaccountingService maccountingService;
	
	private String sended;
	
	private String tax;
	
	private Shi1good shi1good;
	
	private Taxboard taxboard;
	
	

	public String getTax() {
		return tax;
	}


	public void setTax(String tax) {
		this.tax = tax;
	}


	public Shi1good getShi1good() {
		return shi1good;
	}


	public void setShi1good(Shi1good shi1good) {
		this.shi1good = shi1good;
	}


	public Taxboard getTaxboard() {
		return taxboard;
	}


	public void setTaxboard(Taxboard taxboard) {
		this.taxboard = taxboard;
	}


	public Shippingnote1 getShippingnote1() {
		return shippingnote1;
	}


	public void setShippingnote1(Shippingnote1 shippingnote1) {
		this.shippingnote1 = shippingnote1;
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


	public String getSended() {
		return sended;
	}


	public void setSended(String sended) {
		this.sended = sended;
	}


	public List<Shi1good> getShi1goods() {
		return shi1goods;
	}


	public void setShi1goods(List<Shi1good> shi1goods) {
		this.shi1goods = shi1goods;
	}


	public List<Taxboard> getTaxboards() {
		return taxboards;
	}


	public void setTaxboards(List<Taxboard> taxboards) {
		this.taxboards = taxboards;
	}


	public List<Taxstampingparts> getTaxstampingparts2() {
		return taxstampingparts2;
	}


	public void setTaxstampingparts2(List<Taxstampingparts> taxstampingparts2) {
		this.taxstampingparts2 = taxstampingparts2;
	}


	public TaxboardService getTaxboardService() {
		return taxboardService;
	}

@Resource
	public void setTaxboardService(TaxboardService taxboardService) {
		this.taxboardService = taxboardService;
	}


	public TaxstampingpartsService getTaxstampingpartsService() {
		return taxstampingpartsService;
	}

@Resource
	public void setTaxstampingpartsService(
			TaxstampingpartsService taxstampingpartsService) {
		this.taxstampingpartsService = taxstampingpartsService;
	}


	public Shippingnote1Service getShippingnote1Service() {
		return shippingnote1Service;
	}

@Resource
	public void setShippingnote1Service(Shippingnote1Service shippingnote1Service) {
		this.shippingnote1Service = shippingnote1Service;
	}


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
	
	/**
	 * 批量添加
	 */
	public void saveshi1goods(Shippingnote1 shippingnote1,
			List<Integer> itemTypeIds, List<String> shitimes,
			List<String> shi1units, List<Integer> shi1nos, List<String> shinotes) {
		// TODO Auto-generated method stub
		if (itemTypeIds.size()!=0) {
			shippingnote1Service.saveAndRefresh(shippingnote1);
		for(int i= 0; i<itemTypeIds.size();i++){
			if (itemTypeIds.get(i)!=null&&shi1nos.get(i)!=null) {
				System.out.print("-----------------------" + "itemTypeId");
				Shi1good shi1good = new Shi1good();
				shi1good.setShippingnote1(shippingnote1);
				shi1good.setShitime(shitimes.get(i));
				shi1good.setShi1no(shi1nos.get(i));
				shi1good.setShi1unit(shi1units.get(i));
				shi1good.setShinote(shinotes.get(i));
				shi1good.setItemType(itemTypeService.findById(ItemType.class,
						itemTypeIds.get(i)));
				this.saveAndRefresh(shi1good);
			}
		}
	}
}

	
    /**
     * 更新
     */
	public void updateshi1goods(Shippingnote1 shippingnote1,
			List<Integer> itemTypeIds, List<String> shitimes,
			List<String> shi1units, List<Integer> shi1nos, List<String> shinotes) {
		// TODO Auto-generated method stub
		 
		 for(int i=0;i<itemTypeIds.size();i++)
			{
				
				if(null==itemTypeIds.get(i))
				{
					itemTypeIds.remove(i);
					shitimes.remove(i);
					shi1units.remove(i);
					shi1nos.remove(i);
					shinotes.remove(i);
					
				}	
			}
			
		 List<Shi1good> shi1goods = this.findByHql("from Shi1good s where s.shippingnote1.shi1id="+shippingnote1.getShi1id());
			for(Shi1good s:shi1goods)
			{
				this.delete(s);
			}
			
			this.saveshi1goods(shippingnote1, itemTypeIds, shitimes, shi1units, shi1nos, shinotes);

		}

/**
 * 删除
 */
	public void deleteshi1goods(List<Shi1good> shi1goods) {
		// TODO Auto-generated method stub
		
		for(int i=0; i<shi1goods.size();i++){
			this.delete(shi1goods.get(i));
		}
	}



/**
 * 提交发货单
 */
	public void sended(Integer shippingnote1Id, String flag) {
		// TODO Auto-generated method stub
		
		shippingnote1=shippingnote1Service.findById(Shippingnote1.class, shippingnote1Id);
		shi1goods = this.findByHql("from Shi1good s where s.shippingnote1.id="+shippingnote1Id);
		for(int i=0;i<shi1goods.size();i++){
			Shi1good shi1good = shi1goods.get(i);
			stockService.subNumber(shi1good.getItemType(), shi1good.getShi1no());
			maccountingService.addOutNumber(shippingnote1.getShi1date(), shi1good.getItemType(), shi1good.getShi1no());
		}
		if("pgb".equals(flag))
		{
			shippingnote1.setSended("1");
		}else if("ck".equals(flag)){
			shippingnote1.setGoodlist("1");
		}
		this.saveOrUpdate(shippingnote1);
		
		
	}

/**
 * 添加版本
 */
public void addtax(Integer shi1goodId, Shi1good shi1good, String tax,
		Taxboard taxboard) {
	// TODO Auto-generated method stub
	tax ="1";
	shi1good=this.findById(Shi1good.class, shi1goodId);
	taxboard.setShi1good(shi1good);
    taxboardService.saveAndRefresh(taxboard);
    shi1good.setTax(tax);
    this.saveOrUpdate(shi1good);
}

/**
 * 添加冷冲件
 */
public void addtas(Integer shi1goodId, Shi1good shi1good, String tas,
		Taxstampingparts taxstampingparts) {
	// TODO Auto-generated method stub
	//中间变量，用于赋值判断检验状态
	tas="2";
	shi1good=this.findById(Shi1good.class, shi1goodId);
	taxstampingparts.setShi1good(shi1good);
    taxstampingpartsService.saveAndRefresh(taxstampingparts);
    shi1good.setTas(tas);
    this.saveOrUpdate(shi1good);
}


public void deleteshi1goods(Integer shippingnote1Id, List<Shi1good> shi1goods,
		Taxboard taxboard, Taxstampingparts taxstampingparts) {
	// TODO Auto-generated method stub
	
	shi1goods = this.findByHql("from Shi1good s1g where s1g.shippingnote1.shi1id ="+shippingnote1Id);
	taxboards=taxboardService.findByHql("from Taxboard t where t.shi1good.shi1gid in (select s.shi1gid from Shi1good s where shippingnote1.shi1id = "+shippingnote1Id+")");
	System.out.println("dfdfdfdfdfd--------"+taxboards.size());
	taxstampingparts2=taxstampingpartsService.findByHql("from Taxstampingparts t where t.shi1good.shi1gid in (select s.shi1gid from Shi1good s where shippingnote1.shi1id = "+shippingnote1Id+")");
	System.out.println("dfdfdfdfdfd-----fgfgf---"+taxstampingparts2.size());
	for (int i = 0; i < taxboards.size(); i++) {
		taxboardService.delete(taxboards.get(i));
	}
	for (int i = 0; i < taxstampingparts2.size(); i++) {
		taxstampingpartsService.delete(taxstampingparts2.get(i));
	}
	this.deleteshi1goods(shi1goods);
	shippingnote1Service.deleteById(Shippingnote1.class, shippingnote1Id);
	
}
}
      

