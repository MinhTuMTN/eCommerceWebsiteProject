package com.dao.admin.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.JPAConfig;
import com.entity.Order;

public class DAOOrderIpml{
	public List<Order> getAllOrdersPagination(int pageNumber, int size){
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT o FROM Order o ORDER BY o.orderId DESC";
		TypedQuery<Order> query = entityManager.createQuery(jpql, Order.class);
		query.setFirstResult(pageNumber * size);
		query.setMaxResults(size);
		return query.getResultList();
	}
	
	public List<Order> getShippedOrdersPagination(int pageNumber, int size){
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT o FROM Order o WHERE o.status = 2 ORDER BY o.orderId DESC";
		TypedQuery<Order> query = entityManager.createQuery(jpql, Order.class);
		query.setFirstResult(pageNumber * size);
		query.setMaxResults(size);
		return query.getResultList();
	}
	
	public int countAllOrders() {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT COUNT(o) FROM Order o";
		TypedQuery<Number> query = entityManager.createQuery(jpql, Number.class);

		return query.getSingleResult().intValue();
	}
	
	public int countShippedOrders() {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT COUNT(o) FROM Order o WHERE o.status = 2";
		TypedQuery<Number> query = entityManager.createQuery(jpql, Number.class);

		return query.getSingleResult().intValue();
	}
	
	public Order getOrderById(int orderId) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		Order order = entityManager.find(Order.class, orderId);
		return order;
	}
}
