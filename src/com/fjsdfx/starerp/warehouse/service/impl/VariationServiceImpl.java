package com.fjsdfx.starerp.warehouse.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.item.model.ItemRelation;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ItemRelationService;
import com.fjsdfx.starerp.item.service.ItemTypeService;
import com.fjsdfx.starerp.persons.service.EmployeeService;
import com.fjsdfx.starerp.warehouse.dao.VargoodDao;
import com.fjsdfx.starerp.warehouse.dao.VariationDao;
import com.fjsdfx.starerp.warehouse.model.Vargood;
import com.fjsdfx.starerp.warehouse.model.Variation;
import com.fjsdfx.starerp.warehouse.service.VariationService;

@Service
@Transactional
public class VariationServiceImpl  extends BaseServiceImpl<Variation> implements VariationService{
	private VariationDao variationDao;
	private VargoodDao vargoodDao;
	private ItemRelationService itemRelationService;
	private ItemTypeService itemTypeService;
	private EmployeeService employeeService;
	

	public EmployeeService getEmployeeService() {
		return employeeService;
	}

	@Resource
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	public ItemTypeService getItemTypeService() {
		return itemTypeService;
	}

	@Resource
	public void setItemTypeService(ItemTypeService itemTypeService) {
		this.itemTypeService = itemTypeService;
	}

	public ItemRelationService getItemRelationService() {
		return itemRelationService;
	}

	@Resource
	public void setItemRelationService(ItemRelationService itemRelationService) {
		this.itemRelationService = itemRelationService;
	}

	public VariationDao getVariationDao() {
		return variationDao;
	}

	@Resource
	public void setVariationDao(VariationDao variationDao) {
		this.variationDao = variationDao;
	}
	

	public VargoodDao getVargoodDao() {
		return vargoodDao;
	}

	@Resource
	public void setVargoodDao(VargoodDao vargoodDao) {
		this.vargoodDao = vargoodDao;
	}

	public void save(Variation variation, Vargood vargood) {
		vargood.setVariation(variation);
		variation.setQuaadvice(0);
		variationDao.save(variation);
		vargoodDao.save(vargood);
	}

	public void updateByAudit(Integer varId, Integer quaadvice, String quanote) {
		Variation variation = findById(Variation.class, varId);
		variation.setQuaadvice(quaadvice);
		variation.setQuanote(quanote);
		saveOrUpdate(variation);
	}
	
}
