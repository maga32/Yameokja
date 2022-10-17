package com.project.yameokja.dao;

import java.util.List;

import com.project.yameokja.domain.Store;

public interface StoreDao {
	
	// 가게 리스트 불러오는 메소드
	public abstract List<Store> StoreList();
	
	// 가게 정보
	public abstract Store getStoreInfo(int storeNo);
	
	// 가게 정보 작성
	public abstract void insertStore(Store store);
		
	// 가게 정보 수정
	public abstract void updateStore(Store store);
	
	// 가게 정보 리스트
	public abstract Store getStoreInfoList(int storeNo);
	
	// 가게 정보 리스트 상세
	public abstract Store getStoreInfoListDetail(int storeNo);
	
	// 가게 상세보기 - 댓글
	public abstract Store getStoreInfoReply(int storeNo);

	
	
}
