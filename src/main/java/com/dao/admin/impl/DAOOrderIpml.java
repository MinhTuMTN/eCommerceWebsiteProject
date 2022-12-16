package com.dao.admin.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
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
	
	public boolean updateOrderStatus(int orderId) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			Order order = new DAOOrderIpml().getOrderById(orderId);
			order.setStatus(3);
			entityManager.merge(order);
			transaction.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			return false;
		}
	}
	
	private List<Order> getUserOrdersByStatus(int userId, int status){
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT o FROM Order o WHERE o.status = :status AND o.user.userId = :userId";
		TypedQuery<Order> query = entityManager.createQuery(jpql, Order.class);
		query.setParameter("status", status);
		query.setParameter("userId", userId);
		return query.getResultList();
	}

	public List<Order> getUserOrdersProcessing(int userId) {
		return getUserOrdersByStatus(userId, 1);
	}

	public List<Order> getUserOrdersShipping(int userId) {
		return getUserOrdersByStatus(userId, 2);
	}

	public List<Order> getUserOrdersShipped(int userId) {
		return getUserOrdersByStatus(userId, 3);
	}

	public List<Order> getUserOrdersRefused(int userId) {
		return getUserOrdersByStatus(userId, 4);
	}
}
