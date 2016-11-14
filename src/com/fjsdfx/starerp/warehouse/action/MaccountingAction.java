package com.fjsdfx.starerp.warehouse.action;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ItemTypeService;
import com.fjsdfx.starerp.warehouse.model.Maccounting;
import com.fjsdfx.starerp.warehouse.model.Warehouse;
import com.fjsdfx.starerp.warehouse.service.MaccountingService;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;

@Controller
@Scope("prototype")
public class MaccountingAction {

	private ItemType itemType;

	private Integer itemTypeId;

	private ItemTypeService itemTypeService;

	private Logger logger = LoggerFactory.getLogger(MaccountingAction.class);

	private Maccounting maccounting;

	private Integer maccountingId;

	private MaccountingService maccountingService;

	private PagerModel pm;

	/**
	 * 列表
	 * 
	 * @return
	 */
	public String list() {
		maccountingService.setstonum();
		pm = maccountingService.getPagerDesc(Maccounting.class);
		return "list";
	}

	/**
	 * 查询
	 * 
	 * @return
	 */
	public String search() {
		Map<String, String> like = new HashMap<String, String>();
		like.put("itemType.name", maccounting.getItemType().getName());
		pm = maccountingService.fuzzyQuery(Maccounting.class, like);
		return "list";
	}

	public ItemType getItemType() {
		return itemType;
	}

	public Integer getItemTypeId() {
		return itemTypeId;
	}

	public ItemTypeService getItemTypeService() {
		return itemTypeService;
	}

	public Logger getLogger() {
		return logger;
	}

	public Maccounting getMaccounting() {
		return maccounting;
	}

	public Integer getMaccountingId() {
		return maccountingId;
	}

	public MaccountingService getMaccountingService() {
		return maccountingService;
	}

	public PagerModel getPm() {
		return pm;
	}

	public void setItemType(ItemType itemType) {
		this.itemType = itemType;
	}

	public void setItemTypeId(Integer itemTypeId) {
		this.itemTypeId = itemTypeId;
	}

	@Resource
	public void setItemTypeService(ItemTypeService itemTypeService) {
		this.itemTypeService = itemTypeService;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	public void setMaccounting(Maccounting maccounting) {
		this.maccounting = maccounting;
	}

	public void setMaccountingId(Integer maccountingId) {
		this.maccountingId = maccountingId;
	}

	@Resource
	public void setMaccountingService(MaccountingService maccountingService) {
		this.maccountingService = maccountingService;
	}

	public void setPm(PagerModel pm) {
		this.pm = pm;
	}
}
