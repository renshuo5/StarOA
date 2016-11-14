package com.fjsdfx.starerp.item.dto;

import java.util.List;

import com.fjsdfx.starerp.item.model.ControllerunitInfo;
import com.fjsdfx.starerp.item.model.ItemRelation;
import com.fjsdfx.starerp.item.model.ItemType;

public class ItemTypeInfo {
	private Integer sitemid;
	private List<Integer> partids;
	private List<Integer> amounts;
	private List<ItemType> itemTypes;
	private List<ItemRelation> itemRelations;
	private List<Integer> isCons;
	private List<ControllerunitInfo> controllerunits;
	public List<Integer> getIsCons() {
		return isCons;
	}

	public void setIsCons(List<Integer> isCons) {
		this.isCons = isCons;
	}

	public List<ControllerunitInfo> getControllerunits() {
		return controllerunits;
	}

	public void setControllerunits(List<ControllerunitInfo> controllerunits) {
		this.controllerunits = controllerunits;
	}

	public List<ItemRelation> getItemRelations() {
		return itemRelations;
	}

	public void setItemRelations(List<ItemRelation> itemRelations) {
		this.itemRelations = itemRelations;
	}

	public List<ItemType> getItemTypes() {
		return itemTypes;
	}

	public void setItemTypes(List<ItemType> itemTypes) {
		this.itemTypes = itemTypes;
	}

	public List<Integer> getAmounts() {
		return amounts;
	}

	public void setAmounts(List<Integer> amounts) {
		this.amounts = amounts;
	}

	public List<Integer> getPartids() {
		return partids;
	}

	public void setPartids(List<Integer> partids) {
		this.partids = partids;
	}

	public Integer getSitemid() {
		return sitemid;
	}

	public void setSitemid(Integer sitemid) {
		this.sitemid = sitemid;
	}
}
