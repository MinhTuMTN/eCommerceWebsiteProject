package com.dao.admin.impl;

import java.io.File;
import java.sql.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import com.JPAConfig;
import com.entity.Category;

public class DAOCategoryImpl {
	public void insertCategory(Category category) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			entityManager.persist(category);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
		}
	}

	public void updateCategory(Category category) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			Category oldCategory = getCategoryById(category.getCategoryId());
			oldCategory.setName(category.getName());
			oldCategory.setSlug(category.getSlug());
			oldCategory.setUpdatedAt(category.getUpdatedAt());

			if (!category.getImage().equals("")) {
				String fileName = oldCategory.getImage();
				final String dir = "C:\\upload";
				File file = new File(dir + "/Categories" + fileName);
				if (file.exists()) {
					file.delete();
				}
				oldCategory.setImage(category.getImage());
			}

			entityManager.merge(oldCategory);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
		}
	}

	public boolean deleteCategory(Category category) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			Date updatedAt = new Date(System.currentTimeMillis());
			category.setUpdatedAt(updatedAt);
			category.setIsDeleted(true);
			entityManager.merge(category);
			transaction.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			return false;
		}
	}

	public boolean restoreCategory(Category category) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			Date updatedAt = new Date(System.currentTimeMillis());
			category.setUpdatedAt(updatedAt);
			category.setIsDeleted(false);
			entityManager.merge(category);
			transaction.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			return false;
		}
	}

	public List<Category> getAllCategoriesPagination(int pageNumber, int size) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT c FROM Category c ORDER BY c.categoryId DESC";
		TypedQuery<Category> query = entityManager.createQuery(jpql, Category.class);
		query.setFirstResult(pageNumber * size);
		query.setMaxResults(size);
		return query.getResultList();
	}
	
	public List<Category> getAllCategories() {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT c FROM Category c";
		TypedQuery<Category> query = entityManager.createQuery(jpql, Category.class);
		return query.getResultList();
	}

	public int countAllCategories() {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT COUNT(c) FROM Category c";
		TypedQuery<Number> query = entityManager.createQuery(jpql, Number.class);

		return query.getSingleResult().intValue();
	}

	public Category getCategoryById(Long categoryId) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		Category category = entityManager.find(Category.class, categoryId);
		return category;
	}
	
}
