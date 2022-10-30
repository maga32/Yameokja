package com.project.yameokja.dao.store;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.yameokja.domain.Store;

@Repository
public class StoreDaoImpl implements StoreDao {
	
	// 네임 스페이스
	private final String NAME_SPACE = "com.project.yameokja.mappers.StoreMapper";
	
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//가게 리스트
	@Override
	public List<Store> StoreList(int categoryNo) {
		return sqlSession.selectList(NAME_SPACE + ".storeList", categoryNo);
	}
	
	//가게 리스트 전부
	public List<Store> StoreListAll() {
		return sqlSession.selectList(NAME_SPACE + ".storeListAll");
	}
	
	//가게 정보
	@Override
	public Store getStore(int storeNo) {
		return sqlSession.selectOne(NAME_SPACE + ".getStore", storeNo);
	}
	
	//가게 글쓰기
	@Override
	public void insertStore(Store store) {
		if(store != null) {
			
			System.out.println("storeDao : " + store.getStoreName());
		}
		sqlSession.insert(NAME_SPACE + ".insertStore", store);
	}
	
	// 가게 정보 조회수 증가
	@Override
	public void addStoreReadCount(int storeNo) {
		sqlSession.update(NAME_SPACE + ".addStoreReadCount", storeNo);
		
	}
	
	
	//가게 수정
	@Override
	public void updateStore(Store store) {
		// TODO Auto-generated method stub
		
	}
	
	// 가게 삭제
	@Override
	public void deleteStore(Store store) {
		// TODO Auto-generated method stub
		
	}

	
	
}
