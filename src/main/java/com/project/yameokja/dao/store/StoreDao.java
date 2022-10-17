package com.project.yameokja.dao.store;

import java.util.List;

import com.project.yameokja.domain.Store;

public interface StoreDao {
	
	// 가게 리스트 불러오는 메소드
	public abstract List<Store> StoreList();
	
	// 가게 정보 상세
	public abstract Store getStore(int storeNo);
	
	// 가게 정보 작성
	public abstract void insertStore(Store store);
		
	// 가게 정보 수정
	public abstract void updateStore(Store store);
	
	
}
