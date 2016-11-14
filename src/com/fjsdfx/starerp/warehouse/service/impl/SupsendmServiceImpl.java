package com.fjsdfx.starerp.warehouse.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.item.dao.ItemRelationDao;
import com.fjsdfx.starerp.item.model.ItemRelation;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ItemTypeService;
import com.fjsdfx.starerp.persons.dao.DepartmentDao;
import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.model.Employee;
import com.fjsdfx.starerp.produce.model.Pergood;
import com.fjsdfx.starerp.produce.model.Preparation;
import com.fjsdfx.starerp.produce.service.PergoodService;
import com.fjsdfx.starerp.produce.service.PreparationService;
import com.fjsdfx.starerp.warehouse.dao.StockDao;
import com.fjsdfx.starerp.warehouse.dao.SupsendmDao;
import com.fjsdfx.starerp.warehouse.dao.SusgoodDao;
import com.fjsdfx.starerp.warehouse.model.Supsendm;
import com.fjsdfx.starerp.warehouse.model.Susgood;
import com.fjsdfx.starerp.warehouse.service.SupsendmService;
import com.fjsdfx.starerp.warehouse.service.SusgoodService;

@Service("supsendmServiceImpl")
@Transactional
public class SupsendmServiceImpl extends BaseServiceImpl<Supsendm> implements
		SupsendmService {
	private DepartmentDao departmentDao;
	private SupsendmDao supsendmDao;
	private ItemRelationDao itemRelationDao;
	private SusgoodDao susgoodDao;
	private SusgoodService susgoodService;
	private StockDao stockDao;
	private PreparationService preparationService;
	private PergoodService pergoodService;
	private ItemTypeService itemTypeService;
	
	public ItemTypeService getItemTypeService() {
		return itemTypeService;
	}

	@Resource
	public void setItemTypeService(ItemTypeService itemTypeService) {
		this.itemTypeService = itemTypeService;
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

	public StockDao getStockDao() {
		return stockDao;
	}

	@Resource
	public void setStockDao(StockDao stockDao) {
		this.stockDao = stockDao;
	}

	public SusgoodService getSusgoodService() {
		return susgoodService;
	}

	@Resource
	public void setSusgoodService(SusgoodService susgoodService) {
		this.susgoodService = susgoodService;
	}

	public SusgoodDao getSusgoodDao() {
		return susgoodDao;
	}

	@Resource
	public void setSusgoodDao(SusgoodDao susgoodDao) {
		this.susgoodDao = susgoodDao;
	}

	public ItemRelationDao getItemRelationDao() {
		return itemRelationDao;
	}

	@Resource
	public void setItemRelationDao(ItemRelationDao itemRelationDao) {
		this.itemRelationDao = itemRelationDao;
	}

	public SupsendmDao getSupsendmDao() {
		return supsendmDao;
	}

	@Resource
	public void setSupsendmDao(SupsendmDao supsendmDao) {
		this.supsendmDao = supsendmDao;
	}

	public List<Employee> getProductionWorkers() {
		return supsendmDao.getProductionWorkers();
	}

	public List<Employee> getWarehouseWorkers() {
		return supsendmDao.getWarehouseWorkers();
	}

	public List<Employee> getWorkshopWorkers() {
		return supsendmDao.getWorkshopWorkers();
	}

	/**
	 *  Map<Integer,Integer> infos :存放pergood中itemTypeId和num
	 */
	public Map<ItemType, Integer> getPartItemTypes(Map<Integer, Integer> infos) {
		Map<ItemType, Integer> result = new HashMap<ItemType, Integer>();
		Set<Integer> itemTypeIds = infos.keySet();
		for(Integer itemTypeId:itemTypeIds)
		{
			List<ItemRelation> irs = itemRelationDao.findRelationsByItemTypeId(itemTypeId);
			for(ItemRelation ir:irs)
			{
				ItemType itemType = ir.getPart();
				if(result.get(itemType)!=null)
				{
					result.put(itemType, result.get(itemType)+ir.getPartamount()*(infos.get(itemTypeId)));
				}
				else
				{
					result.put(itemType, ir.getPartamount()*(infos.get(itemTypeId)));
				}
			}
		}
		return result;
	}
	
	public Map<ItemType, Integer> getSinglePartItemTypes(Integer itemTypeId,Integer needNum) {
		Map<ItemType, Integer> result = new HashMap<ItemType, Integer>();
		
		List<ItemRelation> irs = itemRelationDao.findRelationsByItemTypeId(itemTypeId);
		for(ItemRelation ir:irs)
		{
			ItemType itemType = ir.getPart();
			if(result.get(itemType)!=null)
			{
				result.put(itemType, result.get(itemType)+ir.getPartamount()*needNum);
			}
			else
			{
				result.put(itemType, ir.getPartamount()*needNum);
			}
		}
		
		return result;
	}

	public void deleteById(Integer id) {
		susgoodDao.deleteBySupsendmId(id);
		Supsendm supsendm = findById(Supsendm.class, id);
		delete(supsendm);
	}

	public void update(Supsendm supsendm, List<Integer> itemTypeIds,
		List<Integer> singlesets, List<Integer> generalnos,
		List<Integer> bondednums, List<Integer> tbalances,
		List<Integer> lbalances, List<String> notes) {
		List<Department> departments = departmentDao.findByHql("from Department d where d.id = "+supsendm.getDepartment().getId());
		Department department = null; 
		String partNo = supsendm.getPartno();
		Date date = supsendm.getDate();
		if(null!=departments && departments.size()>0)
		{
			department = departments.get(0);
		}
		supsendm = findById(Supsendm.class, supsendm.getSus_id());
		supsendm.setDepartment(department);
		supsendm.setDate(date);
		supsendm.setPartno(partNo);
		saveOrUpdate(supsendm);
		//拿到现在的投料套
		Integer feeding = supsendm.getFeeding();
		//获得数据库现有的未更新的配套发料表，拿到原来的投料套
		Supsendm sourseSupsendm = findById(Supsendm.class, supsendm.getSus_id());
		Integer sourceFeeding = sourseSupsendm.getFeeding();
		//计算出差值（现有的比原来的多多少或者少多少）
		Integer diff = feeding-sourceFeeding;
		//先更新页面传来的配套发料表
		saveOrUpdate(supsendm);
		//拿出此发料表之后的发料表，其投料套也要跟着更新
		List<Supsendm> supsendms = findByHql("from Supsendm s where s.sus_id > "+supsendm.getSus_id());
		//遍历所有发料表
		for(Supsendm s:supsendms)
		{
			//进行新的投料套赋值
			s.setFeeding(s.getFeeding()+diff);
			//更新
			saveOrUpdate(s);
		}
		List<Susgood> susgoods = susgoodService.getSusgoodsBySupsendmId(supsendm.getSus_id());
		for(Susgood susgood :susgoods)
		{
			ItemType it = susgood.getItemType();
			//这次发了多少料（本批结存-上批结存）
			Integer stockDiff = susgood.getLbalance()-susgood.getTbalance();
			System.out.println("stockDiff1 = "+stockDiff);
			String name = stockDao.getWhnameByItemTypeId(it.getId());
			try {
				stockDao.addNumber(it, name, stockDiff);
			} catch (Exception e) {
				e.printStackTrace();
			}
			List<Susgood> aftersusgoods = susgoodService.findByHql("from Susgood s where s.itemType.id = "+it.getId()+" and s.supsendm.sus_id > "+supsendm.getSus_id());
			System.out.println("2222aftersusgoods's size = "+aftersusgoods.size());
			for(Susgood asusgood :aftersusgoods)
			{
				asusgood.setLbalance(stockDiff+asusgood.getLbalance());
				asusgood.setTbalance(stockDiff+asusgood.getTbalance());
				System.out.println("asusgood's Lbalance = "+asusgood.getLbalance()+", asusgood's Tbalance = "+asusgood.getTbalance());
				susgoodService.saveOrUpdate(asusgood);
			}
		}
		susgoodDao.deleteBySupsendmId(supsendm.getSus_id());
		for(int i=0;i<itemTypeIds.size();i++)
		{
			if(null==itemTypeIds.get(i))
			{
				itemTypeIds.remove(i);
				singlesets.remove(i);
				generalnos.remove(i);
				bondednums.remove(i);
				tbalances.remove(i);
				lbalances.remove(i);
				notes.remove(i);
				i--;
			}
		}
		List<ItemType> itemTypes = itemTypeService.getItemTypesByIds(itemTypeIds);
		for(int i=0;i<itemTypes.size();i++)
		{
			ItemType itemType = itemTypes.get(i);
			Susgood tempSusgood = new Susgood();
			tempSusgood.setItemType(itemType);
			tempSusgood.setBondednum(bondednums.get(i));
			tempSusgood.setGeneralno(generalnos.get(i));
			tempSusgood.setTbalance(tbalances.get(i));
			tempSusgood.setLbalance(lbalances.get(i));
			tempSusgood.setNote(notes.get(i));
			tempSusgood.setSingleset(singlesets.get(i));
			tempSusgood.setSupsendm(supsendm);
			Integer stockDiff = tempSusgood.getLbalance()-tempSusgood.getTbalance();
			tempSusgood = susgoodService.save(tempSusgood);
			
			try {
				stockDao.subNumber(itemType, tempSusgood.getSingleset()*(itemType.getBondedNo()==null||itemType.getBondedNo()==0?generalnos.get(i):bondednums.get(i)));
			} catch (Exception e) {
				e.printStackTrace();
			}
			List<Susgood> aftersusgoods = susgoodService.findByHql("from Susgood s where s.itemType.id = "+itemType.getId()+" and s.supsendm.sus_id > "+tempSusgood.getSupsendm().getSus_id());
			System.out.println("1111aftersusgoods's size = "+aftersusgoods.size());
			for(Susgood asusgood :aftersusgoods)
			{
				asusgood.setLbalance(asusgood.getLbalance()-stockDiff);
				asusgood.setTbalance(asusgood.getTbalance()-stockDiff);
				System.out.println("----------asusgood's Lbalance = "+asusgood.getLbalance()+", asusgood's Tbalance = "+asusgood.getTbalance());
				susgoodService.saveOrUpdate(asusgood);
			}
		}
	}

	public void saveByPreid(Supsendm supsendm, Integer preid) {
		ItemType itemType = itemTypeService.findById(ItemType.class, supsendm.getItemType().getId());
		Preparation preparation = preparationService.findById(Preparation.class, preid);
		String hqlString = "from Pergood p where p.preparation.id="+preid+" and p.itemType.id="+supsendm.getItemType().getId();
		System.out.println("hqlString = "+hqlString);
		List<Pergood> pergoods = pergoodService.findByHql(hqlString);
		Pergood pergood = null;
		if(null!=pergoods&&pergoods.size()>0)
		{
			pergood = pergoods.get(0);
			pergood.setAddsup(1);
			pergoodService.saveOrUpdate(pergood);
			Integer isAllMadeSupsendm=1;
			System.out.println("pergoods's size = "+pergoods.size());
			pergoods = pergoodService.findByHql("from Pergood p where p.preparation.id="+preid);
			for(Pergood pgood:pergoods)
			{
				if(null==pgood.getAddsup()||pgood.getAddsup()==0)
				{
					isAllMadeSupsendm=0;
				}
			}
			if(isAllMadeSupsendm==1)
			{
				preparation.setAddsup(1);
				preparationService.saveOrUpdate(preparation);
			}
		}
		supsendm.setPreparation(preparation);
		supsendm.setItemType(itemType);
		save(supsendm);
	}

	public Supsendm findByPergoodId(Integer pergoodId) {
		Pergood pergood = pergoodService.findById(Pergood.class, pergoodId);
		List<Supsendm> supsendms = findByHql("from Supsendm s where s.itemType.id="+pergood.getItemType().getId());
		if(null!=supsendms&&supsendms.size()>0)
		{
			Supsendm supsendm = supsendms.get(0);
			return supsendm;
		}
		return null;
	}

	public Integer getLastFeeding(Integer itemTypeId) throws Exception{
		Date date = new Date();
		if(date.getMonth()==1&&date.getDate()==1)
		{
			return 0;
		}
		List<Supsendm> supsendms = this.findByHql("from Supsendm s where s.itemType.id = "+itemTypeId+" order by s.id desc");
		if(null==supsendms||supsendms.size()==0)
		{
			return 0;
		}
		return supsendms.get(0).getFeeding();
	}

	public DepartmentDao getDepartmentDao() {
		return departmentDao;
	}

	@Resource
	public void setDepartmentDao(DepartmentDao departmentDao) {
		this.departmentDao = departmentDao;
	}

}
