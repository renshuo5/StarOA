package com.fjsdfx.starerp.purchase.model;

import java.io.Serializable;
import java.sql.Date;
import java.util.HashSet;
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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fjsdfx.starerp.warehouse.model.Auxmaterial;
import com.fjsdfx.starerp.warehouse.model.Feedexamine;
import com.sun.org.apache.bcel.internal.generic.NEW;

@Entity
@Table(name="quaprolist")
public class Quaprolist implements Serializable{
	private Set<Auxmaterial> auxmaterials = new HashSet<Auxmaterial>();
	@OneToMany(mappedBy="quaprolist",cascade={CascadeType.ALL})
	public Set<Auxmaterial> getAuxmaterials() {
		return auxmaterials;
	}
	public void setAuxmaterials(Set<Auxmaterial> auxmaterials) {
		this.auxmaterials = auxmaterials;
	}
	private Set<Spare> spares = new HashSet<Spare>();
	@OneToMany(mappedBy="quaprolist",cascade={CascadeType.ALL})
	public Set<Spare> getSpares() {
		return spares;
	}
	public void setSpares(Set<Spare> spares) {
		this.spares = spares;
	}
	private Set<Requisitions> requisitions = new HashSet<Requisitions>();
	@OneToMany(mappedBy="quaprolist",cascade={CascadeType.ALL})
	public Set<Requisitions> getRequisitions() {
		return requisitions;
	}
	public void setRequisitions(Set<Requisitions> requisitions) {
		this.requisitions = requisitions;
	}
	private Set<Purorder> purorders = new HashSet<Purorder>();
	@OneToMany(mappedBy="quaprolist",cascade={CascadeType.ALL})
	public Set<Purorder> getPurorders() {
		return purorders;
	}
	public void setPurorders(Set<Purorder> purorders) {
		this.purorders = purorders;
	}
	private Set<Feedexamine> feedexamines = new HashSet<Feedexamine>();
	@OneToMany(mappedBy="supplier",cascade={CascadeType.ALL})
	public Set<Feedexamine> getFeedexamines() {
		return feedexamines;
	}
	public void setFeedexamines(Set<Feedexamine> feedexamines) {
		this.feedexamines = feedexamines;
	}
	/**
	 * ID
	 */
	private Integer id;
	/**
	 * 供方资料
	 */
	private Supplierinfo supplierinfo;
	/**
	 * 品牌
	 */
	private  String brand;
	/**
	 * 考核级别
	 */
	private  Asslevel asslevel;
	/**
	 * 备注
	 */
	private  String note;
	
	private Date time;
	
	
	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@OneToOne(cascade=CascadeType.REFRESH)
	public Supplierinfo getSupplierinfo() {
		return supplierinfo;
	} 
	public void setSupplierinfo(Supplierinfo supplierinfo) {
		this.supplierinfo = supplierinfo;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	@Enumerated(EnumType.STRING)
	@Column(name="quaprolist_asslevel")
	public Asslevel getAsslevel() {
		return asslevel;
	}
	public void setAsslevel(Asslevel asslevel) {
		this.asslevel = asslevel;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}

}
