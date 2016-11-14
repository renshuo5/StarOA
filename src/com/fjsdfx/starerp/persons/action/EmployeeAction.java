package com.fjsdfx.starerp.persons.action;

import java.io.File;
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

import com.fjsdfx.starerp.common.bean.FileUpload;
import com.fjsdfx.starerp.common.bean.PagerInfo;
import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.model.Emp_Train;
import com.fjsdfx.starerp.persons.model.Employee;
import com.fjsdfx.starerp.persons.model.EmployeeRap;
import com.fjsdfx.starerp.persons.model.Jobs;
import com.fjsdfx.starerp.persons.service.DepartmentService;
import com.fjsdfx.starerp.persons.service.Emp_TrainService;
import com.fjsdfx.starerp.persons.service.EmployeeRapService;
import com.fjsdfx.starerp.persons.service.EmployeeService;
import com.fjsdfx.starerp.persons.service.JobsService;
import com.fjsdfx.starerp.security.model.User;

/**
 * @author Huang_Hai
 * 
 */
@Controller
@Scope("prototype")
public class EmployeeAction {
	private Logger logger = LoggerFactory.getLogger(EmployeeAction.class);
	private EmployeeService employeeService;
	private EmployeeRapService employeeRapService;
	private Employee employee = new Employee();
	private EmployeeRap employeeRap = new EmployeeRap();// 人员奖惩表
	private Integer employeeId;
	private Integer employeeRapId;
	private Integer departmentId;
	private Integer jobsId;
	private String paname;
	private File uploadFile;
	private String uploadFileFileName;
	private String uploadFileContentType;
    private Emp_Train empTrain=null;
	private Emp_TrainService empTrainService;
	private PagerModel pm;
	private List<String> traNames;
	private List<Date> stDates;
	private List< Emp_Train> lists;
	/**
	 * 用于页面显示的临时生日字符串
	 */
	String birString;
	/**
	 * 用于页面显示的临时进入公司时间字符串
	 */
	String eDateString;
	/**
	 * 用于页面显示的临时离开公司时间字符串
	 */
	String lDateString;
	/**
	 * 用于页面显示临时的奖惩时间
	 */
	String rapDatesString;

	private List<Department> departmentList;// =new ArrayList<Department>();
	private List<Employee> employeeList;
	private DepartmentService departmentService;
	private List<Jobs> jobsList;
	private JobsService jobsService;

	
	public String getPaname() {
		return paname;
	}

	public void setPaname(String paname) {
		this.paname = paname;
	}

	public List<Jobs> getJobsList() {
		return jobsList;
	}

	public void setJobsList(List<Jobs> jobsList) {
		this.jobsList = jobsList;
	}

	public JobsService getJobsService() {
		return jobsService;
	}

	@Resource
	public void setJobsService(JobsService jobsService) {
		this.jobsService = jobsService;
	}

	public List<Department> getDepartmentList() {
		return departmentList;
	}

	public void setDepartmentList(List<Department> departmentList) {
		this.departmentList = departmentList;
	}

	public List<Employee> getEmployeeList() {
		return employeeList;
	}

	public void setEmployeeList(List<Employee> employeeList) {
		this.employeeList = employeeList;
	}

	public DepartmentService getDepartmentService() {
		return departmentService;
	}

