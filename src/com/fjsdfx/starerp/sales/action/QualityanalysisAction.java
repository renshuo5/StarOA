package com.fjsdfx.starerp.sales.action;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

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
import com.fjsdfx.starerp.sales.service.Shi2goodService;
import com.fjsdfx.starerp.sales
.service.Shinote2Service;
import com.fjsdfx.starerp.sales.service.UnqualifiedService;
import com.fjsdfx.starerp.sales.model.Qualityanalysis;
import com.fjsdfx.starerp.sales.model.Retgood;
import com.fjsdfx.starerp.sales.model.Returned;
import com.fjsdfx.starerp.sales.model.Shi1good;
import com.fjsdfx.starerp.sales.model.Shi2good;
import com.fjsdfx.starerp.sales.model.Shinote2;
import com.fjsdfx.starerp.security.model.User;
import com.fjsdfx.starerp.warehouse.model.Maccounting;



/**
 * @author Chen_Shaojian
 *
 */
@Controller
@Scope("prototype")
public class QualityanalysisAction {

	private Logger logger=LoggerFactory.getLogger(QualityanalysisAction.class);
	
	private QualityanalysisService qualityanalysisService;
	
	private Qualityanalysis qualityanalysis;
	
	private PagerModel pm;
	
	private Integer sn;
	
	private Retgood retgood;
	
	private Integer RetgoodId;
	
	private RetgoodService retgoodService;
	
	private ItemTypeService itemtypeService;
	
	private Integer itemTypeId;
	
	private Integer qualityanalysisId;

	List<Retgood> retgoods;
	
	private User currentUser=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

	
	
	public User getCurrentUser() {
		return currentUser;
	}


	public void setCurrentUser(User currentUser) {
		this.currentUser = currentUser;
	}

	private List<Qualityanalysis> qualityanalysis2;
	
	
	public Integer getQualityanalysisId() {
		return qualityanalysisId;
	}


	public void setQualityanalysisId(Integer qualityanalysisId) {
		this.qualityanalysisId = qualityanalysisId;
	}


	public List<Qualityanalysis> getQualityanalysis2() {
		return qualityanalysis2;
	}


	public void setQualityanalysis2(List<Qualityanalysis> qualityanalysis2) {
		this.qualityanalysis2 = qualityanalysis2;
	}


	public Logger getLogger() {
		return logger;
	}


	public void setLogger(Logger logger) {
		this.logger = logger;
	}


	public QualityanalysisService getQualityanalysisService() {
		return qualityanalysisService;
	}

	@Resource
	public void setQualityanalysisService(
			QualityanalysisService qualityanalysisService) {
		this.qualityanalysisService = qualityanalysisService;
	}


	public Qualityanalysis getQualityanalysis() {
		return qualityanalysis;
	}


	public void setQualityanalysis(Qualityanalysis qualityanalysis) {
		this.qualityanalysis = qualityanalysis;
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


	public Integer getQalityanalysisId() {
		return qualityanalysisId;
	}


	public void setQalityanalysisId(Integer qalityanalysisId) {
		this.qualityanalysisId = qalityanalysisId;
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
		pm=qualityanalysisService.getPagerDesc(Qualityanalysis.class);
		return "list";
	}
	
	/**
	 * 查询
	 * @return
	 */
	public String search(){
		Map<String, String> like = new HashMap<String, String>();
		like.put("itemType.name", qualityanalysis.getItemType().getName());
		pm = qualityanalysisService.fuzzyQuery(Qualityanalysis.class, like);
		return "list";
	}
	
	/**
	 * 显示
	 * @return
	 */
	public String show()
	{
		qualityanalysis=qualityanalysisService.findById(Qualityanalysis.class, qualityanalysisId);
		retgoods = retgoodService.getPager(Retgood.class).getDatas();
		for(int i= 0; i<retgoods.size();i++){
			if(retgoods.get(i).getQualityanalysis().getAna_id()== qualityanalysisId){
				retgood = retgoods.get(i);
				break;
			}
		}
		return "show";
	}
	
	/**
	 * 转到审核列表页面
	 * @return
	 */
	public String examineList()  {
		
		// TODO Auto-generated method stub
		
		pm=qualityanalysisService.getPagerDesc(Qualityanalysis.class);
		retgoods = retgoodService.findByHql("from Retgood");
		
		return "examine_list";
	}
	
	/**
	 * 转到添加页面
	 * @return
	 */
	public String addInput()
	{
		// TODO Auto-generated method stub

		pm=qualityanalysisService.getPagerDesc(Qualityanalysis.class);
		retgoods = retgoodService.findByHql("from Retgood");
		return "add_input";
	}
	
	/**
	 * 添加方法
	 * @return
	 */
	public String add() throws ParseException
	{
	
			if (qualityanalysis.getItemType().getId()!=null) {
				qualityanalysisService.saveAndRefresh(qualityanalysis);
			}
		logger.warn("add qualityanalysis id"+qualityanalysis.getAna_id()+"user Id ="+currentUser.getId());
		return "pub_add_success";
	}

	/**
	 * 转到修改
	 * @return
	 */
	public String editInput()
	{
		qualityanalysis=qualityanalysisService.findById(Qualityanalysis.class,qualityanalysisId);
		retgoods = retgoodService.findByHql("from Retgood");
		return "edit_input";
	
	}
	
	/**
	 * 修改方法
	 * @return
	 */
	public String update()
	{                                        
		qualityanalysisService.update(qualityanalysis);
		logger.warn("update qualityanalysis id"+qualityanalysis.getAna_id()+"user Id ="+currentUser.getId());
		return "pub_update_success";
	}
	
	public String del(){
		qualityanalysisService.deleteById(Qualityanalysis.class, qualityanalysisId);
		logger.warn("del qualityanalysis id"+qualityanalysisId+"user Id ="+currentUser.getId());
		return "pub_update_success";
	}
}
