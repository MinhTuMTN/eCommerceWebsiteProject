package com.dao.seller.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import com.JPAConfig;
import com.entity.Store;

public class DAOStoreSellerImpl {
	public Store getStoreByUserId(int userId) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT s FROM Store s WHERE s.user.userId = :userId";
		TypedQuery<Store> query = entityManager.createQuery(jpql, Store.class);
		query.setParameter("userId", userId);
		List<Store> stores = query.getResultList(); 
		return stores.size() > 0 ? stores.get(0) : null;
	}
	
	public Store updateStore(Store store) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			entityManager.merge(store);
			transaction.commit();
			return store;
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			return null;
		}
	}
}
