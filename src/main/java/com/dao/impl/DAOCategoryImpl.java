package com.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.JPAConfig;
import com.entity.Category;

public class DAOCategoryImpl {
	public Category findCategoryByCategoryId(Long categoryId) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		Category category = entityManager.find(Category.class, categoryId);
		if(category.getIsDeleted() == false)
			return category;
		return null;
	}
	
	public List<Category> getAllCategories(){
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT c FROM Category c WHERE c.isDeleted = false";
		TypedQuery<Category> query = entityManager.createQuery(jpql, Category.class);
		List<Category> categories = query.getResultList();
		return categories;
	}
}
