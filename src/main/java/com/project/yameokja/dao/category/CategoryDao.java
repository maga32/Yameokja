package com.project.yameokja.dao.category;

import java.util.List;

import com.project.yameokja.domain.Category;

public interface CategoryDao {

	List<Category> categoryList(String type);

	Integer getLastNo(String type);

	Integer getLastOrder(String type);

	void addCategory(Category newCategory);

	void deleteCategory(int categoryNo);

	void updateCategory(Category category);

	Category getCategory(int categoryNo);

}
