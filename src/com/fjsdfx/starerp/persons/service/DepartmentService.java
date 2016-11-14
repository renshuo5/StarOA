package com.fjsdfx.starerp.persons.service;



import java.util.List;

import org.slf4j.Logger;

import com.fjsdfx.starerp.common.service.BaseService;
import com.fjsdfx.starerp.persons.model.Department;

public interface DepartmentService extends BaseService<Department> {
	public List<Department> getAllDepartments();
	public List<Department> getAllFdpts();
	public List<Department> getWorkshops();
	public Department getByDptName(String dptName);
	public String del(Logger logger,Integer departmentId);
}


