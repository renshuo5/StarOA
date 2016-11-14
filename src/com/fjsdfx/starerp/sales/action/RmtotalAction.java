package com.fjsdfx.starerp.sales.action;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.management.j2ee.statistics.Statistic;

import org.hibernate.jmx.StatisticsService;
import org.hibernate.stat.Statistics;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.security.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;

import com.fjsdfx.starerp.annoucement.model.Annoucement;
import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.item.model.Item;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ItemService;
import com.fjsdfx.starerp.item.service.ItemTypeService;
import com.fjsdfx.starerp.sales.service.QualityanalysisService;
import com.fjsdfx.starerp.sales.service.RetgoodService;
import com.fjsdfx.starerp.sales.service.RmtotalService;
import com.fjsdfx.starerp.sales.service.Shi2goodService;
import com.fjsdfx.starerp.sales
.service.Shinote2Service;
import com.fjsdfx.starerp.sales.model.Qualityanalysis;
import com.fjsdfx.starerp.sales.model.Retgood;
import com.fjsdfx.starerp.sales.model.Returned;
import com.fjsdfx.starerp.sales.model.Rmtotal;
import com.fjsdfx.starerp.sales.model.Shi1good;
import com.fjsdfx.starerp.sales.model.Shi2good;
import com.fjsdfx.starerp.sales.model.Shinote2;
import com.fjsdfx.starerp.security.model.User;
import com.fjsdfx.starerp.warehouse.model.Rewgood;
import com.fjsdfx.starerp.warehouse.model.Warehouse;
import com.fjsdfx.starerp.warehouse.service.RewgoodService;


/**
 * @author Chen_Shaojian
 *
 */
@Controller
@Scope("prototype")
public class RmtotalAction {

	private Logger logger=LoggerFactory.getLogger(RmtotalAction.class);
	
	private RmtotalService rmtotalService;
	
	private Rmtotal rmtotal;
	
	private PagerModel pm;
	
	private Integer sn;
	
	private Retgood retgood;
	
	private Integer RetgoodId;
	
	private RetgoodService retgoodService;
	
	private ItemTypeService itemtypeService;
	
	private Integer itemTypeId;
	
	private Integer rmtotalId;
	
	private User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();


	
	public User getCurrentUser() {
		return currentUser;
	}


	public void setCurrentUser(User currentUser) {
		this.currentUser = currentUser;
	}

	List<Retgood> retgoods;
	
	
	public Logger getLogger() {
		return logger;
	}


	public void setLogger(Logger logger) {
		this.logger = logger;
	}


	public RmtotalService getRmtotalService() {
		return  rmtotalService;
	}

	@Resource
	public void setRmtotalService(
			RmtotalService rmtotalService) {
		this.rmtotalService = rmtotalService;
	}


	public Rmtotal getRmtotal() {
		return rmtotal;
	}


	public void setRmtotal(Rmtotal Rmtotal) {
		this.rmtotal = Rmtotal;
	}


	public PagerModel getPm() {
		return pm;
	}


	public void setPm(PagerModel pm) {
		this.pm = pm;
	}


	public Integer getSn() {
		return sn;
	}


	public void setSn(Integer sn) {
		this.sn = sn;
	}


	public Retgood getRetgood() {
		return retgood;
	}


	public void setRetgood(Retgood retgood) {
		this.retgood = retgood;
	}


	public Integer getRetgoodId() {
		return RetgoodId;
	}


	public void setRetgoodId(Integer retgoodId) {
		RetgoodId = retgoodId;
	}


	public RetgoodService getRetgoodService() {
		return retgoodService;
	}

	@Resource
	public void setRetgoodService(RetgoodService retgoodService) {
		this.retgoodService = retgoodService;
	}


	public ItemTypeService getItemtypeService() {
		return itemtypeService;
	}

	@Resource
	public void setItemtypeService(ItemTypeService itemtypeService) {
		this.itemtypeService = itemtypeService;
	}


	public Integer getItemTypeId() {
		return itemTypeId;
	}


	public void setItemTypeId(Integer itemTypeId) {
		this.itemTypeId = itemTypeId;
	}


	public Integer getRmtotalId() {
		return rmtotalId;
	}


	public void setRmtotalId(Integer rmtotalId) {
		this.rmtotalId = rmtotalId;
	}


	public List<Retgood> getRetgoods() {
		return retgoods;
	}


	public void setRetgoods(List<Retgood> retgoods) {
		this.retgoods = retgoods;
	}


	/**
	 * 列表
	 * @return
	 * @throws Exception
	 */
	public String list()  {
		// TODO Auto-generated method stub
		pm=rmtotalService.getPagerDesc(Rmtotal.class);
		return "list";
	}
	

	/**
	 * 查询
	 * @return
	 */
	public String search(){
		Map<String, String> like = new HashMap<String, String>();
		like.put("itemType.name", rmtotal.getItemType().getName());
		pm = rmtotalService.fuzzyQuery(Rmtotal.class, like);
		return "list";
	}
	
	
	/**
	 * 转到添加页面
	 * @return
	 */
	public String addInput()
	{
		// TODO Auto-generated method stub

		pm=rmtotalService.getPagerDesc(Rmtotal.class);
		retgoods = retgoodService.findByHql("from Retgood");
		return "add_input";
	}
	
	/**
	 * 添加方法
	 * @return
	 */
	public String add() throws ParseException
	{

			if (rmtotal.getItemType().getId()!=null) {
				rmtotalService.saveAndRefresh(rmtotal);
			}
		logger.warn("add rmtotal id"+rmtotal.getRmt_id()+"user Id ="+currentUser.getId());
		return "pub_add_success";
	}
	

	/**
	 * 转到修改
	 * @return
	 */
	public String editInput()
	{
		rmtotal=rmtotalService.findById(Rmtotal.class,rmtotalId);
		retgoods = retgoodService.findByHql("from Retgood");
		return "edit_input";
	
	}
	
	
	/**
	 * 修改方法
	 * @return
	 */
	public String update()
	{                                        
		rmtotalService.update(rmtotal);
		logger.warn("update rmtotal id"+rmtotal.getRmt_id()+"user Id ="+currentUser.getId());
		return "pub_update_success";
	}
	
	/**
	 * 删除方法
	 * @return
	 */
	public String del(){
		rmtotalService.deleteById(Rmtotal.class, rmtotalId);
		logger.warn("del rmtotal id"+rmtotalId+"user Id ="+currentUser.getId());
		return "pub_del_success";
	}
	


}
