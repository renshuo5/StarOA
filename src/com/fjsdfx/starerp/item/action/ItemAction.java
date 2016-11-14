package com.fjsdfx.starerp.item.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.item.model.Item;
import com.fjsdfx.starerp.item.model.ItemCategory;
import com.fjsdfx.starerp.item.model.ItemRelation;
import com.fjsdfx.starerp.item.service.ItemRelationService;
import com.fjsdfx.starerp.item.service.ItemService;
import com.fjsdfx.starerp.item.service.ItemTypeService;
import com.googlecode.jsonplugin.annotations.JSON;

/**
 * @author Chen_Luqiang
 *
 */
@Controller
@Scope("prototype")
public class ItemAction {
	
	/**
	 * 部件数量集合
	 */
	private List<Integer> amounts;
	private String isSelectItemType;

	/**
	 * 新建的item
	 */
	private Item item;

	/**
	 * 选择Item页面传递的序号
	 */
	
	private ItemCategory itemCategory;

	/**
	 * 编辑或删除item传递的参数ID
	 */
	private Integer itemid;
	private String itemName;
	private String result;

	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	/**
	 * 编辑item输入页面传入的某item的ItemRelation列表
	 */
	private List<ItemRelation> itemRelationList;

	private ItemRelationService itemRelationService;
	
	/**
	 * 注入的服务层
	 */
	private ItemService itemService;
	/**
	 * 新建Item中的itemtypeID
	 */
	private Integer itemtypeid;
	
	/**
	 * 
	 */
	private ItemTypeService itemTypeService;

	private Logger logger=LoggerFactory.getLogger(ItemAction.class);

	/**
	 * 部件ID集合
	 */
	private List<Integer> partids;

	private Integer partnumber;

	/**
	 * 分页的pagermodel
	 */
	private PagerModel pm;


	/**
	 * 查询的example
	 */
	private Item sitem;
	public String add()
	{
		
//		//获取 类型
//		if(null!=itemtypeid)
//		{
//		ItemType it=itemTypeService.findById(ItemType.class, itemtypeid);
//		item.setItemtype(it);
//		}
//		itemService.save(item);
//		//通过part id集合 获取parts集合
//		if(null!=partids&&!partids.isEmpty())
//		{
//		List<Item> parts=itemService.getItemsByIds(partids);
//		itemRelationService.saveRelations(item, parts, amounts);
//		}
//		logger.warn("add id="+item.getId());
//		//返回列表页面
//		return "return_list";
		itemService.save(item);
        return "pub_add_success";
	}
	/**************************以下为各种input页面******************************************/
	/**
	 * 添加物料输入窗口
	 * @return
	 */
	public String addInput()
    {
        return "add_input";
    }
	
	public String del()
	{
//		System.out.println("itemid = "+itemid);
		itemService.deleteById(itemid);
		logger.warn("del id="+itemid);
		return "pub_del_success";
	}
	
	public String editInput()
	{
       item = (Item)itemService.findById(Item.class, itemid);
        return "edit_input";
	}
	/**************************以上为各种input页面******************************************/
	@JSON(serialize=false)
	public List<Integer> getAmounts() {
		return amounts;
	}
	@JSON(serialize=false)
	public String getIsSelectItemType() {
		return isSelectItemType;
	}
//	@JSON(serialize=false)
	public Item getItem() {
		return item;
	}

	@JSON(serialize=false)
	public ItemCategory getItemCategory() {
		return itemCategory;
	}

	@JSON(serialize=false)
	public Integer getItemid() {
		return itemid;
	}
	
	@JSON(serialize=false)
	public List<ItemRelation> getItemRelationList() {
		return itemRelationList;
	}
	
	@JSON(serialize=false)
	public ItemRelationService getItemRelationService() {
		return itemRelationService;
	}

	@JSON(serialize=false)
	public ItemService getItemService() {
		return itemService;
	}

//	@JSON(serialize=false)
	public Integer getItemtypeid() {
		return itemtypeid;
	}

	@JSON(serialize=false)
	public ItemTypeService getItemTypeService() {
		return itemTypeService;
	}

	@JSON(serialize=false)
	public Logger getLogger() {
		return logger;
	}

	@JSON(serialize=false)
	public List<Integer> getPartids() {
		return partids;
	}

//	@JSON(serialize=false)
	public Integer getPartnumber() {
		return partnumber;
	}

//	@JSON(serialize=false)
	public PagerModel getPm() {
		return pm;
	}

	public String getResult() {
		return result;
	}

	@JSON(serialize=false)
	public Item getSitem() {
		return sitem;
	}

	public String list()
	{
		pm=itemService.getPagerDesc(Item.class);
		return "list";
	}
	
	
	public String search()
	{
		Map<String,String> like=new HashMap<String,String>();
		like.put("name", sitem.getName());
		like.put("description", sitem.getDescription());
		pm=itemService.fuzzyQuery(Item.class,like);
		return "list";
	}

	public String selectInput()
	{
		pm=itemService.getPager(Item.class);
		return "select_input";
	}

	/**
	 * "选择item"窗口中的查询
	 * @return
	 */
	public String selectSearch()
	{
		Map<String,String> like=new HashMap<String,String>();
		like.put("name", sitem.getName());
		like.put("description", sitem.getDescription());
		pm=itemService.fuzzyQuery(Item.class,like);
		return "select_input";
	}

	public void setAmounts(List<Integer> amounts) {
		this.amounts = amounts;
	}

	public void setIsSelectItemType(String isSelectItemType) {
		this.isSelectItemType = isSelectItemType;
	}

	public void setItem(Item item) {
		this.item = item;
	}


	public void setItemCategory(ItemCategory itemCategory) {
		this.itemCategory = itemCategory;
	}

	public void setItemid(Integer itemid) {
		this.itemid = itemid;
	}

	public void setItemRelationList(List<ItemRelation> itemRelationList) {
		this.itemRelationList = itemRelationList;
	}
	
@Resource(name="itemRelationServiceImpl")
public void setItemRelationService(ItemRelationService itemRelationService) {
	this.itemRelationService = itemRelationService;
}
	@Resource(name="itemServiceImpl")
	public void setItemService(ItemService itemService) {
		this.itemService = itemService;
	}
	
	public void setItemtypeid(Integer itemtypeid) {
		this.itemtypeid = itemtypeid;
	}
	
	@Resource(name="itemTypeServiceImpl")
	public void setItemTypeService(ItemTypeService itemTypeService) {
		this.itemTypeService = itemTypeService;
	}
	
	public void setLogger(Logger logger) {
		this.logger = logger;
	}
	public void setPartids(List<Integer> partids) {
		this.partids = partids;
	}

	public void setPartnumber(Integer partnumber) {
		this.partnumber = partnumber;
	}

	public void setPm(PagerModel pm) {
		this.pm = pm;
	}
	
	public void setResult(String result) {
		this.result = result;
	}
	
	public void setSitem(Item sitem) {
		this.sitem = sitem;
	}
	/**
	 * 更新
	 * @return
	 */
	public String update()
	{
		itemService.saveOrUpdate(item);
        return "pub_update_success";
	}
	/*************************各种Action**************************************************/
		public String verify()
		{
			result = itemService.checkExistsByName(itemName);
			return "success";
		}
	
}
