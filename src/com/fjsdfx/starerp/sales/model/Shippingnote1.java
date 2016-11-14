package com.fjsdfx.starerp.sales.model;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


import com.fjsdfx.starerp.item.model.Item;
import com.fjsdfx.starerp.persons.model.Employee;
import com.sun.org.apache.bcel.internal.generic.NEW;
@Entity
@Table(name="shippingnote1")
public class Shippingnote1 implements Serializable{

	private Set<Shi1good> shi1goods = new HashSet<Shi1good>();
	@OneToMany(mappedBy="shippingnote1",cascade={CascadeType.ALL})
	public Set<Shi1good> getShi1goods() {
		return shi1goods;
	}

	public void setShi1goods(Set<Shi1good> shi1goods) {
		this.shi1goods = shi1goods;
	}

	@Id
	@GeneratedValue
	public Integer getShi1id() {
		return shi1id;
	}

	public void setShi1id(Integer shi1Id) {
		shi1id = shi1Id;
	}

	public Integer getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(Integer empId) {
		emp_id = empId;
	}

	@Temporal(TemporalType.DATE)
	public Date getShi1date() {
		return shi1date;
	}

	public void setShi1date(Date shi1date) {
		this.shi1date = shi1date;
	}

	public String getShi1send() {
		return shi1send;
	}

	public void setShi1send(String shi1send) {
		this.shi1send = shi1send;
	}

	public String getShi1receive() {
		return shi1receive;
	}

	public void setShi1receive(String shi1receive) {
		this.shi1receive = shi1receive;
	}

	/**
	 * 发货单号
	 */
	private Integer shi1id;
	
	/**
	 * 员工号
	 */
	private Integer emp_id;
	
	/**
	 * 发货时间
	 */
	private Date shi1date;
	
	/**
	 * 发送
	 */
	private String shi1send ;
	
	/**
	 * 接受
	 */
	private String shi1receive;
	
	/**
	 * 填单人
	 */
	private Employee shiw;

	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="shiw")
	public Employee getShiw() {
		return shiw;
	}

	public void setShiw(Employee shiw) {
		this.shiw = shiw;
	}

	/**
	 * 用于判断发货物列表审核通过的临时变量
	 */
	private String goodlist;

	public String getGoodlist() {
		return goodlist;
	}

	public void setGoodlist(String goodlist) {
		this.goodlist = goodlist;
	}
	
	/**
	 * 用于判断是否提交发货单的临时变量
	 */
	private String sended;

	public String getSended() {
		return sended;
	}

	public void setSended(String sended) {
		this.sended = sended;
	}
	
	
}