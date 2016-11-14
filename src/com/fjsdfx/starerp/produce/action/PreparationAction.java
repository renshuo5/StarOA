package com.fjsdfx.starerp.produce.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.security.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;

import com.fjsdfx.starerp.common.bean.PagerInfo;
import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.item.model.Item;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ItemService;
import com.fjsdfx.starerp.item.service.ItemTypeService;
import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.service.DepartmentService;
import com.fjsdfx.starerp.persons.service.EmployeeService;
import com.fjsdfx.starerp.produce.model.Accredition;
import com.fjsdfx.starerp.produce.model.Pergood;
import com.fjsdfx.starerp.produce.model.Preparation;
import com.fjsdfx.starerp.produce.service.AccreditionService;
import com.fjsdfx.starerp.produce.service.PergoodService;
import com.fjsdfx.starerp.produce.service.PreparationService;
import com.fjsdfx.starerp.security.model.User;
import com.googlecode.jsonplugin.annotations.JSON;
import com.opensymphony.xwork2.ActionSupport;

/**
 * preparationAction 要货计划单action
 * 
 * @author zhuf
 * 
 */
@Controller
@Scope("prototype")
public class PreparationAction extends ActionSupport{
	/**
	 * ajax返回结果
	 */
	private String result;
	/**
	 * 当前用户
	 */
	private User curUser = null;
	/**
	 * 要货单service
	 */
	private PreparationService preparationService;
	/**
	 * itemService
	 */
	private ItemService itemService;
	/**
	 * itemTypeService
	 */
	private ItemTypeService itemTypeService;
	/**
	 * 要货单
	 */
	private Preparation preparation;

	/**
	 * 品工部评审表
	 */
	private Accredition accredition;

	/**
	 * 生产部评审表
	 */
	private Accredition produceAccredition;
	/**
	 * 人员id
	 */
	private Integer employeeId;
	/**
	 * 是否选择型号
	 */
	private Integer isSelectItemType;
	/**
	 * dptId
	 */
	private Integer dptId;

	/**
	 * 审核状态
	 */
	private List<String> status;
	

	private Integer partnumber;
	/**
	 * departmentList
	 */
	private List<Department> departmentList;

	// 以下是要货内容
	/**
	 * 货物品名列表
	 */
	private List<Integer> itemIdList;

	/**
	 * 货物规格列表
	 */
	private List<Integer> itemTypeIdList;

	/**
	 * 数量列表
	 */
	private List<Integer> preNumList;

	/**
	 * 进仓时间列表
	 */
	private List<Date> edateList;

	/**
	 * itemid
	 */
	private Integer sitemid;
	/**
	 * 备注列表
	 */
	private List<String> prenoteList;

	/**
	 * 要货物品
	 */
	private List<Pergood> pergoods;

	/**
	 * 要货记录id
	 */
	private List<Integer> pergoodIds;

	// service
	/**
	 * PergoodService
	 */
	private PergoodService pergoodService;

	/**
	 * EmployeeService
	 */
	private EmployeeService employeeService;

	/**
	 * departmentService
	 */
	private DepartmentService departmentService;

	/**
	 * AccreditionService 评审表service
	 */
	private AccreditionService accreditionService;
	/**
	 * 用户所属部门
	 */
	private Department department;
	/**
	 * 分页
	 */
	private PagerModel pm;

	/**
	 * 转跳到要货单列表
	 * 
	 * @return 返回到要货单列表
	 */
	public String list() {
		pm = preparationService.getPagerDesc(Preparation.class,"where (select count(*) from Accredition ac where ac.preparation.id = o.id) = 2");
		return "list";
	}

