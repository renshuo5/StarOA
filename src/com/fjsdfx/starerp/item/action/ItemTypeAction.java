package com.fjsdfx.starerp.item.action;



import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;


import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.item.dto.ItemTypeInfo;
import com.fjsdfx.starerp.item.model.Controllerunit;
import com.fjsdfx.starerp.item.model.Controllerunit;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ControllerService;
import com.fjsdfx.starerp.item.service.ItemRelationService;
import com.fjsdfx.starerp.item.service.ItemService;
import com.fjsdfx.starerp.item.service.ItemTypeService;
import com.fjsdfx.starerp.warehouse.service.StockService;
import com.fjsdfx.starerp.warehouse.service.SusgoodService;
import com.googlecode.jsonplugin.annotations.JSON;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * @author Chen_Luqiang
 *
 */
@org.springframework.stereotype.Controller
@Scope("prototype")
public class ItemTypeAction extends ActionSupport implements ModelDriven<ItemTypeInfo>{

	private String result;
	private ItemService itemService;
	private ItemRelationService itemRelationService;
	private ControllerService controllerService;
	private Controllerunit controllerunit;
	private StockService stockService;
	private SusgoodService susgoodService;
	private Integer supsendmId;
	
	public Integer getSupsendmId() {
		return supsendmId;
	}
	public void setSupsendmId(Integer supsendmId) {
		this.supsendmId = supsendmId;
	}
	@JSON(serialize=false)
	public SusgoodService getSusgoodService() {
		return susgoodService;
	}
	@JSON(serialize=false)
	@Resource
	public void setSusgoodService(SusgoodService susgoodService) {
		this.susgoodService = susgoodService;
	}
	/**
	 * 是否添加控制器信息
	 */
	private Integer isCon;
	/**
	 * 是否保税
	 */
	private Integer isBonded;
	
	public Integer getIsBonded() {
		return isBonded;
	}
	public void setIsBonded(Integer isBonded) {
		this.isBonded = isBonded;
	}
	public Integer getIsCon() {
		return isCon;
	}
	public void setIsCon(Integer isCon) {
		this.isCon = isCon;
	}
	@JSON(serialize=false)
	public StockService getStockService() {
		return stockService;
	}
	@Resource
	public void setStockService(StockService stockService) {
		this.stockService = stockService;
	}
	@JSON(serialize=false)
	public ControllerService getControllerService() {
		return controllerService;
	}
	@Resource
	public void setControllerService(ControllerService controllerService) {
		this.controllerService = controllerService;
	}
	
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public Controllerunit getControllerunit() {
		return controllerunit;
	}
	public void setControllerunit(Controllerunit controllerunit) {
		this.controllerunit = controllerunit;
	}
	public ItemTypeInfo getItemTypeInfo() {
		return itemTypeInfo;
	}
	public void setItemTypeInfo(ItemTypeInfo itemTypeInfo) {
		this.itemTypeInfo = itemTypeInfo;
	}
	@JSON(serialize=false)
	public ItemRelationService getItemRelationService() {
		return itemRelationService;
	}
	@Resource(name="itemRelationServiceImpl")
	public void setItemRelationService(ItemRelationService itemRelationService) {
		this.itemRelationService = itemRelationService;
	}
	@JSON(serialize=false)
	public ItemService getItemService() {
		return itemService;
	}
	@Resource(name="itemServiceImpl")
	public void setItemService(ItemService itemService) {
		this.itemService = itemService;
	}
	private ItemTypeInfo itemTypeInfo = new ItemTypeInfo();
	public PagerModel getPm() {
		return pm;
	}
	public void setPm(PagerModel pm) {
		this.pm = pm;
	}
	/**
	 * 注入的服务层
	 */
	private ItemTypeService itemTypeService;
	private Logger logger=LoggerFactory.getLogger(ItemTypeAction.class);
	private ItemType itemType;
	@JSON(serialize=false)
	public Logger getLogger() {
		return logger;
	}
	public void setLogger(Logger logger) {
		this.logger = logger;
	}
	public ItemType getItemType() {
		return itemType;
	}
	public void setItemType(ItemType itemType) {
		this.itemType = itemType;
	}
	@JSON(serialize=false)
	public ItemTypeService getItemTypeService() {
		return itemTypeService;
	}
	@Resource(name="itemTypeServiceImpl")
	public void setItemTypeService(ItemTypeService itemTypeService) {
		this.itemTypeService = itemTypeService;
	}
	/**
	 * 分页的pagermodel
	 */
	private PagerModel pm;
	
