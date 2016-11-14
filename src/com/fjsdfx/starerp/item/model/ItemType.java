package com.fjsdfx.starerp.item.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.fjsdfx.starerp.purchase.model.Purgood;
import com.fjsdfx.starerp.purchase.model.Resgood;
import com.fjsdfx.starerp.purchase.model.Samidentified;
import com.fjsdfx.starerp.sales.model.Qualityanalysis;
import com.fjsdfx.starerp.sales.model.Retgood;
import com.fjsdfx.starerp.sales.model.Rmtotal;
import com.fjsdfx.starerp.sales.model.Shi1good;
import com.fjsdfx.starerp.sales.model.Shi2good;
import com.fjsdfx.starerp.sales.model.Taxboard;
import com.fjsdfx.starerp.sales.model.Taxstampingparts;
import com.fjsdfx.starerp.sales.model.Unqualified;
import com.fjsdfx.starerp.warehouse.model.Feegood;
import com.fjsdfx.starerp.warehouse.model.Inventory;
import com.fjsdfx.starerp.warehouse.model.Maccounting;
import com.fjsdfx.starerp.warehouse.model.Picgood;
import com.fjsdfx.starerp.warehouse.model.Rewgood;
import com.fjsdfx.starerp.warehouse.model.Stock;
import com.fjsdfx.starerp.warehouse.model.Stoschgood;
import com.fjsdfx.starerp.warehouse.model.Supsendm;
import com.fjsdfx.starerp.warehouse.model.Supsendm3;
import com.fjsdfx.starerp.warehouse.model.Susgood;
import com.fjsdfx.starerp.warehouse.model.Susgood3;
import com.fjsdfx.starerp.warehouse.model.Vargood;
import com.fjsdfx.starerp.warehouse.model.Warehouse;

import org.omg.CORBA.PRIVATE_MEMBER;

import com.fjsdfx.starerp.produce.model.Dailyproduction;
import com.fjsdfx.starerp.produce.model.Discardproduction;
import com.fjsdfx.starerp.produce.model.Discardverify;
import com.fjsdfx.starerp.produce.model.Pergood;
import com.fjsdfx.starerp.produce.model.Pro_schedule;
import com.fjsdfx.starerp.produce.model.ProductionSchdul;
import com.fjsdfx.starerp.produce.model.Shogood;
import com.fjsdfx.starerp.produce.model.Trackingtest;
import com.sun.org.apache.bcel.internal.generic.NEW;



/**
 * @author Chen_Luqiang
 * 品名规格
 */
