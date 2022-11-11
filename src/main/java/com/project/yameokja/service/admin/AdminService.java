package com.project.yameokja.service.admin;

import java.util.List;
import java.util.Map;

import com.project.yameokja.domain.Category;
import com.project.yameokja.domain.Member;

public interface AdminService {
	
	// 회원관련 시작 -----------------------------------------------
	Map<String, Object> getMemberList(int page, String sort, String order, String searchBy, String keyword);

	void updateMemberLevel(String memberId, int memberLevel);
	// 회원관련 끝 -----------------------------------------------
	
	// 카테고리 관련 시작 -----------------------------------------------
	List<Category> categoryList(String type);

	void addCategory(String type, String categoryName);

	void deleteCategory(int categoryNo);

	void updateCategory(Category category);
	// 카테고리 관련 끝 -----------------------------------------------

}
