package com.fjsdfx.starerp.persons.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.springframework.security.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.persons.dao.DepartmentDao;
import com.fjsdfx.starerp.persons.dao.YtrainplanDao;
import com.fjsdfx.starerp.persons.dao.yplannameDao;
import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.model.Ytrainplan;
import com.fjsdfx.starerp.persons.model.yplanname;
import com.fjsdfx.starerp.persons.service.YtrainplanService;
import com.fjsdfx.starerp.persons.service.yplannameService;
import com.fjsdfx.starerp.security.model.User;

@Service      //注入到spring的IOC
@Transactional    

public class YtrainplanServiceImpl extends BaseServiceImpl<Ytrainplan> implements YtrainplanService{

	private yplannameService yplannameService;
	private DepartmentDao departmentDao;
	private YtrainplanDao ytrainplanDao;
	
	






	public yplannameService getYplannameService() {
		return yplannameService;
	}

	@Resource
	public void setYplannameService(yplannameService yplannameService) {
		this.yplannameService = yplannameService;
	}

	public DepartmentDao getDepartmentDao() {
		return departmentDao;
	}

	@Resource(name="departmentDaoImpl")
	public void setDepartmentDao(DepartmentDao departmentDao) {
		this.departmentDao = departmentDao;
	}

	public YtrainplanDao getYtrainplanDao() {
		return ytrainplanDao;
	}

	@Resource(name="ytrainplanDaoImpl")
	public void setYtrainplanDao(YtrainplanDao ytrainplanDao) {
		this.ytrainplanDao = ytrainplanDao;
	}

	public String add(Logger logger,List<String> contents,List<Integer> departmentIds,List<Integer> departmentId1s,List<String> adds,List<String> schdate1s,List<String> schdate2s,List<String> schdate3s,List<String> schdate4s,yplanname yplanname1) {
		User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		try {
			yplanname1=yplannameService.saveAndRefresh(yplanname1);
			int i=0;
			for (String content : contents) {
				Ytrainplan ytrainplan1=new Ytrainplan();
				ytrainplan1.setContent(content);
				ytrainplan1.setTraddress(adds.get(i));
				ytrainplan1.setSchdate1(schdate1s.get(i));
				ytrainplan1.setSchdate2(schdate2s.get(i));
				ytrainplan1.setSchdate3(schdate3s.get(i));
				ytrainplan1.setSchdate4(schdate4s.get(i));
				ytrainplan1.setYplanname(yplanname1);
				ytrainplan1.setDepartment(departmentDao.get(Department.class, departmentIds.get(i)));
				ytrainplan1.setWithf(departmentDao.get(Department.class, departmentId1s.get(i)));
				i++;
				ytrainplanDao.save(ytrainplan1);
				logger.warn("user id="+currentUser.getId()+"add id="+ytrainplan1.getId());
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "pub_add_success";
	}

	public String edite(Logger logger, List<String> contents,
			List<Integer> departmentIds, List<Integer> departmentId1s,
			List<String> adds, List<String> schdate1s, List<String> schdate2s,
			List<String> schdate3s, List<String> schdate4s, yplanname yplanname1) {
		User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		try {
			yplannameService.update(yplanname1);
			List<Ytrainplan> ytrainplanlist=ytrainplanDao.findByHql("from Ytrainplan o where o.yplanname.id="+yplanname1.getId());
			for (Ytrainplan ytrainplan : ytrainplanlist) {
				ytrainplanDao.deleteById(Ytrainplan.class, ytrainplan.getId());
			}
			yplanname yplanname2=yplannameService.findById(yplanname.class, yplanname1.getId());
			int i=0;
			for (String content : contents) {
				Ytrainplan ytrainplan1=new Ytrainplan();
				ytrainplan1.setContent(content);
				ytrainplan1.setTraddress(adds.get(i));
				ytrainplan1.setSchdate1(schdate1s.get(i));
				ytrainplan1.setSchdate2(schdate2s.get(i));
				ytrainplan1.setSchdate3(schdate3s.get(i));
				ytrainplan1.setSchdate4(schdate4s.get(i));
				ytrainplan1.setYplanname(yplanname2);
				if(departmentIds.get(i)!=null){
				ytrainplan1.setDepartment(departmentDao.get(Department.class, departmentIds.get(i)));
				}if(departmentId1s.get(i)!=null){
				ytrainplan1.setWithf(departmentDao.get(Department.class, departmentId1s.get(i)));
				}
				i++;
				ytrainplanDao.save(ytrainplan1);
				logger.warn("user id="+currentUser.getId()+"add id="+ytrainplan1.getId());
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "pub_update_success";
	}

	public String del(Logger logger,int yplanId) {
		try {
			List<Ytrainplan> ytrainplanlist=ytrainplanDao.findByHql("from Ytrainplan o where o.yplanname.id="+yplanId);
		    for (Ytrainplan ytrainplan : ytrainplanlist) {
		    	ytrainplanDao.delete(ytrainplan);
			}
		    yplannameService.deleteById(yplanname.class, yplanId);
			User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			logger.warn("user id="+currentUser.getId()+"and del id="+yplanId);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "pub_del_success";
	}

}