@Entity
public class ItemType implements Serializable{
	private Set<Samidentified> samidentifieds = new HashSet<Samidentified>();
	@OneToMany(mappedBy="itemtype",cascade={CascadeType.ALL})
	public Set<Samidentified> getSamidentifieds() {
		return samidentifieds;
	}
	public void setSamidentifieds(Set<Samidentified> samidentifieds) {
		this.samidentifieds = samidentifieds;
	}
	private Set<Resgood> resgoods = new HashSet<Resgood>();
	@OneToMany(mappedBy="itemtype",cascade={CascadeType.ALL})
	public Set<Resgood> getResgoods() {
		return resgoods;
	}
	public void setResgoods(Set<Resgood> resgoods) {
		this.resgoods = resgoods;
	}
	private Set<Purgood> purgoods = new HashSet<Purgood>();
	@OneToMany(mappedBy="itemtype",cascade={CascadeType.ALL})
	public Set<Purgood> getPurgoods() {
		return purgoods;
	}
	public void setPurgoods(Set<Purgood> purgoods) {
		this.purgoods = purgoods;
	}
	private Set<Unqualified> unqualifieds = new HashSet<Unqualified>();
	@OneToMany(mappedBy="itemType",cascade={CascadeType.ALL})
	public Set<Unqualified> getUnqualifieds() {
		return unqualifieds;
	}
	public void setUnqualifieds(Set<Unqualified> unqualifieds) {
		this.unqualifieds = unqualifieds;
	}
	private Set<Taxstampingparts> taxstampingparts = new HashSet<Taxstampingparts>();
	@OneToMany(mappedBy="itemType",cascade={CascadeType.ALL})
	public Set<Taxstampingparts> getTaxstampingparts() {
		return taxstampingparts;
	}
	public void setTaxstampingparts(Set<Taxstampingparts> taxstampingparts) {
		this.taxstampingparts = taxstampingparts;
	}
	private Set<Taxboard> taxboards = new HashSet<Taxboard>();
	@OneToMany(mappedBy="itemType",cascade={CascadeType.ALL})
	public Set<Taxboard> getTaxboards() {
		return taxboards;
	}
	public void setTaxboards(Set<Taxboard> taxboards) {
		this.taxboards = taxboards;
	}
	private Set<Shi2good> shi2goods = new HashSet<Shi2good>();
	@OneToMany(mappedBy="itemType",cascade={CascadeType.ALL})
	public Set<Shi2good> getShi2goods() {
		return shi2goods;
	}
	public void setShi2goods(Set<Shi2good> shi2goods) {
		this.shi2goods = shi2goods;
	}
	private Set<Shi1good> shi1goods = new HashSet<Shi1good>();
	@OneToMany(mappedBy="itemType",cascade={CascadeType.ALL})
	public Set<Shi1good> getShi1goods() {
		return shi1goods;
	}
	public void setShi1goods(Set<Shi1good> shi1goods) {
		this.shi1goods = shi1goods;
	}
	private Set<Rmtotal> rmtotals = new HashSet<Rmtotal>();
	@OneToMany(mappedBy="itemType",cascade={CascadeType.ALL})
	public Set<Rmtotal> getRmtotals() {
		return rmtotals;
	}
	public void setRmtotals(Set<Rmtotal> rmtotals) {
		this.rmtotals = rmtotals;
	}
	private Set<Rewgood> rewgoods = new HashSet<Rewgood>();
	@OneToMany(mappedBy="itemType",cascade={CascadeType.ALL})
	public Set<Rewgood> getRewgoods() {
		return rewgoods;
	}
	public void setRewgoods(Set<Rewgood> rewgoods) {
		this.rewgoods = rewgoods;
	}
	private Set<Qualityanalysis> qualityanalysis = new HashSet<Qualityanalysis>();
	@OneToMany(mappedBy="itemType",cascade={CascadeType.ALL})
	public Set<Qualityanalysis> getQualityanalysis() {
		return qualityanalysis;
	}
	public void setQualityanalysis(Set<Qualityanalysis> qualityanalysis) {
		this.qualityanalysis = qualityanalysis;
	}
	private Set<Feegood> feegoods= new HashSet<Feegood>();
	@OneToMany(mappedBy="itemType",cascade={CascadeType.ALL})
	public Set<Feegood> getFeegoods() {
		return feegoods;
	}
	public void setFeegoods(Set<Feegood> feegoods) {
		this.feegoods = feegoods;
	}
	private Set<Inventory> inventories = new HashSet<Inventory>();
	@OneToMany(mappedBy="itemType",cascade={CascadeType.ALL})
	public Set<Inventory> getInventories() {
		return inventories;
	}
	public void setInventories(Set<Inventory> inventories) {
		this.inventories = inventories;
	}
	private Set<Maccounting> maccountings = new HashSet<Maccounting>();
	@OneToMany(mappedBy="itemType",cascade={CascadeType.ALL})
	public Set<Maccounting> getMaccountings() {
		return maccountings;
	}
	public void setMaccountings(Set<Maccounting> maccountings) {
		this.maccountings = maccountings;
	}
	private Set<Picgood> picgoods = new HashSet<Picgood>();
	@OneToMany(mappedBy="itemType",cascade={CascadeType.ALL})
	public Set<Picgood> getPicgoods() {
		return picgoods;
	}
	public void setPicgoods(Set<Picgood> picgoods) {
		this.picgoods = picgoods;
	}
	private Set<Retgood> retgoods = new HashSet<Retgood>();
	@OneToMany(mappedBy="itemType",cascade={CascadeType.ALL})
	public Set<Retgood> getRetgoods() {
		return retgoods;
	}
	public void setRetgoods(Set<Retgood> retgoods) {
		this.retgoods = retgoods;
	}
	private Set<Stock> stocks = new HashSet<Stock>();
	@OneToMany(mappedBy="itemType",cascade={CascadeType.ALL})
	public Set<Stock> getStocks() {
		return stocks;
	}
	public void setStocks(Set<Stock> stocks) {
		this.stocks = stocks;
	}
	private Set<Stoschgood> stoschgoods = new HashSet<Stoschgood>();
	@OneToMany(mappedBy="itemType",cascade={CascadeType.ALL})
	public Set<Stoschgood> getStoschgoods() {
		return stoschgoods;
	}
	public void setStoschgoods(Set<Stoschgood> stoschgoods) {
		this.stoschgoods = stoschgoods;
	}
	private Set<Supsendm> supsendms = new HashSet<Supsendm>();
	@OneToMany(mappedBy="itemType",cascade={CascadeType.ALL})
	public Set<Supsendm> getSupsendms() {
		return supsendms;
	}
	public void setSupsendms(Set<Supsendm> supsendms) {
		this.supsendms = supsendms;
	}
	private Set<Supsendm3> supsendm3s = new HashSet<Supsendm3>();
	@OneToMany(mappedBy="itemType",cascade={CascadeType.ALL})
	public Set<Supsendm3> getSupsendm3s() {
		return supsendm3s;
	}
	public void setSupsendm3s(Set<Supsendm3> supsendm3s) {
		this.supsendm3s = supsendm3s;
	}
	private Set<Susgood> susgoods = new HashSet<Susgood>();
	@OneToMany(mappedBy="itemType",cascade={CascadeType.ALL})
	public Set<Susgood> getSusgoods() {
		return susgoods;
	}
	public void setSusgoods(Set<Susgood> susgoods) {
		this.susgoods = susgoods;
	}
	private Set<Susgood3> susgood3s = new HashSet<Susgood3>();
	@OneToMany(mappedBy="itemType",cascade={CascadeType.ALL})
	public Set<Susgood3> getSusgood3s() {
		return susgood3s;
	}
	public void setSusgood3s(Set<Susgood3> susgood3s) {
		this.susgood3s = susgood3s;
	}
	private Set<Vargood> vargoods = new HashSet<Vargood>();
	@OneToMany(mappedBy="itemType",cascade={CascadeType.ALL})
	public Set<Vargood> getVargoods() {
		return vargoods;
	}
	public void setVargoods(Set<Vargood> vargoods) {
		this.vargoods = vargoods;
	}
	private Set<Warehouse> warehouses = new HashSet<Warehouse>();
	@OneToMany(mappedBy="itemType",cascade={CascadeType.ALL})
	public Set<Warehouse> getWarehouses() {
		return warehouses;
	}
	public void setWarehouses(Set<Warehouse> warehouses) {
		this.warehouses = warehouses;
	}
	private Set<Discardverify> discardverifies=new HashSet<Discardverify>();
	@OneToMany(mappedBy="itemType",cascade={CascadeType.ALL})
	public Set<Discardverify> getDiscardverifies() {
		return discardverifies;
	}

