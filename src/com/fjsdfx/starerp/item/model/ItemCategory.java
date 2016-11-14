package com.fjsdfx.starerp.item.model;

public enum ItemCategory {
	MATERIAL {public String getName(){return "原料";};},
	SEMIFINISHED{public String getName(){return "中间件";};},
	PRODUCT{public String getName(){return "产品";};};
	
	public abstract String getName();
}
