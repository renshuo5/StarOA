package com.fjsdfx.starerp.persons.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.xml.crypto.Data;

import org.hibernate.hql.ast.tree.FromClause;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.security.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;

import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.model.Recruitment;
import com.fjsdfx.starerp.persons.model.Yrecruitment;
import com.fjsdfx.starerp.persons.service.DepartmentService;
import com.fjsdfx.starerp.persons.service.RecruitmentService;
import com.fjsdfx.starerp.persons.service.YrecruitmentService;
import com.fjsdfx.starerp.security.model.User;
import com.googlecode.jsonplugin.annotations.JSON;
import com.opensymphony.xwork2.Action;




/**
 * @author wuhaibin
 *
 */
@Controller
@Scope("prototype")
public class RecruitmentAction {
	private Logger logger=LoggerFactory.getLogger(RecruitmentAction.class);
	private RecruitmentService recruitmentService;
	private YrecruitmentService yrecruitmentService;
	private Recruitment recruitment=new Recruitment();
	private Integer recruitmentId;
	private Integer yrecruitmentId;
	private Integer departmentId;
	private Yrecruitment yrecruitment=new Yrecruitment();
	private Integer nameString;//用于存放表名
	private List<Integer> recruitmentIds;
	private String yName;//年度招聘的表名字
	private List<Recruitment> recruitments;
	private Date values;
	private String result;
	/************************************************************************/
	
	private List<String> recstylelist;
	private List<String>  recnaturelist;
	private List<Integer> recnolist;
	private List<String> basereclist;
	private List<Integer> departmentIds;
	/*************************************************************************/
	
	private PagerModel pm;
	private List<Recruitment> recruitmentlist=new ArrayList<Recruitment>();

	@JSON(serialize=false)
	public List<Recruitment> getRecruitmentlist() {
		return recruitmentlist;
	}


	public void setRecruitmentlist(List<Recruitment> recruitmentlist) {
		this.recruitmentlist = recruitmentlist;
	}
	/**
	 * 用于页面显示的临时登记时间字符串
	 */
	private String rString;
	private String tempsString;
	
	public String getTempsString() {
		return tempsString;
	}


	public void setTempsString(String tempsString) {
		this.tempsString = tempsString;
	}
	private List<Department> departmentList;//=new ArrayList<Department>();
//	private List<Yrecruitment> yrecruitmentList;
		
	private DepartmentService departmentService;
	

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
	public Integer getRecruitmentId() {
		return recruitmentId;
	}


	public void setRecruitmentId(Integer recruitmentId) {
		this.recruitmentId = recruitmentId;
	}
    
	
	public Integer getYrecruitmentId() {
		return yrecruitmentId;
	}


	public void setYrecruitmentId(Integer yrecruitmentId) {
		this.yrecruitmentId = yrecruitmentId;
	}


