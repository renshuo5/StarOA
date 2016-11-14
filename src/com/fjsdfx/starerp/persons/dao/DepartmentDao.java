package com.fjsdfx.starerp.persons.dao;

import java.util.List;

import com.fjsdfx.starerp.common.dao.BaseDao;
import com.fjsdfx.starerp.persons.model.Department;




public interface DepartmentDao extends BaseDao<Department>{
	public List<Department> getAllDepartments();
	public List<Department> getWorkshops();
	public Department getByDptName(String dptName);
}
