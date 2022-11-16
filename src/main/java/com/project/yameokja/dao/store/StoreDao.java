package com.project.yameokja.dao.store;

import java.util.List;

import com.project.yameokja.domain.Store;

public interface StoreDao {
	
	// 음식종류에 해당하는 가게 리스트
	public abstract List<Store> StoreList(int startRow, int categoryNo, int num, String keyword, String type, String orderBy);
	
	// 가게 글 갯수
	public int getStoreCount(String type, String keyword, int categoryNo); 
	
	// 가게 정보 상세
	public abstract Store getStore(int storeNo);
	
	// 가게 정보 작성
	public abstract void insertStore(Store store);
	
	// 가게 조회수 증가
	public void addStoreReadCount(int storeNo);
	
	// 가게에 작성된 별점리뷰 카운트 증가
	public void addStoreReviewCount(int storeNo);
	
	// 가게 별점리뷰 카운트 감소
	public void deleteStoreReviewCount(int storeNo);
		
	// 가게 정보 수정
	public abstract void updateStore(Store store);
	
	// 가게 정보 삭제
	public abstract void deleteStore(Store store);
	
	// 가게 즐겨찾기 추가
	public abstract void addBookmarks(int storeNo);
		
	// 가게 즐겨찾기 삭제
	public void deleteBookmarks(int storeNo);
}
