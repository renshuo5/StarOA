package com.fjsdfx.starerp.menu.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;


//第二级菜单
@Entity
public class Menu implements Serializable{
	private Integer id;
	private String content;
	private MenuImage menuImage;
	private Nav nav;

	@ManyToOne
	public Nav getNav() {
		return nav;
	}

	public void setNav(Nav nav) {
		this.nav = nav;
	}

	public Menu(){}

	public Menu(String content) {
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

	@ManyToOne
	public MenuImage getMenuImage() {
		return menuImage;
	}

	public void setMenuImage(MenuImage menuImage) {
		this.menuImage = menuImage;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
