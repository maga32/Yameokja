package com.project.yameokja.service.store;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.yameokja.dao.store.StoreDao;
import com.project.yameokja.domain.Post;
import com.project.yameokja.domain.Store;

@Service
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	private StoreDao StoreDao;
	
	public void setStoreDao(StoreDao StoreDao) {
		this.StoreDao = StoreDao;
	}

	@Override
	public List<Store> storeList() {
		return StoreDao.StoreList();
	}

	
	@Override
	public Store getStore(int storeNo) {
		return StoreDao.getStoreInfo(storeNo);
	}

	@Override
	public List<Post> postList(int storeNo, int postNo) {
		return PostDao.get;
	}
	
	@Override
	public void insertStore(Store store) {
		StoreDao.insertStore(store);
	}

	@Override
	public void updateStore(Store store) {
		// TODO Auto-generated method stub
		
	}
}
