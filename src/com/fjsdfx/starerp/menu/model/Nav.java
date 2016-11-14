package com.fjsdfx.starerp.menu.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

//第一级菜单
@Entity
public class Nav implements Serializable{
	
	private Integer id;
	private String content;

	public Nav(String content) {
		this.content = content;
	}
	
	public Nav(){}


	public String getContent() {
		return content;
	}

	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setId(Integer id) {
		this.id = id;
	}

}
