package com.fjsdfx.starerp.warehouse.service.impl;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.warehouse.dao.MaccountingDao;
import com.fjsdfx.starerp.warehouse.model.Maccounting;
import com.fjsdfx.starerp.warehouse.service.MaccountingService;

@Service
@Transactional
public class MaccountingServiceImpl extends BaseServiceImpl<Maccounting> implements MaccountingService{

	private MaccountingDao maccountingDao;
	
	public MaccountingDao getMaccountingDao() {
		return maccountingDao;
	}

	@Resource
	public void setMaccountingDao(MaccountingDao maccountingDao) {
		this.maccountingDao = maccountingDao;
	}

	/**
	 * 增加入库数量
	 */
	public void addEnNumber(Date date, ItemType itemType,String whname, Integer num) {
		try {
			maccountingDao.addEnNumber(date, itemType, whname, num);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 增加出库数量
	 */
	public void addOutNumber(Date date, ItemType itemType, Integer num) {
		try {
			maccountingDao.addOutNumber(date, itemType, num);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 获取库存数量
	 */
	public void setstonum() {
		maccountingDao.setStonum();
	}

}