	/**
	 * 用于编辑和删除的物料类型id
	 */
	private Integer itemtypeid;
	
	public Integer getItemtypeid() {
		return itemtypeid;
	}
	public void setItemtypeid(Integer itemtypeid) {
		this.itemtypeid = itemtypeid;
	}
	/**
	 * 列表
	 * @return
	 * @throws Exception
	 */
	public String list()  {
		pm=itemTypeService.getItemTypesByItemId(ItemType.class, itemTypeInfo.getSitemid());
		return "list";
	}
	
	/**
	 * 搜索
	 * @return
	 */
	public String search()
	{
		Map<String,String> like=new HashMap<String,String>();
		like.put("name", itemType.getName());
		like.put("description", itemType.getDescription());
		pm=itemTypeService.fuzzyQuery(ItemType.class,like);
		
		return "list";
	}
	
	/**
	 * 用于选择界面的查询
	 * @return
	 */
	public String selectSearch()
	{
		Map<String,String> like=new HashMap<String,String>();
		like.put("name", itemType.getName());
		like.put("description", itemType.getDescription());
		pm=itemTypeService.fuzzyQuery(ItemType.class,like);
		return "select_input";
	}
	/**
	 * 添加
	 * @return
	 */
	public String add()
	{
		itemRelationService.saveitemType(itemType, itemTypeInfo.getSitemid(), itemTypeInfo.getPartids(), itemTypeInfo.getAmounts(),itemTypeInfo.getIsCons(),itemTypeInfo.getControllerunits()) ;
		return "pub_add_success";
	}
	/**
	 * 更新
	 * @return
	 */
	public String update()
	{
        itemRelationService.updateitemType(itemType, itemTypeInfo.getSitemid(), itemTypeInfo.getPartids(),  itemTypeInfo.getAmounts(),itemTypeInfo.getIsCons(),itemTypeInfo.getControllerunits());
		logger.warn("update id="+itemType.getId());
		return "pub_update_success";
	}
	public String del()
	{
		itemTypeService.deleteById(itemtypeid);
		logger.warn("del id="+itemtypeid);
		return "pub_del_success";
	}
	public String getStonum() throws Exception
	{
		result = stockService.getStonumByItemTypeId(itemType.getId())+"";
		return "success";
	}
	
	public String getLastSurplus() throws Exception
	{
		result = susgoodService.getLastSurplus(supsendmId, itemType.getId())+"";
		return "success";
	}
	
	/**************************以下为各种input页面******************************************/
	
	/**
	 * 添加物料类别输入窗口
	 * @return
	 */
	public String addInput()
	{
		return "add_input";
	}
	
	public String editInput()
	{
		//System.out.println("___________________  sitemid : "+itemTypeInfo.getSitemid());
		itemType=itemTypeService.findById(ItemType.class, itemtypeid);
		System.out.println("iscon = "+isCon);
		itemTypeInfo.setItemRelations(itemRelationService.findByItemTypeId(itemtypeid));
	//	System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^   "+itemTypeInfo.getItemRelations());
		return "edit_input";
	}
	
	public String show(){
		itemTypeInfo.setItemRelations(itemRelationService.findByItemTypeId(itemtypeid));
		itemType=itemTypeService.findById(ItemType.class, itemtypeid);
		return "show";
	}
	
	public String selectInput()
	{
		pm=itemTypeService.getItemTypesByItemId(ItemType.class, itemTypeInfo.getSitemid());
		return "select_input";
	}
	/**************************以上为各种input页面******************************************/
	public ItemTypeInfo getModel() {
		return itemTypeInfo;
	}
}
