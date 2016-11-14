package com.fjsdfx.starerp.produce.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.persons.model.Department;
import com.fjsdfx.starerp.persons.model.Employee;

/**
 * 
 * @author CCK
 * 生产计划单
 */

@Entity
@Table(name="pro_schedule")
public class Pro_schedule implements Serializable{
	//计划单id
	private Integer prs_id;
	
	
	private Date cdate;
	//项目内容
	private String pcontent;
	
	private ItemType itemType;
	
	//生产数量
	private Integer pnumber;
	//备注
	private String pnote;
	
	private Prscheck prscheck;
	
	
	//单位
	private String punit;
	//审核
	@ManyToOne
	@JoinColumn(name="prc_id")
	public Prscheck getPrscheck() {
		return prscheck;
	}
	public void setPrscheck(Prscheck prscheck) {
		this.prscheck = prscheck;
	}
	public String getPunit() {
		return punit;
	}
	public void setPunit(String punit) {
		this.punit = punit;
	}
	@Id
	@GeneratedValue
	public Integer getPrs_id() {
		return prs_id;
	}
	public void setPrs_id(Integer prsId) {
		prs_id = prsId;
	}
	
	@Temporal(TemporalType.DATE)
	public Date getCdate() {
		return cdate;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}
	public String getPcontent() {
		return pcontent;
	}
	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}
	public Integer getPnumber() {
		return pnumber;
	}
	public void setPnumber(Integer pnumber) {
		this.pnumber = pnumber;
	}
	public String getPnote() {
		return pnote;
	}
	public void setPnote(String pnote) {
		this.pnote = pnote;
	}
	@ManyToOne
	@JoinColumn(name="ity_id")
	public ItemType getItemType() {
		return itemType;
	}
	public void setItemType(ItemType itemType) {
		this.itemType = itemType;
	}

	
}