	public String pass(){
		
		pm=preparationService.getPagerDesc(Preparation.class,"where o.id not in (select ps.preparation.id from Prscheck ps )and o.department.dptName!='生产部' and o.pleader.empId is not null and (select count(*) from Accredition ac where ac.preparation.id = o.id) = 2");
				
		System.out.println("显示："+pm.getDatas());
		return "pass";
	}
	
	
	/**
	 * 转跳到要货计划单审核列表
	 * 
	 * @return 返回到要货单待审列表
	 */
	public String examineList() {
		//以下过程可以改为一句hql查询 然后再遍历datas 遍历时再从评审表获得评审状态
		pm = new PagerModel();

		List<Preparation> preparations1 = new ArrayList<Preparation>();
		preparations1 = preparationService
				.findByHql("from Preparation o where o.pleader is null and o.department.dptName!='生产部' ");
		List<Preparation> preparations2 = new ArrayList<Preparation>();
		preparations2 = preparationService
				.findByHql("from Preparation p where p.pleader is not null and p.department.dptName!='生产部'");
		List<Preparation> preparations3 = new ArrayList<Preparation>();
		for (Preparation preparation : preparations2) {
			if (accreditionService.findByHql(
					"from Accredition a where a.preparation.id = "
							+ preparation.getId()).size() < 2) {
				preparations3.add(preparation);
			}
		}
		List<Preparation> preparations = new ArrayList<Preparation>();
		preparations.addAll(preparations1);
		preparations.addAll(preparations3);
		
		//因为没有调用 pager的getpagerdesc  只好自行模拟分页部分-  -
		pm.setTotal(preparations.size());
		Integer maxSize = PagerInfo.getOffset()+PagerInfo.getPagesize();
		if(maxSize<preparations.size()){
			preparations = preparations.subList(PagerInfo.getOffset(), maxSize);
		}else {
			preparations = preparations.subList(PagerInfo.getOffset(), preparations.size());
		}
		
		System.out.println("offset " + PagerInfo.getOffset());
		System.out.println("pagesize " + PagerInfo.getPagesize());
		System.out.println("maxSize " + maxSize);
		
		pm.setDatas(preparations);

		status = new ArrayList<String>();
		String statuString;
		Character pleaderString;// 领导审核状态
		Character proString;// 生产部审核状态
		Character qualityString;// 品工部审核状态
		List<Accredition> accreditions = new ArrayList<Accredition>();
		for (Preparation preparation : preparations) {
			statuString = new String();
			statuString = "";
			pleaderString = '0';
			proString = '0';
			qualityString = '0';
			pleaderString = (preparation.getPleader() == null ? '0' : '1');

			accreditions = accreditionService
					.findByHql("from Accredition o where o.preparation.id="
							+ preparation.getId());
			for (Accredition accredition : accreditions) {
				if (accredition.getEmployee().getDepartment().getDptName()
						.equals("生产部")) {
					proString = '1';
				} else {
					qualityString = '1';
				}
			}
			
			statuString = "" + pleaderString + qualityString + proString;
			status.add(statuString);
		}
		return "examine_list";
	}
	public String printexamineListInsider() {
		//以下过程可以改为一句hql查询 然后再遍历datas 遍历时再从评审表获得评审状态
		pm = new PagerModel();
		List<Preparation> preparations1 = new ArrayList<Preparation>();
		
		List<Preparation> preparations2 = new ArrayList<Preparation>();
		preparations2 = preparationService
				.findByHql("from Preparation s where  s.department.dptName='生产部'");
		List<Preparation> preparations3 = new ArrayList<Preparation>();
		for (Preparation preparation : preparations2) {
			if (accreditionService.findByHql(
					"from Accredition a where a.preparation.id = "
							+ preparation.getId()).size() < 2) {
				preparations3.add(preparation);
			}
		}
		List<Preparation> preparations = new ArrayList<Preparation>();
	
		preparations.addAll(preparations3);
		
		//因为没有调用 pager的getpagerdesc  只好自行模拟分页部分-  -
		pm.setTotal(preparations.size());
		Integer maxSize = PagerInfo.getOffset()+PagerInfo.getPagesize();
		if(maxSize<preparations.size()){
			preparations = preparations.subList(PagerInfo.getOffset(), maxSize);
		}else {
			preparations = preparations.subList(PagerInfo.getOffset(), preparations.size());
		}
		
		System.out.println("offset " + PagerInfo.getOffset());
		System.out.println("pagesize " + PagerInfo.getPagesize());
		System.out.println("maxSize " + maxSize);
		
		pm.setDatas(preparations);

		status = new ArrayList<String>();
		String statuString;
//		Character pleaderString;// 领导审核状态
		Character proString;// 生产部审核状态
		Character qualityString;// 品工部审核状态
		List<Accredition> accreditions = new ArrayList<Accredition>();
		for (Preparation preparation : preparations) {
			statuString = new String();
			statuString = "";
//			pleaderString = '1';
			proString = '0';
			qualityString = '0';
		

			accreditions = accreditionService
					.findByHql("from Accredition o where o.preparation.id="
							+ preparation.getId());
			for (Accredition accredition : accreditions) {
				if (accredition.getEmployee().getDepartment().getDptName()
						.equals("生产部")) {
					proString = '1';
				} else {
					qualityString = '1';
				}
			}
			
			statuString = ""/*+ pleaderString*/ + qualityString + proString;
			status.add(statuString);
		}
		return "examine_list_insider";
	}

