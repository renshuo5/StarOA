package com.fjsdfx.starerp.warehouse.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.item.model.ControllerunitInfo;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ItemTypeService;
import com.fjsdfx.starerp.produce.model.Pergood;
import com.fjsdfx.starerp.produce.model.Preparation;
import com.fjsdfx.starerp.produce.service.PergoodService;
import com.fjsdfx.starerp.produce.service.PreparationService;
import com.fjsdfx.starerp.warehouse.model.Supsendm3;
import com.fjsdfx.starerp.warehouse.model.Susgood3;
import com.fjsdfx.starerp.warehouse.service.Supsendm3Service;
import com.fjsdfx.starerp.warehouse.service.Susgood3Service;
import com.opensymphony.xwork2.ActionSupport;

@Controller
@Scope("prototype")
public class Supsendm3Action extends ActionSupport {
	//model
	private PagerModel pm = new PagerModel();
	private ItemType itemType;
	private Integer needNum;
	private Preparation preparation;
	private Supsendm3 supsendm3;
	private List<Integer> itemTypeIds;
	private List<ControllerunitInfo> controllerunitInfos;
	private List<Integer> singlesets;
	private List<Integer> needNums;
	private List<Integer> pracNums;
	private List<String> notes;
	private List<Susgood3> susgood3s;
	private List<Integer> confirms;
	private List<Integer> seriNums;
	private Integer isOnlyOne = 0;
	private Integer isExtra;
	private Integer isConfirm;//是否车间确认
	private Integer isAllConfirm;
	private List<Integer> susgood3ids;
	//service
	private ItemTypeService itemTypeService;
	private Supsendm3Service supsendm3Service;
	private PreparationService preparationService;
	private Susgood3Service susgood3Service;
	private PergoodService pergoodService;
	
