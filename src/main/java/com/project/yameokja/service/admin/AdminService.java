package com.project.yameokja.service.admin;

import java.util.List;

import com.project.yameokja.domain.Category;

public interface AdminService {

	List<Category> categoryList(String type);

	void addCategory(String type, String categoryName);

	void deleteCategory(int categoryNo);

	void updateCategory(Category category);

}