	public void setDiscardverifies(Set<Discardverify> discardverifies) {
		this.discardverifies = discardverifies;
	}

	private Set<Pergood> pergoods=new HashSet<Pergood>();
	@OneToMany(mappedBy="itemType",cascade={CascadeType.ALL})
	public Set<Pergood> getPergoods() {
		return pergoods;
	}

	public void setPergoods(Set<Pergood> pergoods) {
		this.pergoods = pergoods;
	}

	private Set<Pro_schedule> proSchedules=new HashSet<Pro_schedule>();
	@OneToMany(mappedBy="itemType",cascade={CascadeType.ALL})
	public Set<Pro_schedule> getProSchedules() {
		return proSchedules;
	}

	public void setProSchedules(Set<Pro_schedule> proSchedules) {
		this.proSchedules = proSchedules;
	}

	private Set<ProductionSchdul> productionSchduls2=new HashSet<ProductionSchdul>();
	@OneToMany(mappedBy="itemType2",cascade={CascadeType.ALL})
	public Set<ProductionSchdul> getProductionSchduls2() {
		return productionSchduls2;
	}

	public void setProductionSchduls2(Set<ProductionSchdul> productionSchduls2) {
		this.productionSchduls2 = productionSchduls2;
	}

	private Set<ProductionSchdul> productionSchduls=new HashSet<ProductionSchdul>();
	@OneToMany(mappedBy="itemType",cascade={CascadeType.ALL})
	public Set<ProductionSchdul> getProductionSchduls() {
		return productionSchduls;
	}

	public void setProductionSchduls(Set<ProductionSchdul> productionSchduls) {
		this.productionSchduls = productionSchduls;
	}

