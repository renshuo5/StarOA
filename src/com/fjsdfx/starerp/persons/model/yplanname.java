package com.fjsdfx.starerp.persons.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Table;

/**
 * 年度计划培训表名
 * @author Administrator
 *
 */
@Entity
@Table(name="yplanname")
public class yplanname implements Serializable{

	/**
	 * 表名ID
	 */
	private int id;
	/**
	 * 表名
	 */
	private Date names;
	
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getNames() {
		return names;
	}
	public void setNames(Date names) {
		this.names = names;
	}
	
	
}
