package com.dao.admin.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.JPAConfig;
import com.entity.Product;

public class DAOProductImpl {
	public List<Product> getActiveProductsPagination(int pageNumber, int size) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT p FROM Product p WHERE p.isActive = true ORDER BY p.productId DESC";
		TypedQuery<Product> query = entityManager.createQuery(jpql, Product.class);
		query.setFirstResult(pageNumber * size);
		query.setMaxResults(size);
		return query.getResultList();
	}
	
	public List<Product> getInactiveProductsPagination(int pageNumber, int size) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT p FROM Product p WHERE p.isActive = false ORDER BY p.productId DESC";
		TypedQuery<Product> query = entityManager.createQuery(jpql, Product.class);
		query.setFirstResult(pageNumber * size);
		query.setMaxResults(size);
		return query.getResultList();
	}
	
	public List<Product> getAllProductsPagination(int pageNumber, int size) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT p FROM Product p ORDER BY p.productId DESC";
		TypedQuery<Product> query = entityManager.createQuery(jpql, Product.class);
		query.setFirstResult(pageNumber * size);
		query.setMaxResults(size);
		return query.getResultList();
	}

	public int countActiveProducts() {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT COUNT(p) FROM Product p WHERE p.isActive = true";
		TypedQuery<Number> query = entityManager.createQuery(jpql, Number.class);

		return query.getSingleResult().intValue();
	}
	
	public int countInactiveProducts() {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT COUNT(p) FROM Product p WHERE p.isActive = false";
		TypedQuery<Number> query = entityManager.createQuery(jpql, Number.class);

		return query.getSingleResult().intValue();
	}
	
	public int countAllProducts() {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT COUNT(p) FROM Product p";
		TypedQuery<Number> query = entityManager.createQuery(jpql, Number.class);

		return query.getSingleResult().intValue();
	}

	public Product getProductById(int id) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		Product product = entityManager.find(Product.class, id);
		return product;
	}
}