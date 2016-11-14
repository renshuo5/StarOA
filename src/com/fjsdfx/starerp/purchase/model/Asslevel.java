package com.fjsdfx.starerp.purchase.model;

public enum Asslevel {
	
	Alevel {public String getName(){return "A";};},
	Blevel{public String getName(){return "B";};},
	Clevel{public String getName(){return "C";};},
	Dlevel{public String getName(){return "D";};};
	public abstract String getName();
}
