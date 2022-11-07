package com.project.yameokja.service.store;

import java.util.List;
import java.util.Map;

import com.project.yameokja.domain.Store;

public interface StoreService {
	
	// 가게 리스트
	public Map<String, Object> storeList(int categoryNo, int pageNum, String type, String keyword, String orderBy);

	// 가게 정보
	public abstract Store getStore(int storeNo);
	
	// 가게 정보 글쓰기
	public abstract void insertStore(Store store);
	
	// 가게 정보 수정
	public abstract void updateStore(Store store);

	// 가게 즐겨찾기 추가
	public void addBookmarks(int storeNo);
	
	// 가게 즐겨찾기 삭제
	public void deleteBookmarks(int storeNo);

}
