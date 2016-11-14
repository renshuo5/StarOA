package com.fjsdfx.starerp.persons.action;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;


import org.apache.struts2.interceptor.RequestAware;
import org.aspectj.weaver.ast.Var;
import org.aspectj.weaver.patterns.ThisOrTargetAnnotationPointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.security.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;


import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.model.Employee;
import com.fjsdfx.starerp.persons.model.Recruitment;
import com.fjsdfx.starerp.persons.model.Training;
import com.fjsdfx.starerp.persons.model.yplanname;

import com.fjsdfx.starerp.persons.model.Ytrainplan;

import com.fjsdfx.starerp.persons.service.DepartmentService;
import com.fjsdfx.starerp.persons.service.TrainingService;
import com.fjsdfx.starerp.persons.service.yplannameService;

import com.fjsdfx.starerp.persons.service.YtrainplanService;
import com.fjsdfx.starerp.security.model.User;
import com.googlecode.jsonplugin.annotations.JSON;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import com.sun.org.apache.bcel.internal.generic.NEW;





/**
 * @author wuhaibin
 *
 */
@Controller
@Scope("prototype")


public class YtrainplanAction{
	
	
	private Logger logger = LoggerFactory.getLogger(Ytrainplan.class);
	private YtrainplanService ytrainplanService;//年度计划培训表的内容
	private yplannameService yplannameService;
	private Ytrainplan ytrainplan=new Ytrainplan();
	private yplanname yplanname1=null;
	private int yplanId;
	private String yplannames;
	private PagerModel pm;
	private List<Department> departmentList;
	private List<Training> trainingList=new ArrayList<Training>();
	private DepartmentService departmentService;
	private TrainingService trainingService;
	private String planname;//用于存放年度表的表名，临时存放的作用
	private List<Ytrainplan> ytrainplanlist;
	private List<Integer> trainingIds;
	private Date values;
	private String result;
/***********測試****************************************************/	
	private List<String> contents;
	private List<Integer> departmentIds;
	private List<Integer> departmentId1s;
	private List<String> adds;
	private List<String> schdate1s;
	private List<String> schdate2s;
	private List<String> schdate3s;
	private List<String> schdate4s;
/****************結束***********************************************/
	@JSON(serialize=false)
	public Logger getLogger() {
		return logger;
	}
	public void setLogger(Logger logger) {
		this.logger = logger;
	}
	@JSON(serialize=false)
	public YtrainplanService getYtrainplanService() {
		return ytrainplanService;
	}
	@Resource
	public void setYtrainplanService(YtrainplanService ytrainplanService) {
		this.ytrainplanService = ytrainplanService;
	}
	public Ytrainplan getYtrainplan() {
		return ytrainplan;
	}
	public void setYtrainplan(Ytrainplan ytrainplan) {
		this.ytrainplan = ytrainplan;
	}
	
	@JSON(serialize=false)
    public yplannameService getYplannameService() {
		return yplannameService;
	}
    @Resource
	public void setYplannameService(yplannameService yplannameService) {
		this.yplannameService = yplannameService;
	}
	
    public yplanname getYplanname1() {
		return yplanname1;
	}
	public void setYplanname1(yplanname yplanname1) {
		this.yplanname1 = yplanname1;
	}
	
	
    public int getYplanId() {
		return yplanId;
	}
	public void setYplanId(int yplanId) {
		this.yplanId = yplanId;
	}
/**********************測試方法******************************/
	
	
	
	public String getYplannames() {
	return yplannames;
	}
	@JSON(serialize=false)
	public List<String> getContents() {
	return contents;
	}
	public void setContents(List<String> contents) {
		this.contents = contents;
	}
	public void setYplannames(String yplannames) {
		this.yplannames = yplannames;
	}
	
	@JSON(serialize=false)
	public List<Integer> getDepartmentIds() {
		return departmentIds;
	}
	public void setDepartmentIds(List<Integer> departmentIds) {
		this.departmentIds = departmentIds;
	}
	@JSON(serialize=false)
	public List<Integer> getDepartmentId1s() {
		return departmentId1s;
	}
	
