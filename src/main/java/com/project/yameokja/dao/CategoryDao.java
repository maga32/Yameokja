package com.project.yameokja.dao;

import java.util.List;

import com.project.yameokja.domain.Category;

public interface CategoryDao {

	List<Category> categoryList(String type);

}
