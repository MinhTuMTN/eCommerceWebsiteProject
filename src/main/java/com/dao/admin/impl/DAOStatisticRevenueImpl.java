package com.dao.admin.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import com.JPAConfig;
import com.entity.Order;
import com.entity.Product;

public class DAOStatisticRevenueImpl {
	public int countAllOrders(Long storeId) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT COUNT(o) FROM Order o WHERE o.store.storeId=:storeId";
		TypedQuery<Number> query = entityManager.createQuery(jpql, Number.class);
		query.setParameter("storeId", storeId);
		return query.getSingleResult().intValue();
	}
	
	public int countAllProducts(Long storeId) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT COUNT(p) FROM Product p WHERE p.store.storeId=:storeId";
		TypedQuery<Number> query = entityManager.createQuery(jpql, Number.class);
		query.setParameter("storeId", storeId);
		return query.getSingleResult().intValue();
	}
	
	public List<Product> getTop3SoldProducts(Long storeId) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT p "
				+ "FROM Product p "
				+ "WHERE p.store.storeId = :storeId "
				+ "ORDER BY p.sold DESC";
		TypedQuery<Product> query = entityManager.createQuery(jpql, Product.class);
		query.setFirstResult(0);
		query.setMaxResults(3);
		query.setParameter("storeId", storeId);
		return query.getResultList();
	}
	
	public List<Order> getTop3Orders(Long storeId) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT o "
				+ "FROM Order o "
				+ "WHERE o.store.storeId = :storeId "
				+ "ORDER BY o.orderId DESC";
		TypedQuery<Order> query = entityManager.createQuery(jpql, Order.class);
		query.setFirstResult(0);
		query.setMaxResults(3);
		query.setParameter("storeId", storeId);
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Object[]> getTotalSoldProduct(Long storeId) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT p.name, p.sold FROM Product p WHERE p.store.storeId = :storeId";
		Query query = entityManager.createQuery(jpql);
		query.setParameter("storeId", storeId);
		List<Object[]> obj = query.getResultList();
		return obj;
	}
}
