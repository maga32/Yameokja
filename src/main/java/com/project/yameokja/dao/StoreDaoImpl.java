package com.project.yameokja.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.yameokja.domain.Store;

@Repository
public class StoreDaoImpl implements StoreDao {
	
	// 네임 스페이스
	private final String NAME_SPACE = "com.project.mappers.StoreMapper";
	
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<Store> StoreList() {
		
		return sqlSession.selectList(NAME_SPACE + ".storeList");
	}
	
	@Override
	public Store getStore(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertStore(Store Store) {
		// TODO Auto-generated method stub

	}

}
