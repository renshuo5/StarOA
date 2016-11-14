package com.fjsdfx.starerp.persons.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fjsdfx.starerp.security.model.User;

/**
 * 收发信息
 * 
 */
@Entity
@Table(name="rasmessage")
public class Rasmessage implements Serializable{

	/**
	 * 收发ID
	 */
	private Integer id;
	
	/**
	 * 发信人
	 */
	private User sper;
	
	/**
	 * 收信人
	 * 
	 */
	private User rper;
	
	/**
	 * 标题
	 */
	private String title;
	
	/**
	 * 内容
	 */
	private String content;
	
	/**
	 * 状态   1表示看过，，0表示没看过
	 */
	private String rasstatus;
	
	/**
	 * 收发时间
	 */
	private Date rastime;
	
	/**
	 * 附件
	 */
	private String accessories;
	
	private String fla1;
	
	/**
	 * 
	 * 收到信息的人的逻辑删除判断字段，默认是0未删除，1表示已经删除
	 * @return
	 */
	private String fla3;

	/**
	 * 发送信息的人的逻辑删除判断字段，默认是0表示未删除，1表示已经删除
	 */
	private String fla2;


	@Id
	@GeneratedValue
	@JoinColumn(name="rassid")
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(cascade=CascadeType.PERSIST.MERGE)
	@JoinColumn(name="sper",nullable=false)
	public User getSper() {
		return sper;
	}

	public void setSper(User sper) {
		this.sper = sper;
	}

	@ManyToOne(cascade=CascadeType.PERSIST.MERGE)
	@JoinColumn(name="rper",nullable=false)
	public User getRper() {
		return rper;
	}

	public void setRper(User rper) {
		this.rper = rper;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRasstatus() {
		return rasstatus;
	}

	public void setRasstatus(String rasstatus) {
		this.rasstatus = rasstatus;
	}

	public Date getRastime() {
		return rastime;
	}

	public void setRastime(Date rastime) {
		this.rastime = rastime;
	}

	
	public String getAccessories() {
		return accessories;
	}

	public void setAccessories(String accessories) {
		this.accessories = accessories;
	}


	@Column(columnDefinition="varchar(255) default '0' ")
	public String getFla2() {
		return fla2;
	}

	public void setFla2(String fla2) {
		this.fla2 = fla2;
	}

	public String getFla1() {
		return fla1;
	}

	public void setFla1(String fla1) {
		this.fla1 = fla1;
	}



	@Column(columnDefinition="varchar(255) default '0' ")
		public String getFla3() {
		return fla3;
	}

	public void setFla3(String fla3) {
		this.fla3 = fla3;
	}
	

}
