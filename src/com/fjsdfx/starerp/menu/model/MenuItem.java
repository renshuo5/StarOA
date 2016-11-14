package com.fjsdfx.starerp.menu.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

//第三级菜单，例如：质量控制--原料质检--审核  中的“审核”
@Entity
public class MenuItem implements Serializable
{
	//里面的内容
	private String content;
	private Integer id;
	private Menu menu;
//	private boolean isAllow;

	@ManyToOne
	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public MenuItem(){}
	
	public MenuItem(String content) {
		this.content = content;
	}

	public String getContent() {
		return content;
	}


	
//	public boolean isAllow() {
//		return isAllow;
//	}
//
//	public void setAllow(boolean isAllow) {
//		this.isAllow = isAllow;
//	}

	public void setContent(String content) {
		this.content = content;
	}


	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

}