	/**
	 * 转跳到添加要货单页面
	 * 
	 * @return 返回到要货计划单
	 */
	public String addInput() {
		User curUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		preparation = new Preparation();
		preparation.setPerson(curUser.getEmployee());
		department = departmentService.findById(Department.class, curUser.getEmployee().getDepartment().getId());
		return "add_input";
	}

	/**
	 * 转跳到套货单修改页面
	 * 
	 * @return 返回修改页面
	 */
	public String editInput() {
		preparation = preparationService.findById(Preparation.class,
				preparation.getId());
		pergoods = new ArrayList<Pergood>();
		pergoods = pergoodService.getPergoods(preparation.getId());
		departmentList = departmentService.findByHql("from Department");
		return "edit_input";
	}

	/**
	 * 转跳到审核页面
	 * 
	 * @return
	 */
	public String examineInput() {
		User curUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		preparation = preparationService.findById(Preparation.class,
				preparation.getId());
		pergoods = pergoodService
				.findByHql("from Pergood p where p.preparation.id = "
						+ preparation.getId());

		return "examine_input";
	}

	/**
	 * 进入品工部审核
	 * 
	 * @return 返回品工部审核页面
	 */
	public String pingongExamineInput() {
		User curUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		preparation = preparationService.findById(Preparation.class,
				preparation.getId());
		pergoods = pergoodService
				.findByHql("from Pergood p where p.preparation.id = "
						+ preparation.getId());
		accredition = new Accredition();
		accredition.setEmployee(curUser.getEmployee());
		return "pingongexamine_input";
	}

	
	public String pingongExamineInputInside() {
		User curUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		preparation = preparationService.findById(Preparation.class,
				preparation.getId());
		pergoods = pergoodService
				.findByHql("from Pergood p where p.preparation.id = "
						+ preparation.getId());
		accredition = new Accredition();
		accredition.setEmployee(curUser.getEmployee());
		return "pingongexamine_inputInside";
	}
	public String produceExamineInput() {
		User curUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		preparation = preparationService.findById(Preparation.class,
				preparation.getId());
		pergoods = pergoodService
				.findByHql("from Pergood p where p.preparation.id = "
						+ preparation.getId());
		String hql = "from Accredition a where a.preparation.id = "
			+ preparation.getId();
		System.out.println("hql:"+hql);
		List<Accredition> accreditions = accreditionService.findByHql(hql);
		System.out.println("accreditions's size = "+accreditions.size());
		accredition = accreditions.get(0);
		produceAccredition = new Accredition();
		produceAccredition.setEmployee(curUser.getEmployee());
		return "produceexamine_input";
	}
	
	public String produceExamineInputInside() {
		User curUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		preparation = preparationService.findById(Preparation.class,
				preparation.getId());
		pergoods = pergoodService
				.findByHql("from Pergood p where p.preparation.id = "
						+ preparation.getId());
		String hql = "from Accredition a where a.preparation.id = "
			+ preparation.getId();
		
		List<Accredition> accreditions = accreditionService.findByHql(hql);
		System.out.println("accreditions's size = "+accreditions.size());
		accredition = accreditions.get(0);
		produceAccredition = new Accredition();
		produceAccredition.setEmployee(curUser.getEmployee());
		return "produceexamine_inputInside";
	}

	public String fulfillInput() {
		preparation = preparationService.findById(Preparation.class,
				preparation.getId());
		pergoods = pergoodService
				.findByHql("from Pergood p where p.preparation.id = "
						+ preparation.getId());
		List<Accredition> accreditions = accreditionService.findByHql(
				"from Accredition a where a.preparation.id = "
						+ preparation.getId());
		System.out.println("这里"+accreditions.toString());
//		/*for (Accredition acc : accreditions) {
//			String temp = acc.;
//			
//			if(temp.equals("品工部")){
//				accredition =acc;
//				System.out.println("哈哈"+accredition.getContent());
//			}else if(temp.equals("生产部")){
//				produceAccredition =acc;
//				System.out.println("内容是："+produceAccredition.getContent());
//			}
//		}*/
		
		
		//这里刚好是两个部门，而且第一条记录是品工部，第二条是生产部。所以直接取。
			accredition=accreditions.get(0);
			produceAccredition=accreditions.get(1);
			
		
		return "fulfill_input";
	}
	
