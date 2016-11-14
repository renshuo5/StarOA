package com.fjsdfx.starerp.produce.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.persistence.Id;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.item.model.Item;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ItemTypeService;

import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.model.Employee;
import com.fjsdfx.starerp.persons.model.EmployeeRap;
import com.fjsdfx.starerp.persons.model.Jobs;
import com.fjsdfx.starerp.produce.model.Repairproduction;
import com.fjsdfx.starerp.produce.service.RepairproductionService;
import com.sun.org.apache.bcel.internal.generic.NEW;
/**
 * @author Huang_Jian
 *
 */
@Controller
@Scope("prototype")
public class RepairProductionAction {
	private Logger logger=LoggerFactory.getLogger(RepairProductionAction.class);
	private RepairproductionService repairproductionService;
	
	private String recDate;
	
	

	public String getRecDate() {
		return recDate;
	}

	public void setRecDate(String recDate) {
		this.recDate = recDate;
	}

	private Repairproduction repairproduction;
	private PagerModel pm;
	private Integer repairproductionId;
	 private Integer partids;
	
	public Integer getRepairproductionId() {
		return repairproductionId;
	}

	public void setRepairproductionId(Integer repairproductionId) {
		this.repairproductionId = repairproductionId;
	}

	
	public Integer getPartids() {
		return partids;
	}

	public void setPartids(Integer partids) {
		this.partids = partids;
	}

	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	public RepairproductionService getRepairproductionService() {
		return repairproductionService;
	}
  @Resource
	public void setRepairproductionService(
			RepairproductionService repairproductionService) {
		this.repairproductionService = repairproductionService;
	}

	public Repairproduction getRepairproduction() {
		return repairproduction;
	}

	public void setRepairproduction(Repairproduction repairproduction) {
		this.repairproduction = repairproduction;
	}


	public PagerModel getPm() {
		return pm;
	}

	public void setPm(PagerModel pm) {
		this.pm = pm;
	}

	

	
	
	/**
	 * 列表
	 * @return
	 * @throws Exception
	 */
	public String list()  {
		pm=repairproductionService.getPagerDesc(Repairproduction.class);
		return "list";
	}
	
	/**
	 * 模糊查询（对产品）
	 * @return
	 */
	
	public String search()
	{
		Map<String,String> like=new HashMap<String,String>();
		like.put("itemTypeName", repairproduction.getItemTypeName());
		//like.put("itemType.item.name", repairproduction.getItemType().getItem().getName());
         pm=repairproductionService.fuzzyQuery(Repairproduction.class, like);
		return "list";
		
	}

	/**
	 * 删除
	 * @return
	 */
	
	public String del()
	{

       /***************************以上的步骤是先删除奖惩表里面的信息，以防人员表的信息删除不掉************************************************************/		
		repairproductionService.deleteById(Repairproduction.class, repairproductionId);
		logger.warn("del repairproductionId="+repairproductionId);
		return "pub_del_success";
	}
	/**
	 * 添加
	 * @return
	 */
	public String add() throws Exception
	{
	if(repairproduction.getItemTypeName()==null||"".equals(repairproduction.getItemTypeName())){
		
		throw new Exception("设备名为空!!!!");
		}
	repairproductionService.saveOrUpdate(repairproduction);
	
		
		logger.warn("add id="+repairproduction.getId());
	  return "pub_add_success";
  }
	

	public String update()throws Exception{
		
		//repairproduction.setId(repairproductionService.findById(Repairproduction.class, repairproductionId);
			//repairproduction.setItemType(itemTypeService.findById(ItemType.class, partids));
		if(repairproduction.getItemTypeName()==null||"".equals(repairproduction.getItemTypeName())){
	
		System.out.println("repairproduction's id = "+repairproduction.getId());
		throw new Exception("设备名为空!!!!");
		
		}
		repairproductionService.update(repairproduction);
		return "pub_update_success";
		
		
	}
	
/*===================================input============================================================*/
	
	public String addInput()
	{

		return "add_input";
	}
	public String editInput()
	{   

		repairproduction=repairproductionService.findById(Repairproduction.class,repairproductionId);
		
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy年MM月dd日");
	    if(repairproduction.getRecDate()!=null){
		recDate = sdf1.format(repairproduction.getRecDate());}
	    

		return "edit_input";
	}

	/**************************以上为各种input页面******************************************/
	
}
