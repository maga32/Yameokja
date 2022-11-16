package com.project.yameokja.service.store;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.yameokja.dao.store.StoreDao;
import com.project.yameokja.domain.Store;

@Service
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	private StoreDao storeDao;

	
	private static final int PAGE_SIZE = 10;
	private static final int PAGE_GROUP = 10;

	@Override
	public Map<String, Object> storeList(int categoryNo, int pageNum, String type, String keyword, String orderBy) {
		
		int currentPage = pageNum;
		
		int startRow = (currentPage - 1) * PAGE_SIZE;
		int listCount = 0;
		
		listCount = storeDao.getStoreCount(type, keyword, categoryNo);
		
		Map<String, Object> sMap =  new HashMap<String, Object>();
		
		if(listCount > 0) {
			
			List<Store> sList = storeDao.StoreList(startRow, categoryNo, PAGE_SIZE, keyword, type, orderBy);
			
			int pageCount = listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0 ? 0 : 1);
			
			int startPage = currentPage / PAGE_GROUP * PAGE_GROUP - 
					(currentPage % PAGE_GROUP == 0? PAGE_GROUP : 0) + 1;
			
			
			int endPage = startPage + 9;
			
				if(endPage > pageCount) endPage = pageCount;
				
				sMap.put("sList", sList);
				
				sMap.put("pageCount", pageCount);
				sMap.put("startPage", startPage);
				sMap.put("endPage", endPage);
				
				sMap.put("currentPage", currentPage);
				sMap.put("listCount", listCount);
				sMap.put("pageGroup", PAGE_GROUP);
				
				return sMap;
		}
		
		return sMap;
	}

	@Override
	public Store getStore(int storeNo) {
		return storeDao.getStore(storeNo);
	}
	
	// 글쓰기 서비스
	@Override
	public void insertStore(Store store) {
		storeDao.insertStore(store);
	}

	@Override
	public void updateStore(Store store) {
		storeDao.updateStore(store);
		
	}
	
	// 가게 즐겨찾기 추가
	@Override
	public void addBookmarks(int storeNo) {
		storeDao.addBookmarks(storeNo);
	}
	
	// 가게 즐겨찾기 삭제
	@Override
	public void deleteBookmarks(int storeNo) {
		storeDao.deleteBookmarks(storeNo);
	}
	
	// 가게글 조회수 증가
	@Override
	public void addStoreReadCount(int storeNo) {
		storeDao.addStoreReadCount(storeNo);
	}
	
	// 가게 별점댓글 수 증가
	@Override
	public void addStoreReviewCount(int storeNo) {
		storeDao.addStoreReviewCount(storeNo);
	}
	// 가게 별점댓글 수 감소
	@Override
	public void deleteStoreReviewCount(int storeNo) {
		storeDao.deleteStoreReviewCount(storeNo);
	}
	
}
