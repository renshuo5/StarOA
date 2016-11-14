package com.fjsdfx.starerp.persons.service.impl;


import java.io.File;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.springframework.security.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.bean.FileUpload;
import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.model.Emp_Train;
import com.fjsdfx.starerp.persons.model.Employee;
import com.fjsdfx.starerp.persons.model.Jobs;
import com.fjsdfx.starerp.persons.service.DepartmentService;
import com.fjsdfx.starerp.persons.service.Emp_TrainService;
import com.fjsdfx.starerp.persons.service.EmployeeService;
import com.fjsdfx.starerp.persons.service.JobsService;
import com.fjsdfx.starerp.security.model.User;

@Service      //注入到spring的IOC
@Transactional    
public class EmployeeServiceImpl  extends BaseServiceImpl<Employee> implements EmployeeService{

	private Emp_TrainService empTrainService;
	private JobsService jobsService;
	private DepartmentService departmentService;
	
	
	public Emp_TrainService getEmpTrainService() {
		return empTrainService;
	}
    @Resource
	public void setEmpTrainService(Emp_TrainService empTrainService) {
		this.empTrainService = empTrainService;
	}

	public JobsService getJobsService() {
		return jobsService;
	}
	@Resource
	public void setJobsService(JobsService jobsService) {
		this.jobsService = jobsService;
	}

	public DepartmentService getDepartmentService() {
		return departmentService;
	}
	@Resource
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}

	public List<Employee>  getAllRdpts(){
		
		return findByHql("from Employee");
		
	}

	public List<Employee> getWorkshopWorkers() {
		return findByHql("from Employee e where e.department.dptType = 2");
}

	public String add(Logger logger,Integer jobsId,List<Date> stDates,List<String> traNames,Employee employee,Integer departmentId, File uploadFile,String uploadFileFileName,String uploadFileContentType ) {
		//后台验证员工号、姓名、性别、部门、职位、员工性质、员工状态不能为空
		if(null!=employee.getEmpSn() && null!=employee.getEmpName() && null!=employee.getSex() && null!=departmentId && null!=jobsId && null!=employee.getStatus() && null!=employee.getNature())
		{
			
				try {
					employee.setDepartment(departmentService.findById(Department.class,
							departmentId));
					employee.setJobs(jobsService.findById(Jobs.class, jobsId));
					if (FileUpload.upload(uploadFile, uploadFileFileName,
							uploadFileContentType) == null) {
						System.out.println("图片上传失败！！");
					} else {
						System.out.println("上传成功");
						employee.setPic(FileUpload.upload(uploadFile,
								uploadFileFileName, uploadFileContentType));
					}
					
				} catch (Exception e) {
					// TODO: handle exception
				}
				if (null != employee.getEmpName())
				{
				int i=0;
				if(traNames!=null||traNames.size()>0){
				for (String traName : traNames) {
					Emp_Train empTrain2=new Emp_Train();
					empTrain2.setTraName(traName);
					empTrain2.setStDate(stDates.get(i));
					i++;
					empTrain2.setEmpName(saveAndRefresh(employee));
					empTrainService.saveAndRefresh(empTrain2);
				}
				}
				}
			
		
		User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		logger.warn("user id="+currentUser.getId()+" save id="+employee.getEmpId());//日志记录
		
		}
		return "pub_add_success";
	}
	public String edite(List< Emp_Train> lists,Logger logger, Integer jobsId, List<Date> stDates,
			List<String> traNames, Employee employee, Integer departmentId,
			File uploadFile, String uploadFileFileName,
			String uploadFileContentType) {
		try {
				employee.setDepartment(departmentService.findById(Department.class,
						departmentId));
				employee.setJobs(jobsService.findById(Jobs.class, jobsId));
				if(uploadFileFileName!=null){
					if (FileUpload.upload(uploadFile, uploadFileFileName,
							uploadFileContentType) == null) {
						System.out.println("图片上传失败！！");
					} else {
						System.out.println("上传成功");
						employee.setPic(FileUpload.upload(uploadFile,
								uploadFileFileName, uploadFileContentType));
					}
				}
		} catch (Exception e) {
			
		}
		update(employee);
			//Employee employee2=findById(Employee.class, employee.getEmpId());
			lists=empTrainService.findByHql("from Emp_Train o where o.empName.empId="+employee.getEmpId());
			for (Emp_Train lis : lists) {
				empTrainService.deleteById(Emp_Train.class, lis.getId());
			}
			
			int i=0;
			if(traNames!=null||traNames.size()>0){
			for (String traName : traNames) {
				Emp_Train empTrain2=new Emp_Train();
				empTrain2.setTraName(traName);
				empTrain2.setStDate(stDates.get(i));
				i++;
				empTrain2.setEmpName(employee);
				empTrainService.saveAndRefresh(empTrain2);
			}
			}
			
	
		logger.warn("update id=" + employee.getEmpId());
		User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		logger.warn("user id="+currentUser.getId()+" update id="+employee.getEmpId());//日志记录
	
		return "pub_update_success";
	}
	
	
}
