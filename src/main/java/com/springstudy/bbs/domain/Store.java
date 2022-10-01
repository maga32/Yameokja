package com.springstudy.bbs.domain;

public class Store {
	private int stNo;
	private String mbId;
	private String stName;
	private String stPhone;
	private String stLatitude;
	private String stLongitude;
	private int stReadCount;
	private String stFileMain;
	private String stFileMenu;
	private String stAddress;
	private int cNo;
	private int stReviewCount;
	private int stStar;
	private int stBookmarks;
	private String stTime;
	private String stDayOff;
	private String stParking;

	public Store() {}

	public Store(int stNo, String mbId, String stName, String stPhone, String stLatitude, String stLongitude, int stReadCount,
			String stFileMain, String stFileMenu, String stAddress, int cNo, int stReviewCount, int stStar, int stBookmarks,
			String stTime, String stDayOff, String stParking) {
		this.stNo = stNo;
		this.mbId = mbId;
		this.stName = stName;
		this.stPhone = stPhone;
		this.stLatitude = stLatitude;
		this.stLongitude = stLongitude;
		this.stReadCount = stReadCount;
		this.stFileMain = stFileMain;
		this.stFileMenu = stFileMenu;
		this.stAddress = stAddress;
		this.cNo = cNo;
		this.stReviewCount = stReviewCount;
		this.stStar = stStar;
		this.stBookmarks = stBookmarks;
		this.stTime = stTime;
		this.stDayOff = stDayOff;
		this.stParking = stParking;
	}
	
	public int getStNo() {
		return stNo;
	}
	public void setStNo(int stNo) {
		this.stNo = stNo;
	}
	public String getStName() {
		return stName;
	}
	public void setStName(String stName) {
		this.stName = stName;
	}
	public String getStPhone() {
		return stPhone;
	}
	public void setStPhone(String stPhone) {
		this.stPhone = stPhone;
	}
	public String getStLatitude() {
		return stLatitude;
	}
	public void setStLatitude(String stLatitude) {
		this.stLatitude = stLatitude;
	}
	public String getStLongitude() {
		return stLongitude;
	}
	public void setStLongitude(String stLongitude) {
		this.stLongitude = stLongitude;
	}
	public int getStReadCount() {
		return stReadCount;
	}
	public void setStReadCount(int stReadCount) {
		this.stReadCount = stReadCount;
	}
	public String getStFileMain() {
		return stFileMain;
	}
	public void setStFileMain(String stFileMain) {
		this.stFileMain = stFileMain;
	}
	public String getStFileMenu() {
		return stFileMenu;
	}
	public void setStFileMenu(String stFileMenu) {
		this.stFileMenu = stFileMenu;
	}
	public String getStAddress() {
		return stAddress;
	}
	public void setStAddress(String stAddress) {
		this.stAddress = stAddress;
	}
	public int getStReviewCount() {
		return stReviewCount;
	}
	public void setStReviewCount(int stReviewCount) {
		this.stReviewCount = stReviewCount;
	}
	public int getStStar() {
		return stStar;
	}
	public void setStStar(int stStar) {
		this.stStar = stStar;
	}
	public int getstBookmarks() {
		return stBookmarks;
	}
	public void setstBookmarks(int stBookmarks) {
		this.stBookmarks = stBookmarks;
	}
	public String getStTime() {
		return stTime;
	}
	public void setStTime(String stTime) {
		this.stTime = stTime;
	}
	public String getStDayOff() {
		return stDayOff;
	}
	public void setStDayOff(String stDayOff) {
		this.stDayOff = stDayOff;
	}
	public String getStParking() {
		return stParking;
	}
	public void setStParking(String stParking) {
		this.stParking = stParking;
	}

	public String getMbId() {
		return mbId;
	}

	public void setMbId(String mbId) {
		this.mbId = mbId;
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public int getStBookmarks() {
		return stBookmarks;
	}

	public void setStBookmarks(int stBookmarks) {
		this.stBookmarks = stBookmarks;
	}
	
}
