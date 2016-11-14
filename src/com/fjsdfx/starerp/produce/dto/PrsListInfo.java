package com.fjsdfx.starerp.produce.dto;


import java.io.Serializable;

import com.fjsdfx.starerp.produce.model.Preparation;
import com.fjsdfx.starerp.produce.model.Prscheck;
import com.fjsdfx.starerp.warehouse.model.Supsendm;

public class PrsListInfo implements Serializable{
	private Preparation preparation;
	private Prscheck prscheck;
	public Prscheck getPrscheck() {
		return prscheck;
	}
	public void setPrscheck(Prscheck prscheck) {
		this.prscheck = prscheck;
	}
	public Preparation getPreparation() {
		return preparation;
	}
	public void setPreparation(Preparation preparation) {
		this.preparation = preparation;
	}
	
}
