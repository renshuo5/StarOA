package com.fjsdfx.starerp.item.model;

import java.io.Serializable;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.sun.org.apache.bcel.internal.generic.NEW;



/**
 * 
 * @author Chen_Luqiang
 *
 *组件类
 */
@Entity
public class Item implements Serializable{
	 private Set<ItemType> itemTypes=new HashSet<ItemType>();
	 
	 @OneToMany(mappedBy="item",cascade={CascadeType.ALL})
	public Set<ItemType> getItemTypes() {
		return itemTypes;
	}
	public void setItemTypes(Set<ItemType> itemTypes) {
		this.itemTypes = itemTypes;
	}
	/**
	 * 描述
	 */
	private String description;
	/**
	 * ID
	 */
	private Integer id;
	/**
	 * 种类（原料？中间件？产品？）
	 */
	private ItemCategory itemcategory;
	
	/**
	 * 部品名
	 */
	private String name;
	/**
	 * 备注
	 */
	private String notes;
	public String getDescription() {
		return description;
	}
	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	@Enumerated(EnumType.STRING)
	@Column(name="item_category")
	public ItemCategory getItemcategory() {
		return itemcategory;
	}
	public String getName() {
		return name;
	}
	public String getNotes() {
		return notes;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public void setItemcategory(ItemCategory itemcategory) {
		this.itemcategory = itemcategory;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
}
