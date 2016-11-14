package com.fjsdfx.starerp.persons.service.impl;




import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.springframework.security.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.model.Recruitment;
import com.fjsdfx.starerp.persons.model.Yrecruitment;
import com.fjsdfx.starerp.persons.service.DepartmentService;
import com.fjsdfx.starerp.persons.service.RecruitmentService;
import com.fjsdfx.starerp.persons.service.YrecruitmentService;
import com.fjsdfx.starerp.security.model.User;

@Service      //注入到spring的IOC
@Transactional    
public class RecruitmentServiceImpl  extends BaseServiceImpl<Recruitment> implements RecruitmentService{

	private YrecruitmentService yrecruitmentService;
	private DepartmentService departmentService;
	
	public YrecruitmentService getYrecruitmentService() {
		return yrecruitmentService;
	}

	@Resource
	public void setYrecruitmentService(YrecruitmentService yrecruitmentService) {
		this.yrecruitmentService = yrecruitmentService;
	}

	public DepartmentService getDepartmentService() {
		return departmentService;
	}
	@Resource
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}

	public String yadd(Logger logger,Yrecruitment yrecruitment,List<String> recstylelist,List<String>  recnaturelist,List<Integer> recnolist,List<String> basereclist,List<Integer> departmentIds) {
		User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		try {
			yrecruitment=yrecruitmentService.saveAndRefresh(yrecruitment);
			int i=0;
			for (String recstyle : recstylelist) {
				Recruitment recruitment1=new Recruitment();
				recruitment1.setRecstyle(recstyle);
				if(departmentIds.get(i)!=null){
				recruitment1.setDepartment(departmentService.findById(Department.class, departmentIds.get(i)));
				}
				recruitment1.setRecno(recnolist.get(i));
				recruitment1.setRecnature(recnaturelist.get(i));
				recruitment1.setBaserec(basereclist.get(i));
				recruitment1.setrDate(new Date());
				recruitment1.setIsyear(1);
				recruitment1.setYrecruitment(yrecruitment);
				saveAndRefresh(recruitment1);
				i++;
				
				logger.warn("user id="+currentUser.getId()+"add id="+recruitment1.getId());
			  }
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return "pub_add_success";
	}

	public String yedite(List<Recruitment> recruitments,Logger logger, Yrecruitment yrecruitment,
			List<String> recstylelist, List<String> recnaturelist,
			List<Integer> recnolist, List<String> basereclist,
			List<Integer> departmentIds) {
		User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		try {
			yrecruitmentService.update(yrecruitment);
			 recruitments=findByHql("from Recruitment o where o.yrecruitment.id="+yrecruitment.getId());
			for (Recruitment recruitment : recruitments) {
				delete(recruitment);
			}
			Yrecruitment yrecruitment2=yrecruitmentService.findById(Yrecruitment.class, yrecruitment.getId());
			int i=0;
			for (String recstyle : recstylelist) {
				Recruitment recruitment1=new Recruitment();
				recruitment1.setRecstyle(recstyle);
				if(departmentIds.get(i)!=null){
				recruitment1.setDepartment(departmentService.findById(Department.class, departmentIds.get(i)));
				}
				recruitment1.setRecno(recnolist.get(i));
				recruitment1.setRecnature(recnaturelist.get(i));
				recruitment1.setBaserec(basereclist.get(i));
				recruitment1.setrDate(new Date());
				recruitment1.setIsyear(1);
				recruitment1.setYrecruitment(yrecruitment2);
				saveAndRefresh(recruitment1);
				i++;
				
				logger.warn("user id="+currentUser.getId()+"add id="+recruitment1.getId());
			  }
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "pub_update_success";
	}

	public String ydel(Logger logger,List<Recruitment> recruitments,Integer yrecruitmentId) {
		try {
			recruitments=findByHql("from Recruitment o where o.yrecruitment.id="+yrecruitmentId);
			for (Recruitment recruitment : recruitments) {
				delete(recruitment);
			}
			yrecruitmentService.deleteById(Yrecruitment.class, yrecruitmentId);
		} catch (Exception e) {
			// TODO: handle exception
		}
		User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		logger.warn("user id="+currentUser.getId()+"del id="+yrecruitmentId);
		
		return "pub_del_success";
	}



}