	public void setDepartmentId1s(List<Integer> departmentId1s) {
		this.departmentId1s = departmentId1s;
	}
	@JSON(serialize=false)
	public List<String> getAdds() {
		return adds;
	}
	public void setAdds(List<String> adds) {
		this.adds = adds;
	}
	@JSON(serialize=false)
	public List<String> getSchdate1s() {
		return schdate1s;
	}
	public void setSchdate1s(List<String> schdate1s) {
		this.schdate1s = schdate1s;
	}
	@JSON(serialize=false)
	public List<String> getSchdate2s() {
		return schdate2s;
	}
	public void setSchdate2s(List<String> schdate2s) {
		this.schdate2s = schdate2s;
	}
	@JSON(serialize=false)
	public List<String> getSchdate3s() {
		return schdate3s;
	}
	public void setSchdate3s(List<String> schdate3s) {
		this.schdate3s = schdate3s;
	}
	@JSON(serialize=false)
	public List<String> getSchdate4s() {
		return schdate4s;
	}
	public void setSchdate4s(List<String> schdate4s) {
		this.schdate4s = schdate4s;
	}
	
   public String getPlanname() {
		return planname;
	}
	public void setPlanname(String planname) {
		this.planname = planname;
	}
/********************結束***********************************/	
	public PagerModel getPm() {
		return pm;
	}

