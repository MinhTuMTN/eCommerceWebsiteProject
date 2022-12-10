package com.dao.seller.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import com.JPAConfig;
import com.entity.Product;
import com.entity.Store;

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
	
	public List<Product> getProductsByStoreId(Long storeId){
		EntityManager entityManager = JPAConfig.getEntityManager();
		Store store = entityManager.find(Store.class, storeId);
		return store.getProducts();	
	}
	
	public Product updateProduct(Product product) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			entityManager.merge(product);
			transaction.commit();
			return product;
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			return null;
		}
	}
	
	public Boolean changeStatusProduct(int productId) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		Product product = entityManager.find(Product.class, productId);
		if(product == null)
			return false;
		
		product.setIsActive(!product.getIsActive());
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			entityManager.persist(product);
			transaction.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			return false;
		}
	}
	
	public Product getProductsByProductId(int productId){
		EntityManager entityManager = JPAConfig.getEntityManager();
		Product product = entityManager.find(Product.class, productId);
		return product;
	}
}
