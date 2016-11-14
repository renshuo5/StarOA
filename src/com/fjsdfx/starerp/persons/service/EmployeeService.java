package com.fjsdfx.starerp.persons.service;

import java.io.File;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;

import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.persons.model.Emp_Train;
import com.fjsdfx.starerp.persons.model.Employee;

public interface EmployeeService extends BaseService<Employee> {
	public List<Employee>  getAllRdpts(); 
	public List<Employee> getWorkshopWorkers();
	public String add(Logger logger,Integer jobsId,List<Date> stDates,List<String> traNames,Employee employee,Integer departmentId, File uploadFile,String uploadFileFileName,String uploadFileContentType );
	public String edite(List< Emp_Train> lists,Logger logger,Integer jobsId,List<Date> stDates,List<String> traNames,Employee employee,Integer departmentId, File uploadFile,String uploadFileFileName,String uploadFileContentType );
}