	public String add() throws Exception
	{
		supsendm3.setItemType(itemTypeService.findById(ItemType.class, itemType.getId()));
		supsendm3 = supsendm3Service.saveByPreparationId(supsendm3,preparation.getId());
		susgood3Service.saveBySupsendm3(supsendm3,seriNums,itemTypeIds,controllerunitInfos,singlesets,needNums,pracNums,notes);
		if(isExtra!=null&&isExtra==1) susgood3Service.deleteExtraSusgood3s(susgood3ids);
		return "pub_add_success";
	}
	public String del() throws Exception
	{
		supsendm3Service.deleteSupsendm3(supsendm3Service.findById(Supsendm3.class, supsendm3.getId()));
		return "pub_del_success";
	}
	public String update() throws Exception
	{
		supsendm3Service.updateSupsendm3(supsendm3);
		return "pub_update_success";
	}
	public String list() throws Exception
	{
		pm = supsendm3Service.getPagerDesc(Supsendm3.class);
		return "list";
	}
	public String search() throws Exception
	{
		Map<String,String> like=new HashMap<String,String>();
		like.put("department.dptName", supsendm3.getDepartment().getDptName());
		like.put("hawversion", supsendm3.getHawversion());
		pm=supsendm3Service.fuzzyQuery(Supsendm3.class,like);
		return "list";
	}
	public String preparationList() throws Exception
	{
		pm=preparationService.getPagerDesc(Preparation.class, "where o.department.dptName ='生产部' and (o.addsup = 0 or o.addsup is null) and (select count(*) from Accredition ac where ac.preparation.id = o.id) = 2");
		return "preparation_list";
	}
	public String selectedPreparation() throws Exception
	{
		preparation = preparationService.findById(Preparation.class, preparation.getId());
		pm = pergoodService.getPagerDesc(Pergood.class, "where o.preparation.id = "+preparation.getId());
		for(int i=0;i<pm.getDatas().size();i++)
		{
			Pergood p = (Pergood) pm.getDatas().get(i);
			Integer addsup = p.getAddsup();
			if(null==addsup||addsup==0) isOnlyOne++;
		}
		return "selected_preparation";
	}
	public String confirmInput() throws Exception
	{
		supsendm3 = supsendm3Service.findById(Supsendm3.class, supsendm3.getId());
		susgood3s = susgood3Service.getSusgood3sBySupsendm3Id(supsendm3.getId());
		return "confirm_input";
	}
	public String confirm() throws Exception
	{
		supsendm3 = supsendm3Service.findById(Supsendm3.class, supsendm3.getId());
		susgood3Service.confirm(supsendm3, susgood3ids, confirms);
		return "pub_update_success";
	}
	/**
	 * 各类input
	 */
	public String addInput() throws Exception
	{
		preparation = preparationService.findById(Preparation.class, preparation.getId());
		itemType = itemTypeService.findById(ItemType.class, itemType.getId());
		susgood3s = susgood3Service.createDefaultSusgood3s(itemType,needNum);
		return "add_input";
	}
	public String addExtraInput() throws Exception
	{
		preparation = preparationService.findById(Preparation.class, preparation.getId());
		itemType = itemTypeService.findById(ItemType.class, itemType.getId());
		susgood3s = susgood3Service.createExtraDefaultSusgood3s(itemType);
		return "addExtra_input";
	}
	public String editInput() throws Exception
	{
		supsendm3 = supsendm3Service.findById(Supsendm3.class, supsendm3.getId());
		susgood3s = susgood3Service.getSusgood3sBySupsendm3Id(supsendm3.getId());
		return "edit_input";
	}
	/********************************get and set**********************************/
	public Supsendm3Service getSupsendm3Service() {
		return supsendm3Service;
	}
	@Resource
	public void setSupsendm3Service(Supsendm3Service supsendm3Service) {
		this.supsendm3Service = supsendm3Service;
	}
	public PagerModel getPm() {
		return pm;
	}
	public void setPm(PagerModel pm) {
		this.pm = pm;
	}
	public PreparationService getPreparationService() {
		return preparationService;
	}
	@Resource
	public void setPreparationService(PreparationService preparationService) {
		this.preparationService = preparationService;
	}
	public ItemType getItemType() {
		return itemType;
	}
	public void setItemType(ItemType itemType) {
		this.itemType = itemType;
	}
	public Integer getNeedNum() {
		return needNum;
	}
	public void setNeedNum(Integer needNum) {
		this.needNum = needNum;
	}
	public Preparation getPreparation() {
		return preparation;
	}
	public void setPreparation(Preparation preparation) {
		this.preparation = preparation;
	}
	public ItemTypeService getItemTypeService() {
		return itemTypeService;
	}
	@Resource
	public void setItemTypeService(ItemTypeService itemTypeService) {
		this.itemTypeService = itemTypeService;
	}
	public Supsendm3 getSupsendm3() {
		return supsendm3;
	}
	public void setSupsendm3(Supsendm3 supsendm3) {
		this.supsendm3 = supsendm3;
	}
	public Susgood3Service getSusgood3Service() {
		return susgood3Service;
	}
	@Resource
	public void setSusgood3Service(Susgood3Service susgood3Service) {
		this.susgood3Service = susgood3Service;
	}
	public List<Integer> getItemTypeIds() {
		return itemTypeIds;
	}
	public void setItemTypeIds(List<Integer> itemTypeIds) {
		this.itemTypeIds = itemTypeIds;
	}
	public List<ControllerunitInfo> getControllerunitInfos() {
		return controllerunitInfos;
	}
	public void setControllerunitInfos(List<ControllerunitInfo> controllerunitInfos) {
		this.controllerunitInfos = controllerunitInfos;
	}
	public List<Integer> getSinglesets() {
		return singlesets;
	}
	public void setSinglesets(List<Integer> singlesets) {
		this.singlesets = singlesets;
	}
	public List<Integer> getNeedNums() {
		return needNums;
	}
	public void setNeedNums(List<Integer> needNums) {
		this.needNums = needNums;
	}
	public List<Integer> getPracNums() {
		return pracNums;
	}
	public void setPracNums(List<Integer> pracNums) {
		this.pracNums = pracNums;
	}
	public List<String> getNotes() {
		return notes;
	}
	public void setNotes(List<String> notes) {
		this.notes = notes;
	}
	public List<Susgood3> getSusgood3s() {
		return susgood3s;
	}
	public void setSusgood3s(List<Susgood3> susgood3s) {
		this.susgood3s = susgood3s;
	}
	public Integer getIsOnlyOne() {
		return isOnlyOne;
	}
	public void setIsOnlyOne(Integer isOnlyOne) {
		this.isOnlyOne = isOnlyOne;
	}
	public PergoodService getPergoodService() {
		return pergoodService;
	}
	@Resource
	public void setPergoodService(PergoodService pergoodService) {
		this.pergoodService = pergoodService;
	}
	public Integer getIsExtra() {
		return isExtra;
	}
	public void setIsExtra(Integer isExtra) {
		this.isExtra = isExtra;
	}
	public Integer getIsConfirm() {
		return isConfirm;
	}
	public void setIsConfirm(Integer isConfirm) {
		this.isConfirm = isConfirm;
	}
	public Integer getIsAllConfirm() {
		return isAllConfirm;
	}
	public void setIsAllConfirm(Integer isAllConfirm) {
		this.isAllConfirm = isAllConfirm;
	}
	public List<Integer> getConfirms() {
		return confirms;
	}
	public void setConfirms(List<Integer> confirms) {
		this.confirms = confirms;
	}
	public List<Integer> getSusgood3ids() {
		return susgood3ids;
	}
	public void setSusgood3ids(List<Integer> susgood3ids) {
		this.susgood3ids = susgood3ids;
	}
	public List<Integer> getSeriNums() {
		return seriNums;
	}
	public void setSeriNums(List<Integer> seriNums) {
		this.seriNums = seriNums;
	}
}
