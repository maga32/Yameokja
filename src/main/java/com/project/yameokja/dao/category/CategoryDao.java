package com.project.yameokja.dao.category;

import java.util.List;

import com.project.yameokja.domain.Category;

public interface CategoryDao {

	List<Category> categoryList(String type);

	int getLastNo(String type);

	int getLastOrder(String type);

	void addCategory(Category newCategory);

	void deleteCategory(int categoryNo);

}
