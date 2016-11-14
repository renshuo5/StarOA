package com.fjsdfx.starerp.warehouse.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.common.service.BaseServiceImpl;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ItemTypeService;
import com.fjsdfx.starerp.persons.model.Employee;
import com.fjsdfx.starerp.security.model.User;
import com.fjsdfx.starerp.warehouse.model.Rewgood;
import com.fjsdfx.starerp.warehouse.model.Rewinder;
import com.fjsdfx.starerp.warehouse.service.RewgoodService;
import com.fjsdfx.starerp.warehouse.service.RewinderService;

@Service
@Transactional
public class RewinderServiceImpl extends BaseServiceImpl<Rewinder> implements
		RewinderService {


}
