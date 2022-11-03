package com.project.yameokja.service.store;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.yameokja.dao.store.StoreDao;
import com.project.yameokja.domain.Store;

@Service
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	private StoreDao storeDao;

	@Override
	public List<Store> storeList(int categoryNo) {
		return storeDao.StoreList(categoryNo);
	}
	
	@Override
	public List<Store> storeListAll() {
		return storeDao.StoreListAll();
	}

	@Override
	public Store getStore(int storeNo) {
		return storeDao.getStore(storeNo);
	}
	

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
	
}
