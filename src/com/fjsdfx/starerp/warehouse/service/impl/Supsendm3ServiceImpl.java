package com.fjsdfx.starerp.warehouse.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.service.DepartmentService;
import com.fjsdfx.starerp.produce.model.Pergood;
import com.fjsdfx.starerp.produce.model.Preparation;
import com.fjsdfx.starerp.produce.service.PergoodService;
import com.fjsdfx.starerp.produce.service.PreparationService;
import com.fjsdfx.starerp.warehouse.dao.StockDao;
import com.fjsdfx.starerp.warehouse.model.Supsendm3;
import com.fjsdfx.starerp.warehouse.model.Susgood3;
import com.fjsdfx.starerp.warehouse.service.Supsendm3Service;
import com.fjsdfx.starerp.warehouse.service.Susgood3Service;

@Service
@Transactional
public class Supsendm3ServiceImpl extends BaseServiceImpl<Supsendm3> implements
		Supsendm3Service {

	private DepartmentService departmentService;
	private PergoodService pergoodService;
	private PreparationService preparationService;
	private Susgood3Service susgood3Service;
	private StockDao stockDao;

	public Supsendm3 saveByPreparationId(Supsendm3 supsendm3, Integer id) {
		Preparation preparation = preparationService.findById(
				Preparation.class, id);
		Department department = departmentService.getByDptName(supsendm3
				.getDepartment().getDptName());
		String hqlString = "from Pergood p where p.preparation.id=" + id
				+ " and p.itemType.id=" + supsendm3.getItemType().getId();
		System.out.println("hqlString = " + hqlString);
		List<Pergood> pergoods = pergoodService.findByHql(hqlString);
		Pergood pergood = null;
		if (null != pergoods && pergoods.size() > 0) {
			pergood = pergoods.get(0);
			pergood.setAddsup(1);
			pergoodService.saveOrUpdate(pergood);
			Integer isAllMadeSupsendm = 1;
			System.out.println("pergoods's size = " + pergoods.size());
			pergoods = pergoodService
					.findByHql("from Pergood p where p.preparation.id=" + id);
			for (Pergood pgood : pergoods) {
				if (null == pgood.getAddsup() || pgood.getAddsup() == 0) {
					isAllMadeSupsendm = 0;
				}
			}
			if (isAllMadeSupsendm == 1) {
				preparation.setAddsup(1);
				preparationService.saveOrUpdate(preparation);
			}
		}
		supsendm3.setPreparation(preparation);
		supsendm3.setDepartment(department);
		return (Supsendm3) saveOrUpdate(supsendm3);
	}

	public void deleteSupsendm3(Supsendm3 supsendm3) {
//		List<Susgood3> susgood3s = susgood3Service
//				.findByHql("from Susgood3 s where s.supsendm3.id="
//						+ supsendm3.getId());
//		if (null != susgood3s && susgood3s.size() > 0) {
//			for (Susgood3 susgood3 : susgood3s) {
//				susgood3Service.delete(susgood3);
//				try {
//					stockDao.addNumber(susgood3.getItemType(), stockDao
//							.getWhnameByItemTypeId(susgood3.getItemType()
//									.getId()), susgood3.getPracNum());
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//			}
//		}
		delete(supsendm3);
	}

	public void updateSupsendm3(Supsendm3 supsendm3) {
		Department department = departmentService.getByDptName(supsendm3.getDepartment().getDptName());
		String hawversion = supsendm3.getHawversion();
		Date sudate = supsendm3.getSudate();
		supsendm3 = findById(Supsendm3.class, supsendm3.getId());
		supsendm3.setDepartment(department);
		supsendm3.setHawversion(hawversion);
		supsendm3.setSudate(sudate);
		saveOrUpdate(supsendm3);
	}

	/************************* get and set **************************/
	public DepartmentService getDepartmentService() {
		return departmentService;
	}

	@Resource
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}

	public PergoodService getPergoodService() {
		return pergoodService;
	}

	@Resource
	public void setPergoodService(PergoodService pergoodService) {
		this.pergoodService = pergoodService;
	}

	public PreparationService getPreparationService() {
		return preparationService;
	}

	@Resource
	public void setPreparationService(PreparationService preparationService) {
		this.preparationService = preparationService;
	}

	public Susgood3Service getSusgood3Service() {
		return susgood3Service;
	}

	@Resource
	public void setSusgood3Service(Susgood3Service susgood3Service) {
		this.susgood3Service = susgood3Service;
	}

	public StockDao getStockDao() {
		return stockDao;
	}

	@Resource
	public void setStockDao(StockDao stockDao) {
		this.stockDao = stockDao;
	}
}