	@JSON(serialize=false)
	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}
	@JSON(serialize=false)
	public RecruitmentService getRecruitmentService() {
		return recruitmentService;
	}
	@Resource
	public void setRecruitmentService(RecruitmentService recruitmentService) {
		this.recruitmentService = recruitmentService;
	}
	@JSON(serialize=false)
	public YrecruitmentService getYrecruitmentService() {
		return yrecruitmentService;
	}

	@Resource
	public void setYrecruitmentService(YrecruitmentService yrecruitmentService) {
		this.yrecruitmentService = yrecruitmentService;
	}


	public Recruitment getRecruitment() {
		return recruitment;
	}
	public void setRecruitment(Recruitment recruitment) {
		this.recruitment = recruitment;
	}
	
	public Yrecruitment getYrecruitment() {
		return yrecruitment;
	}


	public void setYrecruitment(Yrecruitment yrecruitment) {
		this.yrecruitment = yrecruitment;
	}


	public PagerModel getPm() {
		return pm;
	}
	public void setPm(PagerModel pm) {
		this.pm = pm;
	}

	
    public String getrString() {
		return rString;
	}


	public void setrString(String rString) {
		this.rString = rString;
	}


	public Integer getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}
	
	public Integer getNameString() {
		return nameString;
	}


	public void setNameString(Integer nameString) {
		this.nameString = nameString;
	}


	/***********************开始*************************************************/
	@JSON(serialize=false)
	public List<String> getRecstylelist() {
		return recstylelist;
	}


	public void setRecstylelist(List<String> recstylelist) {
		this.recstylelist = recstylelist;
	}


	@JSON(serialize=false)
	public List<String> getRecnaturelist() {
		return recnaturelist;
	}


	public void setRecnaturelist(List<String> recnaturelist) {
		this.recnaturelist = recnaturelist;
	}


	@JSON(serialize=false)
	public List<Integer> getRecnolist() {
		return recnolist;
	}


	public void setRecnolist(List<Integer> recnolist) {
		this.recnolist = recnolist;
	}


	@JSON(serialize=false)
	public List<String> getBasereclist() {
		return basereclist;
	}


	
	public void setBasereclist(List<String> basereclist) {
		this.basereclist = basereclist;
	}
	@JSON(serialize=false)
	public List<Integer> getDepartmentIds() {
		return departmentIds;
	}


	public void setDepartmentIds(List<Integer> departmentIds) {
		this.departmentIds = departmentIds;
	}
	

	
	/**********************************结束***************************************/
	@JSON(serialize=false)
	public List<Integer> getRecruitmentIds() {
		return recruitmentIds;
	}


	public void setRecruitmentIds(List<Integer> recruitmentIds) {
		this.recruitmentIds = recruitmentIds;
	}

	

	public String getyName() {
		return yName;
	}


	public void setyName(String yName) {
		this.yName = yName;
	}


	@JSON(serialize=false)
	public List<Recruitment> getRecruitments() {
		return recruitments;
	}


	public void setRecruitments(List<Recruitment> recruitments) {
		this.recruitments = recruitments;
	}

	

	public Date getValues() {
		return values;
	}


	public void setValues(Date values) {
		this.values = values;
	}


	public String getResult() {
		return result;
	}


	public void setResult(String result) {
		this.result = result;
	}


	/**
	 * 列表
	 * @return
	 * @throws Exception
	 */
	public String list()  {

		pm=recruitmentService.getPagerDesc(Recruitment.class,"where o.isyear=0");
		//pm=recruitmentService.getPagerDesc(Recruitment.class);
		departmentList=departmentService.findByHql("from Department where dptType!=3");
		return "list";
	}



	/**
	 * 模糊查询（需求类别，部门）
	 * @return
	 */
	public String search()
	{
		Map<String,String> like=new HashMap<String,String>();
        if(recruitment!=null){
			
			if(recruitment.getDepartment()!=null){
				like.put("recstyle", recruitment.getRecstyle());
				like.put("department.dptName", recruitment.getDepartment().getDptName());
				like.put("isyear", "0");
				pm=recruitmentService.fuzzyQuery(Recruitment.class,like);
			}else{
				pm=recruitmentService.getPagerDesc(Recruitment.class,"where o.isyear=0");
			}
			
        }else{
        	pm=recruitmentService.getPagerDesc(Recruitment.class,"where o.isyear=0");
        }
		departmentList=departmentService.findByHql("from Department where dptType!=3");
		
		return "list";
		
	}
	
	/**
	 * 模糊查询（时间）
	 * @return
	 */
	public String searchSelect()
	{
		Map<String,String> like=new HashMap<String,String>();

		like.put("rDate", tempsString);
		pm=recruitmentService.fuzzyQuery(Recruitment.class,like);
		departmentList=departmentService.findByHql("from Department where dptType!=3");
		
		return "searchSelect";
		
	}
		
	
	
	
	/**
	 * 删除
	 * @return
	 */
	
	public String del()
	{
		recruitmentService.deleteById(Recruitment.class, recruitmentId);
		User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		logger.warn("user id="+currentUser.getId()+"del recruitmentId="+recruitmentId);
		return "pub_del_success";
	}
	/**
	 * 添加
	 * @return
	 */
	public String add()
	{
		if(departmentId!=null&&null!=recruitment.getRecno()&& !("".equals(recruitment.getRecstyle()))){
		try {
			recruitment.setDepartment(departmentService.findById(Department.class,departmentId));
		} catch (Exception e) {
			// TODO: handle exception
		}
		recruitment.setIsCheck(0);
		recruitment.setIsyear(0);
		recruitmentService.saveAndRefresh(recruitment);
		User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		logger.warn("user id="+currentUser.getId()+"add id="+recruitment.getId());
		return "pub_add_success";}
		else{
			return "pub_exception";
		}
	}

	
	