	public String confimationInput() {
		preparation = preparationService.findById(Preparation.class,
				preparation.getId());
		pergoods = pergoodService
				.findByHql("from Pergood p where p.preparation.id = "
						+ preparation.getId());
		List<Accredition> accreditions = accreditionService.findByHql(
				"from Accredition a where a.preparation.id = "
						+ preparation.getId());
//		for (Accredition acc : accreditions) {
//			String temp = acc.getEmployee().getDepartment().getDptName();
//			if(temp.equals("品工部")){
//				accredition = acc;
//			}else if(temp.equals("生产部")){
//				produceAccredition = acc;
//			}
//		}
		
		//这里刚好是两个部门，而且第一条记录是品工部，第二条是生产部。所以直接取。
		accredition=accreditions.get(0);
		produceAccredition=accreditions.get(1);
		
		
		return "confimation_input";
	}

	/**
	 * 添加要货单
	 * 
	 * @return 返回到要货单列表
	 */
	public String add() {
		User curUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		Department department;
		if (!preparation.getPresn().equals("")) {
			List<Preparation> preparations = preparationService.findByHql("from Preparation");
			for (Preparation preparationFor : preparations) {
				if(preparationFor.getPresn().equals(preparation.getPresn())){
					return "pub_exception";
				}
			}
			if (dptId != null) {
				department = departmentService
						.findById(Department.class, dptId);
				preparation.setDepartment(department);
			}
			preparation.setPerson(curUser.getEmployee());
			preparationService.save(preparation);

			if (!itemTypeIdList.isEmpty()) {
				if (!preparationService.savePergoods(preparation,
						itemTypeIdList, preNumList, edateList, prenoteList)) {
					return "pub_exception";
				}
			}
		}
		if(preparation.getDepartment().getDptName().equals("生产部"))
			return "return_examine_insideOrderlist";
		return "return_examine_list";
	}
	
	
	
	/**
	 * 添加要货单
	 * 
	 * @return 返回到要货单列表
	 */
	public String addInside() {
		User curUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		Department department;
		if (!preparation.getPresn().equals("")) {
			List<Preparation> preparations = preparationService.findByHql("from Preparation");
			for (Preparation preparationFor : preparations) {
				if(preparationFor.getPresn().equals(preparation.getPresn())){
					return "pub_exception";
				}
			}
			    // dptId=2;这里是个特例。
			if(dptId!=null){
				department = departmentService
						.findById(Department.class, dptId);
				preparation.setDepartment(department);
			}
			preparation.setPerson(curUser.getEmployee());
			preparationService.save(preparation);

			if (!itemTypeIdList.isEmpty()) {
				if (!preparationService.savePergoods(preparation,
						itemTypeIdList, preNumList, edateList, prenoteList)) {
					return "pub_exception";
				}
			}
		}
		return "return_examine_insideOrderlist";
	}
	

	public String edit() {
		User curUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		Preparation newPreparation = new Preparation();
		newPreparation = preparationService.findById(Preparation.class,
				preparation.getId());
		if (!preparation.getPresn().equals("")) {
			if (dptId != null) {
				Department department = departmentService.findById(
						Department.class, dptId);
				newPreparation.setDepartment(department);
			}
			newPreparation.setPerson(curUser.getEmployee());
			newPreparation.setPdate(preparation.getPdate());
			newPreparation.setSdate(preparation.getSdate());
			preparationService.update(newPreparation);

			if (!itemTypeIdList.isEmpty()) {
				if (!preparationService.updatePergoods(preparation,
						itemTypeIdList, preNumList, edateList, prenoteList,
						preparation.getId())) {
					return "pub_exception";
				}
			}
		}
		return "pub_update_success";
	}

	/**
	 * 删除记录
	 * 
	 * @return 跳转回列表
	 */
	public String del() {
		if (preparationService.deleteByPreparationId(preparation.getId())) {
			return "pub_del_success";
		}
		return "pub_exception";
	}

	public String search() {
		Map likeMap = new HashMap();
		likeMap.put("presn", preparation.getPresn());
		System.out.println("likeMap size is " + likeMap.size());
		pm = preparationService.fuzzyQuery(Preparation.class, likeMap);
		return "list";
	}

