package com.fjsdfx.starerp.warehouse.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ItemTypeService;
import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.model.Employee;
import com.fjsdfx.starerp.persons.service.DepartmentService;
import com.fjsdfx.starerp.produce.model.Pergood;
import com.fjsdfx.starerp.produce.model.Preparation;
import com.fjsdfx.starerp.produce.service.PergoodService;
import com.fjsdfx.starerp.produce.service.PreparationService;
import com.fjsdfx.starerp.warehouse.model.Supsendm;
import com.fjsdfx.starerp.warehouse.model.Susgood;
import com.fjsdfx.starerp.warehouse.service.SupsendmService;
import com.fjsdfx.starerp.warehouse.service.SusgoodService;
import com.googlecode.jsonplugin.annotations.JSON;
import com.opensymphony.xwork2.ActionSupport;

@Controller
@Scope("prototype")
public class SupsendmAction extends ActionSupport{
	//model
	private Integer isOnlyOne = 0;
	private Integer thisfeeding;
	public Integer getThisfeeding() {
		return thisfeeding;
	}

	public void setThisfeeding(Integer thisfeeding) {
		this.thisfeeding = thisfeeding;
	}

	public Integer getIsOnlyOne() {
		return isOnlyOne;
	}

	public void setIsOnlyOne(Integer isOnlyOne) {
		this.isOnlyOne = isOnlyOne;
	}

	private List<Employee> workshopworkers;
	private List<Employee> productionworkers;
	private List<Employee> warehouseworkers;
	private Preparation preparation;
	private Supsendm supsendm;
	private Susgood susgood;
	private List<Susgood> susgoods;
	private List<Department> departments;
	private List<Integer> itemTypeIds;
	private List<Integer> singlesets;
	private List<Integer> generalnos;
	private List<Integer> bondednums;
	private List<Integer> tbalances;
	private List<Integer> lbalances;
	private List<String> notes;
	private ItemType itemType;
	private Integer needNum;
	private String lastfeeding;


	public String getLastfeeding() {
		return lastfeeding;
	}

	public void setLastfeeding(String lastfeeding) {
		this.lastfeeding = lastfeeding;
	}

	//service
	private SupsendmService supsendmService;
	private PreparationService preparationService;
	private PergoodService pergoodService;
	private SusgoodService susgoodService;
	private DepartmentService departmentService;
	private ItemTypeService itemTypeService;
	
	//pagerModel
	private PagerModel pm = new PagerModel();
	
	public Preparation getPreparation() {
		return preparation;
	}

	public void setPreparation(Preparation preparation) {
		this.preparation = preparation;
	}

	@JSON(serialize=false)
	public List<Employee> getWorkshopworkers() {
		return workshopworkers;
	}

	public void setWorkshopworkers(List<Employee> workshopworkers) {
		this.workshopworkers = workshopworkers;
	}

	public Integer getNeedNum() {
		return needNum;
	}

	public void setNeedNum(Integer needNum) {
		this.needNum = needNum;
	}

	@JSON(serialize=false)
	public List<Employee> getProductionworkers() {
		return productionworkers;
	}

	public void setProductionworkers(List<Employee> productionworkers) {
		this.productionworkers = productionworkers;
	}

	@JSON(serialize=false)
	public List<Employee> getWarehouseworkers() {
		return warehouseworkers;
	}

	public void setWarehouseworkers(List<Employee> warehouseworkers) {
		this.warehouseworkers = warehouseworkers;
	}
	
	@JSON(serialize=false)
	public List<Department> getDepartments() {
		return departments;
	}

	public void setDepartments(List<Department> departments) {
		this.departments = departments;
	}

	@JSON(serialize=false)
	public List<Integer> getItemTypeIds() {
		return itemTypeIds;
	}

	public void setItemTypeIds(List<Integer> itemTypeIds) {
		this.itemTypeIds = itemTypeIds;
	}

	@JSON(serialize=false)
	public List<Integer> getSinglesets() {
		return singlesets;
	}

	public void setSinglesets(List<Integer> singlesets) {
		this.singlesets = singlesets;
	}

	@JSON(serialize=false)
	public List<Integer> getGeneralnos() {
		return generalnos;
	}

	public void setGeneralnos(List<Integer> generalnos) {
		this.generalnos = generalnos;
	}

	@JSON(serialize=false)
	public List<Integer> getBondednums() {
		return bondednums;
	}

	public void setBondednums(List<Integer> bondednums) {
		this.bondednums = bondednums;
	}

	@JSON(serialize=false)
	public List<Integer> getTbalances() {
		return tbalances;
	}

	public void setTbalances(List<Integer> tbalances) {
		this.tbalances = tbalances;
	}

	@JSON(serialize=false)
	public List<Integer> getLbalances() {
		return lbalances;
	}

	public void setLbalances(List<Integer> lbalances) {
		this.lbalances = lbalances;
	}

	@JSON(serialize=false)
	public List<String> getNotes() {
		return notes;
	}

	public void setNotes(List<String> notes) {
		this.notes = notes;
	}

	public PagerModel getPm() {
		return pm;
	}

	public void setPm(PagerModel pm) {
		this.pm = pm;
	}

	public Supsendm getSupsendm() {
		return supsendm;
	}

	public void setSupsendm(Supsendm supsendm) {
		this.supsendm = supsendm;
	}

	public Susgood getSusgood() {
		return susgood;
	}

	public void setSusgood(Susgood susgood) {
		this.susgood = susgood;
	}
	
	@JSON(serialize=false)
	public List<Susgood> getSusgoods() {
		return susgoods;
	}

	public void setSusgoods(List<Susgood> susgoods) {
		this.susgoods = susgoods;
	}

