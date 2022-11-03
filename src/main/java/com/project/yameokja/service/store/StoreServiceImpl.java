package com.project.yameokja.service.store;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.yameokja.dao.store.StoreDao;
import com.project.yameokja.domain.Store;

@Service
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	private StoreDao StoreDao;

	public void setStoreDao(StoreDao storeDao) {
		this.StoreDao = storeDao;
	}

	@Override
	public List<Store> storeList(int categoryNo) {
		return StoreDao.StoreList(categoryNo);
	}
	
	@Override
	public List<Store> storeListAll() {
		return StoreDao.StoreListAll();
	}

	@Override
	public Store getStore(int storeNo) {
		return StoreDao.getStore(storeNo);
	}
	

	@Override
	public void insertStore(Store store) {
		StoreDao.insertStore(store);
	}

	@Override
	public void updateStore(Store store) {
		StoreDao.updateStore(store);
		
	}

	
}