/*===================================input============================================================*/
	
	public String addInput()
	{
		departmentList=departmentService.findByHql("from Department where dptType!=3");
		return "add_input";
	}
	public String editInput()
	{   

		recruitment=recruitmentService.findById(Recruitment.class,recruitmentId);
		
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy年MM月dd日");
	    if(recruitment.getrDate()!=null){
	    rString = sdf1.format(recruitment.getrDate());}
	    departmentList=departmentService.findByHql("from Department where dptType!=3");
        if (departmentId==null) {
        	try {departmentId=recruitment.getDepartment().getId();
				
			} catch (Exception e) {
				// TODO: handle exception
		}
		}
		return "edit_input";
	}

	
	

	/**************************以上为各种input页面******************************************/
	
	/**
	 * 编辑
	 * @return
	 */
	public String update()
	{
		if(departmentId!=null&&null!=recruitment.getRecno()&& !("".equals(recruitment.getRecstyle()))){
		try{
			recruitment.setDepartment(departmentService.findById(Department.class,departmentId));
				} catch (Exception e) {
					e.printStackTrace();// TODO: handle exception
					}
		recruitmentService.update(recruitment);
		User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		logger.warn("user id="+currentUser.getId()+"update id="+recruitment.getId());
		return "pub_add_success";}
		else{
			return "pub_exception";
		}
	}
	/*****************以下是审核的方法******************/
	/**
	 * 审核信息
	 * @return
	 */
	public String checked()
	{

//		List< Yrecruitment> yrecruitmentList;
//	    boolean isUser=true;
		try{
			recruitment.setDepartment(departmentService.findById(Department.class,departmentId));
				} catch (Exception e) {
					e.printStackTrace();// TODO: handle exception
					}
	
		recruitment.setIsCheck(1);
        
		recruitmentService.update(recruitment);
		User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		logger.warn("user id="+currentUser.getId()+"update id="+recruitment.getId());

		return "pub_update_success";
	}

	/**
	 * 
	 * @return
	 */
	public String editInputCheck()
	{   

		recruitment=recruitmentService.findById(Recruitment.class,recruitmentId);
		
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy年MM月dd日");
	    if(recruitment.getrDate()!=null){
	    rString = sdf1.format(recruitment.getrDate());}
	    departmentList=departmentService.findByHql("from Department where dptType!=3");
        if (departmentId==null) {
        	try {departmentId=recruitment.getDepartment().getId();
				
			} catch (Exception e) {
				// TODO: handle exception
		}
		}
		return "edit_input_check";
	}

	/*****************以下是年度招聘计划表相关的操作	******************/
	/**
	 * 年度招聘表的查询
	 * @return
	 */
	public String ylist(){
		pm=yrecruitmentService.getPagerDesc(Yrecruitment.class);

		return "ylist";
	}
   
   /**
    * 年度招聘的具体内容查询
    */
	public String show(){
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy年");
		yrecruitment=yrecruitmentService.findById(Yrecruitment.class, yrecruitmentId);
		yName=sdf1.format(yrecruitment.getRecruitmentName());
		recruitments=recruitmentService.findByHql("from Recruitment o where o.yrecruitment.id="+yrecruitmentId);
		
		return "show1";
	}

	/**
	 * 转到添加年度招聘内容处
	 */
	public String yaddInput(){
		departmentList=departmentService.findByHql("from Department where dptType!=3");
		return "yaddInput";
	}
	/**
	 * 添加年度招聘的内容
	 * @throws ParseException 
	 */
	public String yadd() throws ParseException{
//		User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		try {
//			yrecruitment=yrecruitmentService.saveAndRefresh(yrecruitment);
//			int i=0;
//			for (String recstyle : recstylelist) {
//				Recruitment recruitment1=new Recruitment();
//				recruitment1.setRecstyle(recstyle);
//				if(departmentIds.get(i)!=null){
//				recruitment1.setDepartment(departmentService.findById(Department.class, departmentIds.get(i)));
//				}
//				recruitment1.setRecno(recnolist.get(i));
//				recruitment1.setRecnature(recnaturelist.get(i));
//				recruitment1.setBaserec(basereclist.get(i));
//				recruitment1.setrDate(new Date());
//				recruitment1.setIsyear(1);
//				recruitment1.setYrecruitment(yrecruitment);
//				recruitmentService.saveAndRefresh(recruitment1);
//				i++;
//				
//				logger.warn("user id="+currentUser.getId()+"add id="+recruitment1.getId());
//			  }
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
//		
		
		return recruitmentService.yadd(logger, yrecruitment, recstylelist, recnaturelist, recnolist, basereclist, departmentIds);
		}
	
	/**
	 * 跳转到编辑页面
	 */
	public String yeditedInput(){
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy年");
		departmentList=departmentService.findByHql("from Department where dptType!=3");
		yrecruitment=yrecruitmentService.findById(Yrecruitment.class, yrecruitmentId);
		yName=sdf1.format(yrecruitment.getRecruitmentName());
		recruitments=recruitmentService.findByHql("from Recruitment o where o.yrecruitment.id="+yrecruitmentId);
		
		return "yedit_input";
		
	}
	public String yedite(){
//		User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		try {
//			yrecruitmentService.update(yrecruitment);
//			recruitments=recruitmentService.findByHql("from Recruitment o where o.yrecruitment.id="+yrecruitment.getId());
//			for (Recruitment recruitment : recruitments) {
//				recruitmentService.delete(recruitment);
//			}
//			Yrecruitment yrecruitment2=yrecruitmentService.findById(Yrecruitment.class, yrecruitment.getId());
//			int i=0;
//			for (String recstyle : recstylelist) {
//				Recruitment recruitment1=new Recruitment();
//				recruitment1.setRecstyle(recstyle);
//				if(departmentIds.get(i)!=null){
//				recruitment1.setDepartment(departmentService.findById(Department.class, departmentIds.get(i)));
//				}
//				recruitment1.setRecno(recnolist.get(i));
//				recruitment1.setRecnature(recnaturelist.get(i));
//				recruitment1.setBaserec(basereclist.get(i));
//				recruitment1.setrDate(new Date());
//				recruitment1.setIsyear(1);
//				recruitment1.setYrecruitment(yrecruitment2);
//				recruitmentService.saveAndRefresh(recruitment1);
//				i++;
//				
//				logger.warn("user id="+currentUser.getId()+"add id="+recruitment1.getId());
//			  }
//			
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
		return recruitmentService.yedite(recruitments, logger, yrecruitment, recstylelist, recnaturelist, recnolist, basereclist, departmentIds);
	}

	/**
	 * 删除年度招聘表
	 */
	public String ydel(){
//		try {
//			recruitments=recruitmentService.findByHql("from Recruitment o where o.yrecruitment.id="+yrecruitmentId);
//			for (Recruitment recruitment : recruitments) {
//				recruitmentService.delete(recruitment);
//			}
//			yrecruitmentService.deleteById(Yrecruitment.class, yrecruitmentId);
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
//		User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		logger.warn("user id="+currentUser.getId()+"del id="+yrecruitment.getId());
		return recruitmentService.ydel(logger, recruitments, yrecruitmentId);
	}	

	/**
	 * 模糊查询（对制定时间）
	 * @return
	 */
	public String ysearch()
	{
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy");
		Map<String,String> like=new HashMap<String,String>();
		if(yrecruitment!=null){
			if(yrecruitment.getRecruitmentName()!=null){
				like.put("recruitmentName", sdf1.format(yrecruitment.getRecruitmentName()));	
				pm=yrecruitmentService.fuzzyQuery(Yrecruitment.class,like);
			}else{
				pm=yrecruitmentService.getPager(Yrecruitment.class);
			}
		}else{
			pm=yrecruitmentService.getPager(Yrecruitment.class);
		}
		return "ylist";
		
	}
	
	public String ajax(){
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy");
		if(yrecruitmentService.findByHql("from Yrecruitment o where o.recruitmentName like '%"+sdf1.format(values)+"%'").size()>0){
			result="1";
		}else {
			result="0";
		}
		return Action.SUCCESS;
	}
	
}
