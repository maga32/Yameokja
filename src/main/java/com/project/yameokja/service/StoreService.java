package com.project.yameokja.service;

import java.util.List;

import com.project.yameokja.domain.Store;

public interface StoreService {
	
	// 가게 게시글 리스트를 읽어와 반환하는 메소드
	public abstract List<Store> storeList();
	
	// 가게 게시글 중 no에 해당하는 글을 읽어와 반환하는 메소드
	
}
