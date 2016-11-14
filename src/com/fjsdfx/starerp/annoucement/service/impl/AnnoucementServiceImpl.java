package com.fjsdfx.starerp.annoucement.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fjsdfx.starerp.annoucement.model.Annoucement;
import com.fjsdfx.starerp.annoucement.service.AnnoucementService;
import com.fjsdfx.starerp.common.service.BaseServiceImpl;

@Service
@Transactional
public class AnnoucementServiceImpl extends BaseServiceImpl<Annoucement> implements AnnoucementService{

}
