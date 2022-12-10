package com.dao.seller.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.JPAConfig;
import com.entity.Category;

public class DAOCategoriesSellerImpl {
	public List<Category> getAllCategories(){
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT c FROM Category c WHERE c.isDeleted = false";
		TypedQuery<Category> query = entityManager.createQuery(jpql, Category.class);
		return query.getResultList();
	}
	
	public Category getCategoryByCategoryId(Long categoryId){
		EntityManager entityManager = JPAConfig.getEntityManager();
		Category category = entityManager.find(Category.class, categoryId);
		return category;
	}
}
