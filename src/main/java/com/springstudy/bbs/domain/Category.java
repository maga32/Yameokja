package com.springstudy.bbs.domain;

public class Category {
	private int cNo;
	private String cName;
	private int cOrder;
	

	public Category(int cNo, String cName, int cOrder) {
		this.cNo = cNo;
		this.cName = cName;
		this.cOrder = cOrder;
	}

	public Category() {}
	
	
	public int getcNo() {
		return cNo;
	}
	public void setcNo(int cNo) {
		this.cNo = cNo;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public int getcOrder() {
		return cOrder;
	}
	public void setcOrder(int cOrder) {
		this.cOrder = cOrder;
	}
	
}
