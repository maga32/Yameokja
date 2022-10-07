package com.project.yameokja.domain;

public class Store {
	private int storeNo;
	private String memberId;
	private String storeName;
	private String storePhone;
	private String storeLatitude;
	private String storeLongitude;
	private int storeReadCount;
	private String storeFileMain;
	private String storeFileMenu;
	private String storeAddress;
	private int categoryNo;
	private int storeReviewCount;
	private int storeStar;
	private int storeBookmarks;
	
	private String storeTime;
	private String storeDayOff;
	private String storeParking;

	public Store() {}

	public Store(int storeNo, String memberId, String storeName, String storePhone, String storeLatitude,
			String storeLongitude, int storeReadCount, String storeFileMain, String storeFileMenu, String storeAddress,
			int categoryNo, int storeReviewCount, int storeStar, int storeBookmarks, String storeTime,
			String storeDayOff, String storeParking) {
		
		this.storeNo = storeNo;
		this.memberId = memberId;
		this.storeName = storeName;
		this.storePhone = storePhone;
		this.storeLatitude = storeLatitude;
		this.storeLongitude = storeLongitude;
		this.storeReadCount = storeReadCount;
		this.storeFileMain = storeFileMain;
		this.storeFileMenu = storeFileMenu;
		this.storeAddress = storeAddress;
		this.categoryNo = categoryNo;
		this.storeReviewCount = storeReviewCount;
		this.storeStar = storeStar;
		this.storeBookmarks = storeBookmarks;
		this.storeTime = storeTime;
		this.storeDayOff = storeDayOff;
		this.storeParking = storeParking;
	}

	public int getStoreNo() {
		return storeNo;
	}

	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getStorePhone() {
		return storePhone;
	}

	public void setStorePhone(String storePhone) {
		this.storePhone = storePhone;
	}

	public String getStoreLatitude() {
		return storeLatitude;
	}

	public void setStoreLatitude(String storeLatitude) {
		this.storeLatitude = storeLatitude;
	}

	public String getStoreLongitude() {
		return storeLongitude;
	}

	public void setStoreLongitude(String storeLongitude) {
		this.storeLongitude = storeLongitude;
	}

	public int getStoreReadCount() {
		return storeReadCount;
	}

	public void setStoreReadCount(int storeReadCount) {
		this.storeReadCount = storeReadCount;
	}

	public String getStoreFileMain() {
		return storeFileMain;
	}

	public void setStoreFileMain(String storeFileMain) {
		this.storeFileMain = storeFileMain;
	}

	public String getStoreFileMenu() {
		return storeFileMenu;
	}

	public void setStoreFileMenu(String storeFileMenu) {
		this.storeFileMenu = storeFileMenu;
	}

	public String getStoreAddress() {
		return storeAddress;
	}

	public void setStoreAddress(String storeAddress) {
		this.storeAddress = storeAddress;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public int getStoreReviewCount() {
		return storeReviewCount;
	}

	public void setStoreReviewCount(int storeReviewCount) {
		this.storeReviewCount = storeReviewCount;
	}

	public int getStoreStar() {
		return storeStar;
	}

	public void setStoreStar(int storeStar) {
		this.storeStar = storeStar;
	}

	public int getStoreBookmarks() {
		return storeBookmarks;
	}

	public void setStoreBookmarks(int storeBookmarks) {
		this.storeBookmarks = storeBookmarks;
	}

	public String getStoreTime() {
		return storeTime;
	}

	public void setStoreTime(String storeTime) {
		this.storeTime = storeTime;
	}

	public String getStoreDayOff() {
		return storeDayOff;
	}

	public void setStoreDayOff(String storeDayOff) {
		this.storeDayOff = storeDayOff;
	}

	public String getStoreParking() {
		return storeParking;
	}

	public void setStoreParking(String storeParking) {
		this.storeParking = storeParking;
	}

	}
