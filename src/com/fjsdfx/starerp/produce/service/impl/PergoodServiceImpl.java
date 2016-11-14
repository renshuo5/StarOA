package com.fjsdfx.starerp.produce.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.produce.model.Pergood;
import com.fjsdfx.starerp.produce.service.PergoodService;
import com.fjsdfx.starerp.warehouse.dao.Susgood3Dao;
import com.fjsdfx.starerp.warehouse.model.Susgood3;

@Service
@Transactional
public class PergoodServiceImpl extends BaseServiceImpl<Pergood> implements PergoodService {

	private Susgood3Dao susgood3Dao;
	/**
	 * @param preparationId 要货单id
	 * @return 要货物品列表
	 */
	public List<Pergood> getPergoods(Integer preparationId) {
		String hql = "select o from Pergood o where o.preparation = " + preparationId;
		List<Pergood> pergoods = findByHql(hql);
		return pergoods;
	}

	public Pergood getPergoodByItemTypeId(Integer itemTypeId) throws Exception{
		List<Pergood> pergoods = findByHql("from Pergood p where p.itemType.id="+itemTypeId);
		if(null==pergoods || pergoods.size()==0)
		{
			throw new Exception("该要货物品没有对应的规格型号！！！");
		}
		else
		{
			return pergoods.get(0);
		}
	}

	public Susgood3Dao getSusgood3Dao() {
		return susgood3Dao;
	}

	@Resource
	public void setSusgood3Dao(Susgood3Dao susgood3Dao) {
		this.susgood3Dao = susgood3Dao;
	}
	
}
