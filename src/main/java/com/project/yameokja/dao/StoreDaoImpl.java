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
	
	//가게 리스트
	@Override
	public List<Store> StoreList() {
		return sqlSession.selectList(NAME_SPACE + ".storeList");
	}
	
	//가게 정보
	@Override
	public Store getStoreInfo(int storeNo) {
		return sqlSession.selectOne(NAME_SPACE + ".getStore", storeNo);
	}

	// 가게 정보 리스트
	@Override
	public Store getStoreInfoList(int storeNo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	// 가게 정보 리스트 상세
	@Override
	public Store getStoreInfoListDetail(int storeNo) {
		// TODO Auto-generated method stub
		return null;
	}

	// 가게 정보 댓글
	@Override
	public Store getStoreInfoReply(int storeNo) {
		// TODO Auto-generated method stub
		return null;
	}

	//가게 글쓰기
	@Override
	public void insertStore(Store store) {
		if(store != null) {
			
			System.out.println("streDao : " + store.getStoreName());
		}
		sqlSession.insert(NAME_SPACE + ".insertStore", store);
	}

	@Override
	public void updateStore(Store store) {
		// TODO Auto-generated method stub
		
	}

}