	// 关键~！！！！！！！！！！！！！！！！！！！重要~~~！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！
	/**
	 * 1.由于部门不是自关联 无法使用像营运中心的之类的部门 来进行 编制单位领导审批 的领导权限审查 等到部门实现 部门 与 子部门的关系后
	 * 这里要加入 领导权限审查 2.据客户方说 营运中心是总公司的，评审总是由业务部进行 现在改为检查为业务部 这样的情况下
	 * 只需要权限设置那边设置好了访问权限 这边就可以不做判断了
	 * 
	 * @return
	 */
	public String examine() {
		User curUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		preparation = preparationService.findById(Preparation.class,
				preparation.getId());
		preparation.setPleader(curUser.getEmployee());
		preparationService.update(preparation);
		return "return_examine_list";
	}

	public String pingongExamine() {
		User curUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		preparation = preparationService.findById(Preparation.class,
				preparation.getId());
		accredition.setPreparation(preparation);
		accredition.setEmployee(curUser.getEmployee());
		accreditionService.save(accredition);
		return "return_examine_list";
	}
   
	
	public String pingongExamineInside() {
		User curUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		preparation = preparationService.findById(Preparation.class,
				preparation.getId());
		accredition.setPreparation(preparation);
		accredition.setEmployee(curUser.getEmployee());
		System.out.println("执行到这里了！！！");
		accreditionService.save(accredition);
		return "return_examine_insideOrderlist";
	}
	
	public String produceExamine() {
		User curUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		preparation = preparationService.findById(Preparation.class,
				preparation.getId());
		produceAccredition.setPreparation(preparation);
		produceAccredition.setEmployee(curUser.getEmployee());
		accreditionService.save(produceAccredition);
		return "return_list";
	}
	
	
	public String produceExamineInside() {
		User curUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		preparation = preparationService.findById(Preparation.class,
				preparation.getId());
		System.out.println("preparation.getId() = "+preparation.getId());
		produceAccredition.setPreparation(preparation);
		produceAccredition.setEmployee(curUser.getEmployee());
		accreditionService.save(produceAccredition);
		return "return_list";
	}

	/**
	 * 履行情况记录
	 * @return
	 */
	public String fulfill() {
		Preparation preparationFulfill = preparationService.findById(Preparation.class, preparation.getId());
		preparationFulfill.setFulfillment(preparation.getFulfillment());
		preparationService.update(preparationFulfill);
		return "return_list";
	}
	
	/**
	 * 变更或履行情况确认
	 * @return
	 */
	public String confimation() {
		Preparation preparationConfimation = preparationService.findById(Preparation.class, preparation.getId());
		preparationConfimation.setConfimation(preparation.getConfimation());
		preparationService.update(preparationConfimation);
		return "return_list";
	}
	//在查询页面里显示要货计划单信息
	public String show() {
		preparation = preparationService.findById(Preparation.class,
				preparation.getId());
		pergoods = new ArrayList<Pergood>();
		pergoods = pergoodService.getPergoods(preparation.getId());
		List<Accredition> accreditions = accreditionService.findByHql(
				"from Accredition a where a.preparation.id = "
						+ preparation.getId());
//		for (Accredition acc : accre ditions) {
//			String temp = acc.getEmployee().getDepartment().getDptName();
//		if(temp.equals("品工部")){
//			accredition = acc;
//			}else if(temp.equals("生产部")){
//				produceAccredition = acc;
//			}
//		}
		//这里刚好是两个部门，而且第一条记录是品工部，第二条是生产部。所以直接取。
		accredition=accreditions.get(0);
		produceAccredition=accreditions.get(1);
		return "show";
	}
      //显示审核时候显示订单信息。
	public String showOutOrder() {
		preparation = preparationService.findById(Preparation.class,
				preparation.getId());
		pergoods = new ArrayList<Pergood>();
		pergoods = pergoodService.getPergoods(preparation.getId());
		List<Accredition> accreditions = accreditionService.findByHql(
				"from Accredition a where a.preparation.id = "
						+ preparation.getId());
		for (Accredition acc : accreditions) {
			String temp = acc.getEmployee().getDepartment().getDptName();
	        accredition = acc;
		}
	   return "show";
	  }
	
	public String selectItem()
	{
		curUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(curUser.getEmployee().getDepartment().getDptName().equals("生产部"))
		{
			pm = itemService.getPagerDesc(Item.class,"where o.name = '打印机'");
		}
		else
		{
			pm = itemService.getPagerDesc(Item.class,"where o.name != '打印机'");
		}
		return "selectItem";
	}
	
	public String selectItemType()
	{
		pm = itemTypeService.getPagerDesc(ItemType.class,"where o.item.id = "+sitemid);
		return "selectItemType";
	}
	
