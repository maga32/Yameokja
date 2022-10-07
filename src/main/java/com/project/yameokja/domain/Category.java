package com.project.yameokja.domain;

public class Category {
	private int categoryNo;
	private String categoryName;
	private int categoryOrder;


	public Category() {}


	public Category(int categoryNo, String categoryName, int categoryOrder) {
	
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
		this.categoryOrder = categoryOrder;
	}


	public int getCategoryNo() {
		return categoryNo;
	}


	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}


	public String getCategoryName() {
		return categoryName;
	}


	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}


	public int getCategoryOrder() {
		return categoryOrder;
	}


	public void setCategoryOrder(int categoryOrder) {
		this.categoryOrder = categoryOrder;
	}
	

	
}