	public void setPm(PagerModel pm) {
		this.pm = pm;
	}
	@JSON(serialize=false)
	public List<Department> getDepartmentList() {
		return departmentList;
	}
	public void setDepartmentList(List<Department> departmentList) {
		this.departmentList = departmentList;
	}
	@JSON(serialize=false)
	public List<Training> getTrainingList() {
		return trainingList;
	}
	public void setTrainingList(List<Training> trainingList) {
		this.trainingList = trainingList;
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
	public TrainingService getTrainingService() {
		return trainingService;
	}
	@Resource
	public void setTrainingService(TrainingService trainingService) {
		this.trainingService = trainingService;
	}
	
	
	@JSON(serialize=false)
	public List<Integer> getTrainingIds() {
		return trainingIds;
	}
	public void setTrainingIds(List<Integer> trainingIds) {
		this.trainingIds = trainingIds;
	}
	@JSON(serialize=false)
	public List<Ytrainplan> getYtrainplanlist() {
		return ytrainplanlist;
	}
	public void setYtrainplanlist(List<Ytrainplan> ytrainplanlist) {
		this.ytrainplanlist = ytrainplanlist;
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
		pm=yplannameService.getPagerDesc(yplanname.class);
		return "list";
		//ytrainplanService.g
	}
	
	

	
	
	/**
	 * 添加
	 * @return
	 */
	public String add()
	{
//		User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		try {
//			yplanname1=yplannameService.saveAndRefresh(yplanname1);
//			int i=0;
//			for (String content : contents) {
//				Ytrainplan ytrainplan1=new Ytrainplan();
//				ytrainplan1.setContent(content);
//				ytrainplan1.setTraddress(adds.get(i));
//				ytrainplan1.setSchdate1(schdate1s.get(i));
//				ytrainplan1.setSchdate2(schdate2s.get(i));
//				ytrainplan1.setSchdate3(schdate3s.get(i));
//				ytrainplan1.setSchdate4(schdate4s.get(i));
//				ytrainplan1.setYplanname(yplanname1);
//				ytrainplan1.setDepartment(departmentService.findById(Department.class, departmentIds.get(i)));
//				ytrainplan1.setWithf(departmentService.findById(Department.class, departmentId1s.get(i)));
//				i++;
//				ytrainplanService.saveAndRefresh(ytrainplan1);
//				logger.warn("user id="+currentUser.getId()+"add id="+ytrainplan1.getId());
//			}
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
		return ytrainplanService.add(logger, contents, departmentIds, departmentId1s, adds, schdate1s, schdate2s, schdate3s, schdate4s, yplanname1);
	}
	
	/**
	 * 编辑
	 * @return
	 */
	public String edite()
	{
//		User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		try {
//			yplannameService.update(yplanname1);
//			ytrainplanlist=ytrainplanService.findByHql("from Ytrainplan o where o.yplanname.id="+yplanname1.getId());
//			for (Ytrainplan ytrainplan : ytrainplanlist) {
//				ytrainplanService.deleteById(Ytrainplan.class, ytrainplan.getId());
//			}
//			yplanname yplanname2=yplannameService.findById(yplanname.class, yplanname1.getId());
//			int i=0;
//			for (String content : contents) {
//				Ytrainplan ytrainplan1=new Ytrainplan();
//				ytrainplan1.setContent(content);
//				ytrainplan1.setTraddress(adds.get(i));
//				ytrainplan1.setSchdate1(schdate1s.get(i));
//				ytrainplan1.setSchdate2(schdate2s.get(i));
//				ytrainplan1.setSchdate3(schdate3s.get(i));
//				ytrainplan1.setSchdate4(schdate4s.get(i));
//				ytrainplan1.setYplanname(yplanname2);
//				if(departmentIds.get(i)!=null){
//				ytrainplan1.setDepartment(departmentService.findById(Department.class, departmentIds.get(i)));
//				}if(departmentId1s.get(i)!=null){
//				ytrainplan1.setWithf(departmentService.findById(Department.class, departmentId1s.get(i)));
//				}
//				i++;
//				ytrainplanService.saveAndRefresh(ytrainplan1);
//				logger.warn("user id="+currentUser.getId()+"add id="+ytrainplan1.getId());
//			}
//			
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
		return ytrainplanService.edite(logger, contents, departmentIds, departmentId1s, adds, schdate1s, schdate2s, schdate3s, schdate4s, yplanname1);
	}
	
	/**
	 * 转换到添加的页面
	 * @return
	 */
	public String addInput()
	{
		
		departmentList=departmentService.findByHql("from Department where dptType!=3");
		return "add_input";
	}
	/**
	 * 跳转到编辑页面
	 * @return
	 */
	public String editedInput(){
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy年");
		departmentList=departmentService.findByHql("from Department where dptType!=3");
		yplanname1=yplannameService.findById(yplanname.class, yplanId);
		planname=sdf1.format(yplanname1.getNames());
		ytrainplanlist=ytrainplanService.findByHql("from Ytrainplan o where o.yplanname.id="+yplanId);
		return "edit_input";
	}

	/**
	 * 显示年度培训的详细信息
	 */
	public String show(){
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy年");
		yplanname1=yplannameService.findById(yplanname.class, yplanId);
		planname=sdf1.format(yplanname1.getNames());
		ytrainplanlist=ytrainplanService.findByHql("from Ytrainplan o where o.yplanname.id="+yplanId);
		return "show";
	}

	/**
	 * 删除表
	 */
	public String del(){
//		try {
//			ytrainplanlist=ytrainplanService.findByHql("from Ytrainplan o where o.yplanname.id="+yplanId);
//		    for (Ytrainplan ytrainplan : ytrainplanlist) {
//				ytrainplanService.delete(ytrainplan);
//			}
//		    yplannameService.deleteById(yplanname.class, yplanId);
//			User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//			logger.warn("user id="+currentUser.getId()+"and del id="+yplanId);
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
		return ytrainplanService.del(logger, yplanId);
	}	

	/**
	 * 模糊查询（对制定时间）
	 * @return
	 */
	public String search()
	{
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy");
		
		Map<String,String> like=new HashMap<String,String>();
		if(null!=yplanname1){
			if(yplanname1.getNames()!=null){
			like.put("names", sdf1.format(yplanname1.getNames()));
			pm=yplannameService.fuzzyQuery(yplanname.class,like);
			}else
			{
				pm=yplannameService.getPagerDesc(yplanname.class);
			}
		}
		else{
		pm=yplannameService.getPagerDesc(yplanname.class);
		}
		return "list";
		
	}
	
	public String ajax(){
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy");
		
		if(yplannameService.findByHql(" from yplanname o where o.names like '%"+sdf1.format(values)+"%'").size()>0){
			result="1";
		}
		else{
			result="0";
		}
		return Action.SUCCESS;
	}

}
