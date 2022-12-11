package com.dao.seller.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import com.JPAConfig;
import com.entity.Order;
import com.entity.Product;
import com.entity.Store;
import com.entity.User;
import com.model.SellerIncome;

public class DAOOrderSellerImpl {
	private List<Order> getAllOrdersByStatus(Long storeId, int status) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT o FROM Order o WHERE o.status = :status AND o.store.storeId = :storeId";
		TypedQuery<Order> query = entityManager.createQuery(jpql, Order.class);
		query.setParameter("status", status);
		query.setParameter("storeId", storeId);
		return query.getResultList();
	}

	public List<Order> getAllOrdersProcessing(Long storeId) {
		return getAllOrdersByStatus(storeId, 1);
	}

	public List<Order> getAllOrdersShipping(Long storeId) {
		return getAllOrdersByStatus(storeId, 2);
	}

	public List<Order> getAllOrdersShipped(Long storeId) {
		return getAllOrdersByStatus(storeId, 3);
	}

	public List<Order> getAllOrdersRefused(Long storeId) {
		return getAllOrdersByStatus(storeId, 4);
	}

	public Order getOrderByOrderId(Long storeId, int orderId) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT o FROM Order o WHERE o.orderId = :orderId AND o.store.storeId = :storeId";
		TypedQuery<Order> query = entityManager.createQuery(jpql, Order.class);
		query.setParameter("orderId", orderId);
		query.setParameter("storeId", storeId);
		List<Order> orders = query.getResultList();
		return orders.size() > 0 ? orders.get(0) : null;
	}

	public Order refusedOrder(Long storeId, int orderId) {
		Order order = getOrderByOrderId(storeId, orderId);
		if (order == null)
			return null;

		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();

			// Thay đổi trang thái đơn
			order = entityManager.find(Order.class, order.getOrderId());
			order.setStatus(4);
			entityManager.merge(order);

			// Hoàn tiền
			User user = entityManager.find(User.class, order.getUser().getUserId());
			user.setE_wallet(user.getE_wallet() + order.getAmountFromUser());
			entityManager.merge(user);

			transaction.commit();
			return order;
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			return null;
		}
	}

	public Order acceptOrder(Long storeId, int orderId) {
		Order order = getOrderByOrderId(storeId, orderId);
		if (order == null)
			return null;

		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();

			// Thay đổi trang thái đơn
			order = entityManager.find(Order.class, order.getOrderId());
			order.setStatus(2);
			entityManager.merge(order);

			// Chuyển 80% tiền cho shop
			Store store = entityManager.find(Store.class, order.getStore().getStoreId());
			store.setE_wallet(store.getE_wallet() + order.getAmountFromUser() * 0.8);
			entityManager.merge(store);

			transaction.commit();
			return order;
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			return null;
		}
	}

	public List<SellerIncome> salesStatisticsByDate(Date startDate, Date endDate, int storeId) {
		List<SellerIncome> list = new ArrayList<SellerIncome>();
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT cast(o.createdAt as date), SUM(o.amountFromUser) FROM Order o WHERE o.status = 2 AND cast(o.createdAt as date) >= cast(:startDate as date) AND cast(o.createdAt as date) <= cast(:endDate as date) AND o.store.storeId = :storeId GROUP BY cast(o.createdAt as date)";
		Query query = entityManager.createQuery(jpql);
		query.setParameter("startDate", startDate);
		query.setParameter("endDate", endDate);
		query.setParameter("storeId", storeId);
		
		List<Object[]> objects = query.getResultList();
		for (Object[] object : objects) {
			Date date = (Date) object[0];
			Double amount =(Double)	object[1];
			list.add(new SellerIncome(date, amount));
		}		
		
		return list;
	}
	
	public Product bestSellingProductStatistics(Date startDate, Date endDate) {
		return null;
	}
}
