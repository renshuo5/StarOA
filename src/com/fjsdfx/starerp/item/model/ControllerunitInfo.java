package com.fjsdfx.starerp.item.model;


public enum ControllerunitInfo{

	parallelport{public String getName(){return "并口";};},
	parportU{public String getName(){return "并+U";};},
	serialoparport{public String getName(){return "并口|串口";};},
	serialaparport{public String getName(){return "并口+串口";};},
	parportethpot{public String getName(){return "并口+网口";};},
	ip090k{public String getName(){return "IP090K（并口）";};},
	ip690k{public String getName(){return "IP690K（并口）";};};
	
	public abstract String getName();
}