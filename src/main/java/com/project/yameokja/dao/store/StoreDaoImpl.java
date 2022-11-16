package com.project.yameokja.dao.store;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<Store> StoreList(int startRow, int categoryNo, int num, String keyword, String type ,String orderBy) {
		
		Map<String,Object> param = new HashMap<String, Object>();
		
		param.put("categoryNo", categoryNo);
		param.put("type", type);
		param.put("keyword", keyword);
		param.put("orderBy", orderBy);
		
		// 페이지 사이즈
		param.put("num", num);
		param.put("startRow", startRow);
		
		return sqlSession.selectList(NAME_SPACE + ".storeList", param);
	}
	
	// 가게 글 갯수
	@Override
	public int getStoreCount(String type, String keyword, int categoryNo) {

		Map<String, Object> param = new HashMap<String, Object>();
		param.put("type", type);
		param.put("keyword", keyword);
		param.put("categoryNo", categoryNo);
		
		return sqlSession.selectOne(NAME_SPACE + ".getStoreCount", param);
	}
	
	
	//가게 정보
	@Override
	public Store getStore(int storeNo) {
		return sqlSession.selectOne(NAME_SPACE + ".getStore", storeNo);
	}
	
	//가게 글쓰기
	@Override
	public void insertStore(Store store) {
		sqlSession.insert(NAME_SPACE + ".insertStore", store);
	}
	
	// 가게 정보 조회수 증가
	@Override
	public void addStoreReadCount(int storeNo) {
		sqlSession.update(NAME_SPACE + ".addStoreReadCount", storeNo);
	}
	
	// 가게 별점댓글 카운트 증가
	@Override
	public void addStoreReviewCount(int storeNo) {
		sqlSession.update(NAME_SPACE + ".addStoreReviewCount", storeNo);
	}
	
	// 가게 별점리뷰 카운트 감소
		@Override
		public void deleteStoreReviewCount(int storeNo) {
			sqlSession.update(NAME_SPACE + ".deleteStoreReviewCount", storeNo);
	}
	
	//가게 수정
	@Override
	public void updateStore(Store store) {
		sqlSession.update(NAME_SPACE + ".updateStore", store);
	}
	
	// 가게 삭제
	@Override
	public void deleteStore(Store store) {
		// TODO Auto-generated method stub
		
	}

	// 가게 즐겨찾기 추가
	@Override
	public void addBookmarks(int storeNo) {
		sqlSession.update(NAME_SPACE+".addBookmarks", storeNo);
	}
	
	// 가게 즐겨찾기 삭제
	@Override
	public void deleteBookmarks(int storeNo) {
		sqlSession.update(NAME_SPACE+".deleteBookmarks", storeNo);
	}
	
	

	
	
}
