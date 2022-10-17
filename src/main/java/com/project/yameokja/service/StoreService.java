package com.project.yameokja.service;

import java.util.List;

import com.project.yameokja.domain.Post;
import com.project.yameokja.domain.Store;

public interface StoreService {
	
	// 가게 리스트
	public abstract List<Store> storeList();

	// 가게 정보
	public abstract Store getStore(int storeNo);
	
	// 가게 정보 글쓰기
	public abstract void insertStore(Store store);
	
	// 가게 정보 수정
	public abstract void updateStore(Store store);
	
	// 가게 정보에서 리뷰 리스트
	public abstract List<Post> postList(int storeNo);
	
	// 가게 정보에서 리뷰 리스트 상세보기

	// 가게 정보에서 가게 댓글 불러오는 메소드
	
	
}
