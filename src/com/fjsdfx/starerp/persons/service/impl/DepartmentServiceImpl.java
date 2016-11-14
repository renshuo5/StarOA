package com.fjsdfx.starerp.persons.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.springframework.security.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.persons.dao.DepartmentDao;
import com.fjsdfx.starerp.persons.dao.EmployeeDao;
import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.model.Employee;
import com.fjsdfx.starerp.persons.service.DepartmentService;
import com.fjsdfx.starerp.security.model.User;

@Service
// 注入到spring的IOC
@Transactional
public class DepartmentServiceImpl extends BaseServiceImpl<Department>
		implements DepartmentService {

	private DepartmentDao departmentDao;
	private EmployeeDao employeeDao;

	public DepartmentDao getDepartmentDao() {
		return departmentDao;
	}

	public EmployeeDao getEmployeeDao() {
		return employeeDao;
	}

	@Resource
	public void setEmployeeDao(EmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
	}

	@Resource
	public void setDepartmentDao(DepartmentDao departmentDao) {
		this.departmentDao = departmentDao;
	}

	public List<Department> getAllDepartments() {
		return departmentDao.getAllDepartments();
	}

	public List<Department> getAllFdpts() {
		return findByHql("from Department");

	}

	public List<Department> getWorkshops() {
		return departmentDao.getWorkshops();
	}

	public Department getByDptName(String dptName) {
		return departmentDao.getByDptName(dptName);
	}

	public String del(Logger logger, Integer departmentId) {

		List<Employee> list= employeeDao.findByHql("from Employee o where o.empId="+departmentId);
		if (list.size()>0) {
			for (Employee employee : list) {
			    employeeDao.delete(employee);
			}
		}
		departmentDao.deleteById(Department.class, departmentId);

		User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		logger.warn("user id="+currentUser.getId()+" del id="+departmentId);//日志记录
		
		return "pub_del_success";
	}
}
