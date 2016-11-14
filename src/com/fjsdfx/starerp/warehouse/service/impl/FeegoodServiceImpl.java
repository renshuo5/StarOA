package com.fjsdfx.starerp.warehouse.service.impl;

import java.util.List;

import javassist.compiler.ast.NewExpr;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ItemTypeService;
import com.fjsdfx.starerp.purchase.model.Requisitions;
import com.fjsdfx.starerp.purchase.model.Resgood;
import com.fjsdfx.starerp.purchase.service.RequisitionsService;
import com.fjsdfx.starerp.purchase.service.ResgoodService;
import com.fjsdfx.starerp.warehouse.dao.FeedexamineDao;
import com.fjsdfx.starerp.warehouse.model.Feedexamine;
import com.fjsdfx.starerp.warehouse.model.Feegood;
import com.fjsdfx.starerp.warehouse.model.Rewgood;
import com.fjsdfx.starerp.warehouse.service.FeegoodService;

@Service
@Transactional
public class FeegoodServiceImpl extends BaseServiceImpl<Feegood> implements
		FeegoodService {

	private ItemTypeService itemTypeService;

	private Requisitions requisitions;

	private RequisitionsService requisitionsService;

	private List<Resgood> resgoods;

	private ResgoodService resgoodService;

	private FeedexamineDao feedexamineDao;
	public FeedexamineDao getFeedexamineDao() {
		return feedexamineDao;
	}

	@Resource
	public void setFeedexamineDao(FeedexamineDao feedexamineDao) {
		this.feedexamineDao = feedexamineDao;
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
	public void savefeegoods(Feedexamine feedexamine, List<Integer> bsnos,
			List<Integer> itemTypeIds, List<Integer> fpnums, List<String> fnotes) {
		// TODO Auto-generated method stub
		for (int i = 0; i < itemTypeIds.size(); i++) {
			if (itemTypeIds.get(i) != null && fpnums.get(i) != null) {
				Feegood feegood = new Feegood();
				feegood.setFeedexamine(feedexamine);
				feegood.setBsno(itemTypeService.findById(ItemType.class,
						itemTypeIds.get(i)).getBondedNo());
				feegood.setItemType(itemTypeService.findById(ItemType.class,
						itemTypeIds.get(i)));
				feegood.setFpnum(fpnums.get(i));
				feegood.setFnote(fnotes.get(i));
				this.saveAndRefresh(feegood);
			}

		}
	}

	/**
	 * 更新
	 */
	public void updatefeegoods(Feedexamine feedexamine, List<Integer> bsnos,
			List<Integer> itemTypeIds, List<Integer> fpnums, List<String> fnotes) {
		// TODO Auto-generated method stub
		for (int i = 0; i < itemTypeIds.size(); i++) {

			if (null == itemTypeIds.get(i)) {
				itemTypeIds.remove(i);
				bsnos.remove(i);
				fpnums.remove(i);
				fnotes.remove(i);
			}
		}

		List<Feegood> feegoods = this
				.findByHql("from Feegood f where f.feedexamine.fee_id="
						+ feedexamine.getFee_id());
		for (Feegood f : feegoods) {
			this.delete(f);
		}
		feedexamine = feedexamineDao.save(feedexamine);
		for (int i = 0; i < itemTypeIds.size(); i++) {
			if (itemTypeIds.get(i) != null && fpnums.get(i) != null) {
				Feegood feegood = new Feegood();
				feegood.setFeedexamine(feedexamine);
				feegood.setBsno(itemTypeService.findById(ItemType.class,
						itemTypeIds.get(i)).getBondedNo());
				feegood.setItemType(itemTypeService.findById(ItemType.class,
						itemTypeIds.get(i)));
				feegood.setFpnum(fpnums.get(i));
				feegood.setFnote(fnotes.get(i));
				this.saveAndRefresh(feegood);
			}
		}

	}

}
