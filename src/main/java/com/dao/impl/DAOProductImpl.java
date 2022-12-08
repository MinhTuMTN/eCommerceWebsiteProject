package com.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import com.JPAConfig;
import com.entity.Product;

public class DAOProductImpl {
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
	
	public Product getProductById(int id) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		Product product = entityManager.find(Product.class, id);
		return product;
	}
	
	public List<Product> getTop4BestSellerProducts(){
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT p FROM Product p ORDER BY p.sold DESC";
		TypedQuery<Product> query = entityManager.createQuery(jpql, Product.class);
		query.setFirstResult(0);
		query.setMaxResults(4);
		return query.getResultList();
	}
	
	public List<Product> getTop4LastProducts(){
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT p FROM Product p ORDER BY p.productId DESC";
		TypedQuery<Product> query = entityManager.createQuery(jpql, Product.class);
		return query.getResultList();
	}
}
