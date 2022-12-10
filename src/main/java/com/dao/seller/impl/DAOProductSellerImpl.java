package com.dao.seller.impl;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import com.JPAConfig;
import com.entity.Product;

public class DAOProductSellerImpl {
	public Product insertProduct(Product product) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			entityManager.persist(product);
			transaction.commit();
			return product;
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			return null;
		}
	}
}
