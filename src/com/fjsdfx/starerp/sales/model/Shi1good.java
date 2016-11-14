package com.fjsdfx.starerp.sales.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;


import com.fjsdfx.starerp.item.model.Item;
import com.fjsdfx.starerp.item.model.ItemType;
@Entity
@Table(name="shi1good")
public class Shi1good implements Serializable{

	
	
	public String getShitime() {
		return shitime;
	}
	public void setShitime(String shitime) {
		this.shitime = shitime;
	}
	public String getShi1unit() {				
		return shi1unit;
	}
	public void setShi1unit(String shi1unit) {
		this.shi1unit = shi1unit;
	}
	public Integer getShi1no() {
		return shi1no;
	}
	public void setShi1no(Integer shi1no) {
		this.shi1no = shi1no;
	}
	@Id
	@GeneratedValue
	public Integer getShi1gid() {
		return shi1gid;
	}
	public void setShi1gid(Integer shi1gid) {
		this.shi1gid = shi1gid;
	}
	
	public String getShinote() {
		return shinote;
	}
	public void setShinote(String shinote) {
		this.shinote = shinote;
	}
	
	/**
	 * 遍批号
	 */
	private String shitime;
	
	/**
	 * 收获单位
	 */
	private String shi1unit;

	/**
	 * 数量
	 */
	private Integer shi1no;
	
	/**
	 *外协件发货物号（主键）
	 */
	private Integer shi1gid;

	/**
	 * 备注
	 */
	private String shinote;
	
	/**
	 * 外协件发货单号（外键）
	 */
	private Shippingnote1 shippingnote1;

	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="shi1id")
	public Shippingnote1 getShippingnote1() {
		return shippingnote1;
	}
	public void setShippingnote1(Shippingnote1 shippingnote1) {
		this.shippingnote1 = shippingnote1;
	}


	/**
	 * 型号规格（部品名称）
	 */
	private ItemType itemType;


	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="ite_id")
	public ItemType getItemType() {
		return itemType;
	}
	public void setItemType(ItemType itemType) {
		this.itemType = itemType;
	}
	/**
	 * 判断板卡是否填写的中间变量
	 */
  private String tax;

    public String getTax() {
	   return tax;
        }
    public void setTax(String tax) {
	 this.tax = tax;
   }

    /**
	 * 判断冷冲件是否填写的中间变量
	 */
    private String tas;

	public String getTas() {
		return tas;
	}
	public void setTas(String tas) {
		this.tas = tas;
	}
	
}