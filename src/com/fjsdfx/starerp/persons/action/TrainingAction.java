package com.fjsdfx.starerp.persons.action;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Scope;
import org.springframework.security.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;


import com.fjsdfx.starerp.annoucement.model.Annoucement;
import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.model.Jobs;
import com.fjsdfx.starerp.persons.model.Training;

import com.fjsdfx.starerp.persons.service.DepartmentService;
import com.fjsdfx.starerp.persons.service.JobsService;
import com.fjsdfx.starerp.persons.service.TrainingService;
import com.fjsdfx.starerp.persons.service.YtrainplanService;
import com.fjsdfx.starerp.security.model.User;





/**
 * @author Huang_Hai
 *
 */
@Controller
@Scope("prototype")


public class TrainingAction {
	
	
	private Logger logger = LoggerFactory.getLogger(Training.class);
	private TrainingService trainingService;
	private YtrainplanService ytrainplanService;
	private Training training = new Training();
	private Integer trainingId;
	private Integer departmentId;
	/**
	 * 用于临时格式化开始时间这个字段
	 */
	private String sDateString;
	/**
	 *用于临时格式化结束时间这个字段
	 */
	private String eDateString;
	
	private PagerModel pm;
	
	private List<Department> departmentList;//=new ArrayList<Department>();
	
	private DepartmentService departmentService;
	
	
	
	
	public List<Department> getDepartmentList() {
		return departmentList;
	}
	public void setDepartmentList(List<Department> departmentList) {
		this.departmentList = departmentList;
	}
	public DepartmentService getDepartmentService() {
		return departmentService;
	}
	@Resource
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}
	public Logger getLogger() {
		return logger;
	}
	public void setLogger(Logger logger) {
		this.logger = logger;
	}
	public TrainingService getTrainingService() {
		return trainingService;
	}
	@Resource
	public void setTrainingService(TrainingService trainingService) {
		this.trainingService = trainingService;
	}
	
	public YtrainplanService getYtrainplanService() {
		return ytrainplanService;
	}
	@Resource
	public void setYtrainplanService(YtrainplanService ytrainplanService) {
		this.ytrainplanService = ytrainplanService;
	}
	public Training getTraining() {
		return training;
	}
	public void setTraining(Training training) {
		this.training = training;
	}
	public Integer getTrainingId() {
		return trainingId;
	}
	public void setTrainingId(Integer trainingId) {
		this.trainingId = trainingId;
	}
	public PagerModel getPm() {
		return pm;
	}
	public void setPm(PagerModel pm) {
		this.pm = pm;
	}
	
	public Integer getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}
	public String getsDateString() {
		return sDateString;
	}
	public void setsDateString(String sDateString) {
		this.sDateString = sDateString;
	}
	public String geteDateString() {
		return eDateString;
	}
	public void seteDateString(String eDateString) {
		this.eDateString = eDateString;
	}
	/**
	 * 列表
	 * @return
	 * @throws Exception
	 */
	public String list()  {
		departmentList=departmentService.findByHql("from Department where dptType!=3");
		pm=trainingService.getPagerDesc(Training.class);
		return "list";
	}
	
	

	
	
	/**
	 * 搜索
	 * @return
	 */
	public String search()
	{
		
		Map<String,String> like=new HashMap<String,String>();
		
		like.put("traName", training.getTraName());
		like.put("department.dptName", training.getDepartment().getDptName());
		pm=trainingService.fuzzyQuery(Training.class, like);
		departmentList=departmentService.findByHql("from Department where dptType!=3");
		return "list";
	}
	/**
	 * 删除
	 * @return
	 */
	
	public String del()
	{
		trainingService.deleteById(Training.class, trainingId);
		//trainingService.delTraining(trainingId);
		User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		logger.warn("user id="+currentUser.getId()+"del id="+trainingId);
		//logger.warn("del id="+trainingId);
		return "pub_del_success";
	}
	/**
	 * 添加
	 * @return
	 */
	public String add()
	{
		//后台验证培训名称、执行单位、开始时间、结束时间不能为空
		if(training.getTraName()!=null&& !"".equals(training.getTraName()) && departmentId!=null && training.getStDate()!=null && training.getEdDate()!=null)
		{
		try {
		training.setDepartment(departmentService.findById(Department.class,departmentId));
	
		} catch (Exception e) {
		// TODO: handle exception
	}   //training.setDateTemp(dateTemp)
		trainingService.saveAndRefresh(training);
		User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		logger.warn("user id="+currentUser.getId()+"add id="+training.getId());
		//logger.warn("add id="+training.getId());
		}	
		return "pub_add_success";
	}
	public String addInput()
	{
		departmentList=departmentService.findByHql("from Department where dptType!=3");
		return "add_input";
	}
	
	public String editInput()
	{  
	  departmentList=departmentService.findByHql("from Department where dptType!=3");
	  SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy年MM月dd日");
	  if (departmentId==null) {
      	try {departmentId=training.getDepartment().getId();
				
			} catch (Exception e) {
				// TODO: handle exception
		}}
	  training=trainingService.findById(Training.class, trainingId);
	  if(training.getStDate()!=null){
		  sDateString=sdf1.format(training.getStDate());
	  }
	  if(training.getEdDate()!=null){
		  eDateString=sdf1.format(training.getEdDate());
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
		try{
			training.setDepartment(departmentService.findById(Department.class,departmentId));
			} catch (Exception e) {
				e.printStackTrace();// TODO: handle exception
		}
			
		trainingService.update(training);
		User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		logger.warn("user id="+currentUser.getId()+"update id="+training.getId());
		//logger.warn("update id="+training.getId());
		return "pub_update_success";
	}
	
	/**
	 * 选择页面的模糊查询（对制定时间）
	 * @return
	 */
	public String searchSelect()
	{   
//		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy年MM月dd日");
//		sDateString=sdf1.format(training.getStDate());
		Map<String,String> like=new HashMap<String,String>();
		
		like.put("stDate", sDateString);
		
		pm=trainingService.fuzzyQuery(Training.class,like);
		//pm=trainingService.fuzzyQuery(entityClass, likeMap)
		return "searchSelect";
		
	}	
}