	private Set<Shogood> shogoods=new HashSet<Shogood>();
	
	@OneToMany(mappedBy="itemType",cascade={CascadeType.ALL})
	public Set<Shogood> getShogoods() {
		return shogoods;
	}

	public void setShogoods(Set<Shogood> shogoods) {
		this.shogoods = shogoods;
	}

	private Set<Trackingtest> trackingtests=new HashSet<Trackingtest>();
	@OneToMany(mappedBy="itemType",cascade={CascadeType.ALL})
	public Set<Trackingtest> getTrackingtests() {
		return trackingtests;
	}

	public void setTrackingtests(Set<Trackingtest> trackingtests) {
		this.trackingtests = trackingtests;
	}

	private Set<Discardproduction> discardproductions = new HashSet<Discardproduction>();
	
	
	@OneToMany(mappedBy="ite_id",cascade={CascadeType.ALL})
	public Set<Discardproduction> getDiscardproductions() {
		return discardproductions;
	}

	public void setDiscardproductions(Set<Discardproduction> discardproductions) {
		this.discardproductions = discardproductions;
	}

	private Set<Dailyproduction> dailyproductions = new HashSet<Dailyproduction>();
	@OneToMany(mappedBy="itemType",cascade={CascadeType.ALL})
	public Set<Dailyproduction> getDailyproductions() {
		return dailyproductions;
	}

	public void setDailyproductions(Set<Dailyproduction> dailyproductions) {
		this.dailyproductions = dailyproductions;
	}

	private Set<ItemRelation> itemRelations2 = new HashSet<ItemRelation>();
	@OneToMany(mappedBy="pitem",cascade={CascadeType.ALL})
	public Set<ItemRelation> getItemRelations2() {
		return itemRelations2;
	}

	public void setItemRelations2(Set<ItemRelation> itemRelations2) {
		this.itemRelations2 = itemRelations2;
	}

	private Set<ItemRelation> itemRelations = new HashSet<ItemRelation>();

	@OneToMany(mappedBy="part",cascade={CascadeType.MERGE,CascadeType.REMOVE})
	public Set<ItemRelation> getItemRelations() {
		return itemRelations;
	}

	public void setItemRelations(Set<ItemRelation> itemRelations) {
		this.itemRelations = itemRelations;
	}
	/**
	 * 保税号
	 */
	private Integer bondedNo;
	/**
	 * 简介
	 */
	private String description;
	/**
	 * id
	 */
	private Integer id;
	/**
	 * 是否保税
	 */
	private Integer isbonded;
	/**
	 * 部品id
	 */
	private Item item;
	/**
	 * 材料代码
	 */
	private String mCode;
	/**
	 * 规格型号
	 */
	private String name;
	/**
	 * 备注
	 */
	private String notes;
	/**
	 * 是否添加控制器
	 */
	private Integer isCon;
	/**
	 * 控制器信息
	 * */
	private Set<Controllerunit> controllerunits = new HashSet<Controllerunit>();

	public Integer getBondedNo() {
		return bondedNo;
	}
	public String getDescription() {
		return description;
	}
	
	public Integer getIsCon() {
		return isCon;
	}
	public void setIsCon(Integer isCon) {
		this.isCon = isCon;
	}
	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	public Integer getIsbonded() {
		return isbonded;
	}
	@ManyToOne
	@JoinColumn(name="ite_id")
	public Item getItem() {
		return item;
	}
	public String getmCode() {
		return mCode;
	}
	@Column(nullable=false)
	public String getName() {
		return name;
	}
	public String getNotes() {
		return notes;
	}
	public void setBondedNo(Integer bondedNo) {
		this.bondedNo = bondedNo;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public void setIsbonded(Integer isbonded) {
		this.isbonded = isbonded;
	}
	public void setItem(Item item) {
		this.item = item;
	}
	public void setmCode(String mCode) {
		this.mCode = mCode;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	@ManyToMany(cascade = { CascadeType.PERSIST, CascadeType.MERGE })   
    @JoinTable(name = "itemtype_controllerunit", joinColumns = { @JoinColumn(name = "con_id") }, inverseJoinColumns = { @JoinColumn(name = "ite_id") })  
	public Set<Controllerunit> getControllerunits() {
		return controllerunits;
	}
	public void setControllerunits(Set<Controllerunit> controllerunits) {
		this.controllerunits = controllerunits;
	}
	
}
