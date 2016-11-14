package com.fjsdfx.starerp.item.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;


/**
 * 控制器
 * @author CCK
 *
 */
@Entity
public class Controllerunit implements Serializable{
	/**
	 * id
	 */
	private Integer id;
	/**
	 * 并口
	 */
	private String parallelport;
	/**
	 * 并+U
	 */
	private String parportU;
	/**
	 * 并口|串口
	 */
	private String serialoparport;
	/**
	 * 并口+串口
	 */
	private String serialaparport;
	/**
	 * 并口+网口
	 */
	private String parportethpot;
	/**
	 * IP090K（并口）
	 */
	private String ip090k;
	/**
	 * IP690K（并口）
	 */
	private String ip690k;
	/**
	 * 对应的部品集合
	 */
	private Set<ItemType> itemTypes = new HashSet<ItemType>();
	@Id  
    @Column(name = "id", nullable = false, unique = true)   
    @GeneratedValue
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getParallelport() {
		return parallelport;
	}
	public void setParallelport(String parallelport) {
		this.parallelport = parallelport;
	}
	public String getParportU() {
		return parportU;
	}
	public void setParportU(String parportU) {
		this.parportU = parportU;
	}
	public String getSerialoparport() {
		return serialoparport;
	}
	public void setSerialoparport(String serialoparport) {
		this.serialoparport = serialoparport;
	}
	public String getSerialaparport() {
		return serialaparport;
	}
	public void setSerialaparport(String serialaparport) {
		this.serialaparport = serialaparport;
	}
	public String getParportethpot() {
		return parportethpot;
	}
	public void setParportethpot(String parportethpot) {
		this.parportethpot = parportethpot;
	}
	public String getIp090k() {
		return ip090k;
	}
	public void setIp090k(String ip090k) {
		this.ip090k = ip090k;
	}
	public String getIp690k() {
		return ip690k;
	}
	public void setIp690k(String ip690k) {
		this.ip690k = ip690k;
	}
	@ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE }, fetch = FetchType.LAZY, mappedBy="controllerunits")
	public Set<ItemType> getItemTypes() {
		return itemTypes;
	}
	public void setItemTypes(Set<ItemType> itemTypes) {
		this.itemTypes = itemTypes;
	}
	
}