	@Resource
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}

	public Integer getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
	}

	public Integer getEmployeeRapId() {
		return employeeRapId;
	}

	public void setEmployeeRapId(Integer employeeRapId) {
		this.employeeRapId = employeeRapId;
	}

	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	public EmployeeService getEmployeeService() {
		return employeeService;
	}

	@Resource
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	public EmployeeRapService getEmployeeRapService() {
		return employeeRapService;
	}

	@Resource
	public void setEmployeeRapService(EmployeeRapService employeeRapService) {
		this.employeeRapService = employeeRapService;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public EmployeeRap getEmployeeRap() {
		return employeeRap;
	}

	public void setEmployeeRap(EmployeeRap employeeRap) {
		this.employeeRap = employeeRap;
	}

	public PagerModel getPm() {
		return pm;
	}

	public void setPm(PagerModel pm) {
		this.pm = pm;
	}

	public String getBirString() {
		return birString;
	}

	public void setBirString(String birString) {
		this.birString = birString;
	}

	public String geteDateString() {
		return eDateString;
	}

	public void seteDateString(String eDateString) {
		this.eDateString = eDateString;
	}

	public String getlDateString() {
		return lDateString;
	}

	public void setlDateString(String lDateString) {
		this.lDateString = lDateString;
	}

	public String getRapDatesString() {
		return rapDatesString;
	}

	public void setRapDatesString(String rapDatesString) {
		this.rapDatesString = rapDatesString;
	}

	public Integer getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}

	public Integer getJobsId() {
		return jobsId;
	}

	public void setJobsId(Integer jobsId) {
		this.jobsId = jobsId;
	}

	public File getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(File uploadFile) {
		this.uploadFile = uploadFile;
	}

	public String getUploadFileFileName() {
		return uploadFileFileName;
	}

	public void setUploadFileFileName(String uploadFileFileName) {
		this.uploadFileFileName = uploadFileFileName;
	}

	public String getUploadFileContentType() {
		return uploadFileContentType;
	}

	public void setUploadFileContentType(String uploadFileContentType) {
		this.uploadFileContentType = uploadFileContentType;
	}
	
	public Emp_Train getEmpTrain() {
		return empTrain;
	}

	public void setEmpTrain(Emp_Train empTrain) {
		this.empTrain = empTrain;
	}
	

	public Emp_TrainService getEmpTrainService() {
		return empTrainService;
	}

	@Resource
	public void setEmpTrainService(Emp_TrainService empTrainService) {
		this.empTrainService = empTrainService;
	}
	

	public List<String> getTraNames() {
		return traNames;
	}

	public void setTraNames(List<String> traNames) {
		this.traNames = traNames;
	}

	public List<Date> getStDates() {
		return stDates;
	}

	public void setStDates(List<Date> stDates) {
		this.stDates = stDates;
	}
	

	public List<Emp_Train> getLists() {
		return lists;
	}

	public void setLists(List<Emp_Train> lists) {
		this.lists = lists;
	}

	/**
	 * 列表
	 * 
	 * @return
	 * @throws Exception
	 */
	public String list() {
		pm= employeeService.getPagerDesc(Employee.class,"where o.isdel is null or o.isdel = 0");
		//pm = employeeService.getEmPager(PagerInfo.getOffset(), PagerInfo.getPagesize());
		departmentList = departmentService.findByHql("from Department where dptType!=3");
		jobsList = jobsService.findByHql("from Jobs");
		return "list";
	}

	/**
	 * 模糊查询（对姓名、性别、职位）
	 * 
	 * @return
	 */
	public String search() {
		Map<String, String> like = new HashMap<String, String>();
        if(employee!=null){
        	if(employee.getEmpName()!=null&employee.getSex()!=null&employee.getDepartment()!=null&employee.getJobs()!=null){
        		like.put("empName", employee.getEmpName());
        		like.put("sex", employee.getSex());
        		like.put("department.dptName", employee.getDepartment().getDptName());
        		like.put("jobs.jobsName", employee.getJobs().getJobsName());
        		pm = employeeService.fuzzyQuery(Employee.class, like);
        	}
	        else{
	        	pm = employeeService.getPagerDesc(Employee.class);
	        }
			
        }else{
        	pm = employeeService.getPagerDesc(Employee.class);
        }
		departmentList = departmentService.findByHql("from Department where dptType!=3");
		jobsList = jobsService.findByHql("from Jobs");

		return "list";

	}

	public String show() {
		employee = employeeService.findById(Employee.class, employeeId);
	    lists=empTrainService.findByHql("from Emp_Train o where o.empName.empId="+employeeId);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
		if (employee.getBirdate() != null) {
			birString = sdf.format(employee.getBirdate());
		}

		if (employee.geteDate() != null) {
			eDateString = sdf.format(employee.geteDate());
		}

		if (employee.getlDate() != null) {
			lDateString = sdf.format(employee.getlDate());
		}
		return "show";
	}

	/**
	 * 删除
	 * 
	 * @return
	 */

	public String del() {
		pm = employeeRapService.getPagerDesc(EmployeeRap.class,
				"where o.employee.empId=" + employeeId);
		List<EmployeeRap> list1 = pm.getDatas();
		for (EmployeeRap employeeRapTemp : list1) {
			EmployeeRap	employeeRap=employeeRapService.load(EmployeeRap.class, employeeRapTemp.getEmpRpId());
			employeeRap.setIsdel(1);
			employeeRapService.update(employeeRap);
		}
		/*************************** 以上的步骤是先删除奖惩表里面的信息，以防人员表的信息删除不掉 ************************************************************/
		Employee employee=employeeService.load(Employee.class, employeeId);
		employee.setIsdel(1);
		employeeService.update(employee);
		
		User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		logger.warn("user id="+currentUser.getId()+" del id="+employee.getEmpId());//日志记录
		
		return "pub_del_success";
	}

	/**
	 * 添加
	 * 
	 * @return
	 */
	public String add() {
		
		return employeeService.add(logger, jobsId, stDates, traNames, employee, departmentId, uploadFile, uploadFileFileName, uploadFileContentType);
	}

	/*
	 * ===================================input==================================
	 * ==========================
	 */

	public String addInput() {
		departmentList = departmentService.findByHql("from Department where dptType!=3");
		jobsList = jobsService.findByHql("from Jobs");
		return "add_input";
	}

	public String editInput() {

		employee = employeeService.findById(Employee.class, employeeId);
		lists=empTrainService.findByHql("from Emp_Train o where o.empName.empId="+employeeId);
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy年MM月dd日");
		if (employee.getBirdate() != null) {
			birString = sdf1.format(employee.getBirdate());
		}

		if (employee.geteDate() != null) {
			eDateString = sdf1.format(employee.geteDate());
		}

		if (employee.getlDate() != null) {
			lDateString = sdf1.format(employee.getlDate());
		}

		departmentList = departmentService.findByHql("from Department where dptType!=3");
		if (departmentId == null) {
			try {
				departmentId = employee.getDepartment().getId();

			} catch (Exception e) {
				// TODO: handle exception
			}
			jobsList = jobsService.findByHql("from Jobs");
			if (jobsId == null) {
				try {
					jobsId = employee.getJobs().getId();
				} catch (Exception e) {
					// TODO: handle exception
				}
			}

		}
		
		return "edit_input";
	}

	/************************** 以上为各种input页面 ******************************************/

	/**
	 * 编辑
	 * 
	 * @return
	 */
	public String update() {
		return employeeService.edite(lists, logger, jobsId, stDates, traNames, employee, departmentId, uploadFile, uploadFileFileName, uploadFileContentType);
//		try {
//			try {
//				employee.setDepartment(departmentService.findById(Department.class,
//						departmentId));
//				employee.setJobs(jobsService.findById(Jobs.class, jobsId));
//				if (FileUpload.upload(uploadFile, uploadFileFileName,
//						uploadFileContentType) == null) {
//					System.out.println("图片上传失败！！");
//				} else {
//					System.out.println("上传成功");
//					employee.setPic(FileUpload.upload(uploadFile,
//							uploadFileFileName, uploadFileContentType));
//				}
//	
//			} catch (Exception e) {
//				e.printStackTrace();// TODO: handle exception
//			}
//			
//			Employee employee2=employeeService.findById(Employee.class, employee.getEmpId());
//			lists=empTrainService.findByHql("from Emp_Train o where o.empName.empId="+employee.getEmpId());
//			for (Emp_Train lis : lists) {
//				empTrainService.deleteById(Emp_Train.class, lis.getId());
//			}
//			
//			int i=0;
//			for (String traName : traNames) {
//				Emp_Train empTrain2=new Emp_Train();
//				empTrain2.setTraName(traName);
//				empTrain2.setStDate(stDates.get(i));
//				i++;
//				empTrain2.setEmpName(employee2);
//				empTrainService.saveAndRefresh(empTrain2);
//			}
//			employeeService.update(employee);
//	} catch (Exception e) {
//		// TODO: handle exception
//	}
//	logger.warn("update id=" + employee.getEmpId());
//	User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//	logger.warn("user id="+currentUser.getId()+" update id="+employee.getEmpId());//日志记录
//	return "pub_update_success";
	}

	/************************** 人员奖惩的开始 ******************************************/
	/**
	 * 人员奖惩的列表
	 */
	public String raplist() {
		pm = employeeRapService.getPagerDesc(EmployeeRap.class,"where o.isdel is null or o.isdel=0");
		// departmentList=departmentService.findByHql("from Department");
		// jobsList=jobsService.findByHql("from Jobs");
		return "raplist";
	}

	/**
	 * 
	 * @return
	 */
	public String rapaddinput() {
		
		employeeList = employeeService.findByHql("from Employee ");
		
		// jobsList=jobsService.findByHql("from Jobs");
		return "rapaddinput";
	}

	/**
	 * 添加
	 * 
	 * @return
	 */
	public String rapadd() {
       //后台验证用户、奖惩名称、奖惩时间不能为空
		if (employeeId != null && employeeRap.getRapName() != null && employeeRap.getRapDate() != null) 
		{
			try {
				employee = employeeService.findById(Employee.class, employeeId);
			} catch (Exception e) {
				// TODO: handle exception
			}
			employeeRap.setEmployee(employee);
		

		employeeRapService.saveOrUpdate(employeeRap);
		
		User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		logger.warn("user id="+currentUser.getId()+" add id="+employeeRap.getEmpRpId());//日志记录
		
		
		}
		return "pub_add_success";
	}

	/**
	 * 删除
	 * 
	 * @return
	 */

	public String rapdel() {
		employeeRapService.deleteById(EmployeeRap.class, employeeRapId);
		
		User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		logger.warn("user id="+currentUser.getId()+" del id="+employeeRap.getEmpRpId());//日志记录
		
		return "pub_del_success";
	}

	/**
	 * 跳转到编辑的页面
	 * 
	 * @return
	 */
	public String rapeditInput() {

		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy年MM月dd日");
		employeeList = employeeService.findByHql("from Employee");
		try {
			employeeRap = employeeRapService.findById(EmployeeRap.class,
					employeeRapId);
		} catch (Exception e) {
			// TODO: handle exception
		}
		if (null != employeeRap.getRapDate()) {
			rapDatesString = sdf1.format(employeeRap.getRapDate());
		}
		return "rapeditInput";
	}

	/**
	 * 编辑
	 * 
	 * @return
	 */
	public String rapupdate() {

		try {
			employeeRap.setEmployee(employeeService.findById(Employee.class,
					employeeId));
		} catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}

		// try {
		// employee.setJobs(jobsService.findById(Jobs.class, jobsId));
		// } catch (Exception f) {
		// // TODO: handle exception
		// f.printStackTrace();
		// }

		employeeRapService.update(employeeRap);
		logger.warn("update id=" + employeeRap.getEmpRpId());
		User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		logger.warn("user id="+currentUser.getId()+" update id="+employeeRap.getEmpRpId());//日志记录
		return "pub_add_success";
	}

	/**
	 * 模糊查询（对姓名、奖惩名称）
	 * 
	 * @return
	 */
	public String rapsearch() {
		Map<String, String> like = new HashMap<String, String>();
        if(employeeRap!=null){	      
			if (null != employee.getEmpName() && null == employeeRap.getRapName()) {
				like.put("employee.empName", employee.getEmpName());
			} else if (null == employee.getEmpName()
					&& null != employeeRap.getRapName()) {
				like.put("rapName", employeeRap.getRapName());
			} else {
				like.put("employee.empName", employee.getEmpName());
				like.put("rapName", employeeRap.getRapName());
			}
	
			pm = employeeRapService.fuzzyQuery(EmployeeRap.class, like);
        }else{
        	pm = employeeRapService.getPagerDesc(EmployeeRap.class);
        }

		return "raplist";

	}

	/**
	 * 用来选择员工
	 */
	public String selectInput() {
		
		departmentList = departmentService.findByHql("from Department  where dptType!=3  ");
		jobsList = jobsService.findByHql("from Jobs");
		pm = employeeService.getPagerDesc(Employee.class,"where o.isdel is null or o.isdel =0");
		return "selectInput";

	}

	/**
	 * 选择员工的时候查询用的
	 */
	public String searchSelect() {
		Map<String, String> like = new HashMap<String, String>();

		like.put("empName", employee.getEmpName());
		like.put("sex", employee.getSex());
		like.put("department.dptName", employee.getDepartment().getDptName());
		like.put("jobs.jobsName", employee.getJobs().getJobsName());

		pm = employeeService.fuzzyQuery(Employee.class, like);
		departmentList = departmentService.findByHql("from Department where dptType!=3");
		jobsList = jobsService.findByHql("from Jobs");

		return "searchSelect";
	}
}
