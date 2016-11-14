package com.fjsdfx.starerp.warehouse.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ItemTypeService;
import com.fjsdfx.starerp.persons.model.Employee;
import com.fjsdfx.starerp.purchase.model.Requisitions;
import com.fjsdfx.starerp.purchase.model.Resgood;
import com.fjsdfx.starerp.purchase.service.RequisitionsService;
import com.fjsdfx.starerp.purchase.service.ResgoodService;
import com.fjsdfx.starerp.warehouse.model.Rewgood;
import com.fjsdfx.starerp.warehouse.model.Rewinder;
import com.fjsdfx.starerp.warehouse.service.RewgoodService;
import com.fjsdfx.starerp.warehouse.service.RewinderService;

@Service
@Transactional
public class RewgoodServiceImpl extends BaseServiceImpl<Rewgood> implements
		RewgoodService {

	private ItemTypeService itemTypeService;

	private RewinderService rewinderService;

	private Requisitions requisitions;

	private RequisitionsService requisitionsService;

	private List<Resgood> resgoods;

	private ResgoodService resgoodService;

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

	public RewinderService getRewinderService() {
		return rewinderService;
	}

	@Resource
	public void setRewinderService(RewinderService rewinderService) {
		this.rewinderService = rewinderService;
	}

	public ItemTypeService getItemTypeService() {
		return itemTypeService;
	}

	@Resource
	public void setItemTypeService(ItemTypeService itemTypeService) {
		this.itemTypeService = itemTypeService;
	}

	/**
	 * 收料通知单添加
	 */
	public void saverewgoods(Rewinder rewinder, List<Integer> bsnos,
			List<Integer> itemTypeIds, List<String> rewunits,
			List<Integer> rewnos, List<Float> rewuprices,
			List<Float> rewprices, List<String> rewnotes) {

		rewinderService.saveAndRefresh(rewinder);
		if (itemTypeIds.size() != 0) {
			for (int i = 0; i < itemTypeIds.size(); i++) {

				if(itemTypeIds.get(i)!=null &&rewunits.get(i)!=null&&rewuprices.get(i)!=null){
					Rewgood rewgood = new Rewgood();
					rewgood.setRewinder(rewinder);
					rewgood.setItemType(itemTypeService.findById(ItemType.class,
							itemTypeIds.get(i)));
					if(itemTypeService.findById(ItemType.class, itemTypeIds.get(i)).getBondedNo()!=null){
						rewgood.setBsno(itemTypeService.findById(ItemType.class,
								itemTypeIds.get(i)).getBondedNo());
					}
					rewgood.setRewunit(rewunits.get(i));
					rewgood.setRewno(rewnos.get(i));
					rewgood.setRewuprice(rewuprices.get(i));
					rewgood.setRewprice(rewgood.getRewuprice()
							* rewgood.getRewno());
					rewgood.setRewnote(rewnotes.get(i));
					this.saveAndRefresh(rewgood);
				}
				
				
			}

		}

	}

	/**
	 * 更新
	 */
	public void updaterewgoods(Rewinder rewinder,
			List<Integer> itemTypeIds, List<String> rewunits,
			List<Integer> rewnos,  List<String> rewnotes) {
			
		for (int i = 0; i < itemTypeIds.size(); i++) {

			if (null == itemTypeIds.get(i)) {
				itemTypeIds.remove(i);
				rewunits.remove(i);
				rewnotes.remove(i);
				rewnos.remove(i);
			}
		}

		List<Rewgood> rewgoods = this
				.findByHql("from Rewgood r where r.rewinder.rew_id="
						+ rewinder.getRew_id());
		for (Rewgood r : rewgoods) {
			this.delete(r);
		}
		rewinder.setRewinspector(null);
		rewinder = rewinderService.save(rewinder);
		System.out.println("itemTypeIds's size = " + itemTypeIds.size());
		for (int i = 0; i < itemTypeIds.size(); i++) {
			if (itemTypeIds.get(i)!=null&&rewunits.get(i)!=null&&rewnos.get(i)!=null) {
				Rewgood rewgood = new Rewgood();
				rewgood.setRewinder(rewinder);
					rewgood.setBsno(itemTypeService.findById(ItemType.class,
							itemTypeIds.get(i)).getBondedNo());
					rewgood.setRewunit(rewunits.get(i));
					rewgood.setRewno(rewnos.get(i));
					rewgood.setRewnote(rewnotes.get(i));
					rewgood.setItemType(itemTypeService.findById(
					ItemType.class, itemTypeIds.get(i)));
					rewgood.setRewexamine(true);
					this.saveAndRefresh(rewgood);
			}
		
			

	}
	}

	/**
	 * 删除
	 */
	public void delrewgoods(Integer rewinderId) {
		Rewinder rewinder = rewinderService
				.findById(Rewinder.class, rewinderId);
		List<Rewgood> rewgoods = this
				.findByHql("from Rewgood r where r.rewinder.rew_id="
						+ rewinderId);
		if (rewgoods.size() != 0) {
			for (int i = 0; i < rewgoods.size(); i++) {
				this.delete(rewgoods.get(i));
			}
		}
		rewinderService.delete(rewinder);
	}

	/**
	 * 检验
	 */
	public void examinerewgoods(Rewinder rewinder, List<Rewgood> rewgoods,
			Employee rewinspector, List<Boolean> rewexamines) {
		Rewgood rewgood = null;
		for (int i = 0; i < rewgoods.size(); i++) {
			rewgood = rewgoods.get(i);
			rewgood.setRewexamine(rewexamines.get(i));
			rewgood.setFactno(rewgood.getRewno());

		}
		if (rewinspector != null) {
			rewinder.setRewinspector(rewinspector);
		}
		rewinderService.saveOrUpdate(rewinder);

	}

	/**
	 * 半成品添加
	 */
	public void saverewgoods2(Rewinder rewinder, List<Integer> itemTypeIds,
			List<String> rewunits, List<Integer> factnos,
			List<String> rewnotes) {
		
		rewinderService.saveAndRefresh(rewinder);
			for (int i = 0; i < itemTypeIds.size(); i++) {
				if (itemTypeIds.get(i)!=null&&rewunits.get(i)!=null&&factnos.get(i)!=null) {
					Rewgood rewgood = new Rewgood();
					rewgood.setRewinder(rewinder);
						rewgood.setBsno(itemTypeService.findById(ItemType.class,
								itemTypeIds.get(i)).getBondedNo());
						rewgood.setRewunit(rewunits.get(i));
						rewgood.setFactno(factnos.get(i));
						rewgood.setRewnote(rewnotes.get(i));
						rewgood.setItemType(itemTypeService.findById(
						ItemType.class, itemTypeIds.get(i)));
						rewgood.setRewexamine(true);
						this.saveAndRefresh(rewgood);
				}
			
				

		}
	}
}