	public String checkExistsByNO()
	{
		result = preparationService.checkExistsByNO(preparation.getPresn());
		return SUCCESS;
	}
	// get and set
	@JSON(serialize=false)
	public PreparationService getPreparationService() {
		return preparationService;
	}

	@Resource
	public void setPreparationService(PreparationService preparationService) {
		this.preparationService = preparationService;
	}

	public Preparation getPreparation() {
		return preparation;
	}

	public void setPreparation(Preparation preparation) {
		this.preparation = preparation;
	}
	@JSON(serialize=false)
	public List<Integer> getItemIdList() {
		return itemIdList;
	}

	public void setItemIdList(List<Integer> itemIdList) {
		this.itemIdList = itemIdList;
	}
	@JSON(serialize=false)
	public List<Integer> getItemTypeIdList() {
		return itemTypeIdList;
	}

	public void setItemTypeIdList(List<Integer> itemTypeIdList) {
		this.itemTypeIdList = itemTypeIdList;
	}
	@JSON(serialize=false)
	public List<Integer> getPreNumList() {
		return preNumList;
	}

	public void setPreNumList(List<Integer> preNumList) {
		this.preNumList = preNumList;
	}
	@JSON(serialize=false)
	public List<Date> getEdateList() {
		return edateList;
	}

	public void setEdateList(List<Date> edateList) {
		this.edateList = edateList;
	}
	@JSON(serialize=false)
	public List<String> getPrenoteList() {
		return prenoteList;
	}

	public void setPrenoteList(List<String> prenoteList) {
		this.prenoteList = prenoteList;
	}

	public PagerModel getPm() {
		return pm;
	}

	public void setPm(PagerModel pm) {
		this.pm = pm;
	}
	@JSON(serialize=false)
	public List<Pergood> getPergoods() {
		return pergoods;
	}

	public void setPergoods(List<Pergood> pergoods) {
		this.pergoods = pergoods;
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
	public EmployeeService getEmployeeService() {
		return employeeService;
	}

	@Resource
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	public Integer getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
	}

	public Integer getDptId() {
		return dptId;
	}

	public void setDptId(Integer dptId) {
		this.dptId = dptId;
	}
	@JSON(serialize=false)
	public List<Department> getDepartmentList() {
		return departmentList;
	}

	public void setDepartmentList(List<Department> departmentList) {
		this.departmentList = departmentList;
	}
	@JSON(serialize=false)
	public DepartmentService getDepartmentService() {
		return departmentService;
	}

	@Resource
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}
	@JSON(serialize=false)
	public List<String> getStatus() {
		return status;
	}

	public void setStatus(List<String> status) {
		this.status = status;
	}
	@JSON(serialize=false)
	public List<Integer> getPergoodIds() {
		return pergoodIds;
	}

	public void setPergoodIds(List<Integer> pergoodIds) {
		this.pergoodIds = pergoodIds;
	}
	@JSON(serialize=false)
	public AccreditionService getAccreditionService() {
		return accreditionService;
	}

	@Resource
	public void setAccreditionService(AccreditionService accreditionService) {
		this.accreditionService = accreditionService;
	}

	public Accredition getAccredition() {
		return accredition;
	}

	public void setAccredition(Accredition accredition) {
		this.accredition = accredition;
	}

	public Accredition getProduceAccredition() {
		return produceAccredition;
	}

	public void setProduceAccredition(Accredition produceAccredition) {
		this.produceAccredition = produceAccredition;
	}
	@JSON(serialize=false)
	public ItemService getItemService() {
		return itemService;
	}

	@Resource
	public void setItemService(ItemService itemService) {
		this.itemService = itemService;
	}
	@JSON(serialize=false)
	public ItemTypeService getItemTypeService() {
		return itemTypeService;
	}

	@Resource
	public void setItemTypeService(ItemTypeService itemTypeService) {
		this.itemTypeService = itemTypeService;
	}

	public Integer getPartnumber() {
		return partnumber;
	}

	public void setPartnumber(Integer partnumber) {
		this.partnumber = partnumber;
	}

	public User getCurUser() {
		return curUser;
	}

	public void setCurUser(User curUser) {
		this.curUser = curUser;
	}

	public Integer getIsSelectItemType() {
		return isSelectItemType;
	}

	public void setIsSelectItemType(Integer isSelectItemType) {
		this.isSelectItemType = isSelectItemType;
	}

	public Integer getSitemid() {
		return sitemid;
	}

	public void setSitemid(Integer sitemid) {
		this.sitemid = sitemid;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

}