	@JSON(serialize=false)
	public PergoodService getPergoodService() {
		return pergoodService;
	}

	@Resource
	public void setPergoodService(PergoodService pergoodService) {
		this.pergoodService = pergoodService;
	}

	@JSON(serialize=false)
	public PreparationService getPreparationService() {
		return preparationService;
	}

	@Resource
	public void setPreparationService(PreparationService preparationService) {
		this.preparationService = preparationService;
	}

	@JSON(serialize=false)
	public SupsendmService getSupsendmService() {
		return supsendmService;
	}

	@Resource
	public void setSupsendmService(SupsendmService supsendmService) {
		this.supsendmService = supsendmService;
	}
	

	@JSON(serialize=false)
	public ItemTypeService getItemTypeService() {
		return itemTypeService;
	}

	@Resource
	public void setItemTypeService(ItemTypeService itemTypeService) {
		this.itemTypeService = itemTypeService;
	}

	@JSON(serialize=false)
	public SusgoodService getSusgoodService() {
		return susgoodService;
	}

	@Resource
	public void setSusgoodService(SusgoodService susgoodService) {
		this.susgoodService = susgoodService;
	}

	public ItemType getItemType() {
		return itemType;
	}

	public void setItemType(ItemType itemType) {
		this.itemType = itemType;
	}

	@JSON(serialize=false)
	public DepartmentService getDepartmentService() {
		return departmentService;
	}

	@Resource
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}

	
	public String addSingle() throws Exception
	{
		supsendmService.saveByPreid(supsendm, preparation.getId());
		susgoodService.saveSusgoods(supsendm, itemTypeIds, singlesets, generalnos, bondednums, tbalances, lbalances, notes);
		return "pub_add_success";
	}
	
	public String search() throws Exception
	{
		Map<String,String> like=new HashMap<String,String>();
		like.put("partno", supsendm.getPartno());
		like.put("department.dptName", supsendm.getDepartment().getDptName());
		pm=supsendmService.fuzzyQuery(Supsendm.class,like);
		return "list";
	}
	
	public String del() throws Exception
	{
		supsendmService.deleteById(supsendm.getSus_id());
		return "pub_del_success";
	}
	
	public String update() throws Exception
	{
		supsendmService.update(supsendm, itemTypeIds, singlesets, generalnos, bondednums, tbalances, lbalances, notes);
		return "pub_update_success";
	}
	
	public String list() throws Exception
	{
		return "list";
	}
	
	public String preparationList() throws Exception
	{
		pm=preparationService.getPagerDesc(Preparation.class, "where o.department.dptName !='生产部' and (o.addsup = 0 or o.addsup is null) and (select count(*) from Accredition ac where ac.preparation.id = o.id) = 2");
		return "preparation_list";
	}
	
	public String selectedPreparation() throws Exception
	{
		preparation = preparationService.findById(Preparation.class, preparation.getId());
		pm = pergoodService.getPagerDesc(Pergood.class, "where o.preparation.id = "+preparation.getId());
		for(int i=0;i<pm.getDatas().size();i++)
		{
			Pergood p = (Pergood) pm.getDatas().get(i);
			if(null==p.getAddsup()||p.getAddsup()==0) isOnlyOne++;
			System.out.println("------------"+","+p.getId()+","+p.getAddsup());
		}
		System.out.println("pm.getDatas().size() = "+pm.getDatas().size());
		System.out.println("isOnlyOne = "+isOnlyOne);
		return "selected_preparation";
	}
	
	/*
	 * 各类input
	 */
	public String addInput() throws Exception
	{
		itemType = itemTypeService.findById(ItemType.class, itemType.getId());
		departments = departmentService.getAllDepartments();
		workshopworkers = supsendmService.getWorkshopWorkers();
		warehouseworkers = supsendmService.getProductionWorkers();
		productionworkers = supsendmService.getProductionWorkers();
		preparation = preparationService.findById(Preparation.class, preparation.getId());
		susgoods = susgoodService.createDefaultSusgoodsByPartItemTypes(supsendmService.getPartItemTypes(preparationService.getPreparationItemTypeInfos(preparation)),needNum);
		return "add_input";
	}
	
	public String addSingleInput() throws Exception
	{
		itemType = itemTypeService.findById(ItemType.class, itemType.getId());
		departments = departmentService.getAllDepartments();
		workshopworkers = supsendmService.getWorkshopWorkers();
		warehouseworkers = supsendmService.getProductionWorkers();
		productionworkers = supsendmService.getProductionWorkers();
		preparation = preparationService.findById(Preparation.class, preparation.getId());
		susgoods = susgoodService.createDefaultSusgoodsByPartItemTypes(supsendmService.getSinglePartItemTypes(itemType.getId(), needNum),needNum);
		//上次的投料套数
		lastfeeding = supsendmService.getLastFeeding(itemType.getId())+"";
		thisfeeding = Integer.parseInt(lastfeeding)+needNum;
		return "addsingle_input";
	}
	
	public String updateInput() throws Exception
	{
		departments = departmentService.getAllDepartments();
		workshopworkers = supsendmService.getWorkshopWorkers();
		warehouseworkers = supsendmService.getWarehouseWorkers();
		productionworkers = supsendmService.getProductionWorkers();
		supsendm=supsendmService.findById(Supsendm.class, supsendm.getSus_id());
		susgoods = susgoodService.getSusgoodsBySupsendmId(supsendm.getSus_id());
		itemType = itemTypeService.findById(ItemType.class, supsendm.getItemType().getId());
		
		return "update_input";
	}
	
	public String getLastFeeding() throws Exception
	{
		lastfeeding = supsendmService.getLastFeeding(supsendm.getItemType().getId())+"";
		return SUCCESS;
	}
	
}
