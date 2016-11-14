package com.fjsdfx.starerp.sales.service;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.item.service.ItemTypeService;
import com.fjsdfx.starerp.sales.model.Shi1good;
import com.fjsdfx.starerp.sales.model.Shinote2;
import com.fjsdfx.starerp.sales.model.Shippingnote1;
import com.fjsdfx.starerp.sales.model.Taxboard;
import com.fjsdfx.starerp.sales.model.Taxstampingparts;
import com.fjsdfx.starerp.sales.model.Unqmessage;


public interface Shi1goodService extends BaseService<Shi1good> {
	
	

    public void saveshi1goods(Shippingnote1 shippingnote1 , List<Integer> itemTypeIds, List<String> shitimes, List<String> shi1units, List<Integer> shi1nos, List<String> shinotes);
	
	public void updateshi1goods(Shippingnote1 shippingnote1 , List<Integer> itemTypeIds, List<String> shitimes, List<String> shi1units, List<Integer> shi1nos, List<String> shinotes);

	public void addtax(Integer shi1goodId, Shi1good shi1good, String tax,
			Taxboard taxboard);

	public void addtas(Integer shi1goodId, Shi1good shi1good, String tas,
			Taxstampingparts taxstampingparts);

	public void deleteshi1goods(Integer shippingnote1Id,
			List<Shi1good> shi1goods, Taxboard taxboard,
			Taxstampingparts taxstampingparts);

	public void sended(Integer shippingnote1Id, String flag);


}
