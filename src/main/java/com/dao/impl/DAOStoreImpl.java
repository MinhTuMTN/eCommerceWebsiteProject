package com.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import com.JPAConfig;
import com.entity.Product;
import com.entity.Store;

public class DAOStoreImpl {
	public Store getStoreByStoreId(Long storeId) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		Store store = entityManager.find(Store.class, storeId);
		return store;
	}

	public int countProductsByStoreId(Long storeId) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT COUNT(p) FROM Product p WHERE p.isActive = true AND p.store.storeId = :storeId AND p.store.isActive = true";
		TypedQuery<Number> query = entityManager.createQuery(jpql, Number.class);
		query.setParameter("storeId", storeId);
		return query.getSingleResult().intValue();
	}
	
	public List<Product> getProductsByStoreIdPagination(int pageNumber, int size, Long storeId) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT p FROM Product p WHERE p.isActive = true AND p.store.storeId = :storeId";
		TypedQuery<Product> query = entityManager.createQuery(jpql, Product.class);
		query.setParameter("storeId", storeId);
		query.setFirstResult(pageNumber * size);
		query.setMaxResults(size);
		return query.getResultList();
	}
}
