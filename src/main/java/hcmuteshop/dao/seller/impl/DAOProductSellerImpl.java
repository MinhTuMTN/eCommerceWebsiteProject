package hcmuteshop.dao.seller.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import hcmuteshop.JPAConfig;
import hcmuteshop.entity.Product;
import hcmuteshop.entity.Store;

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
	
	public List<Product> getProductsSoldOut(Long storeId ){
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT p FROM Product p "
				+ "WHERE p.isActive = true "
				+ "AND p.store.storeId = :storeId "
				+ "AND p.category.isDeleted = false "
				+ "AND p.quantity < 5";
		TypedQuery<Product> query = entityManager.createQuery(jpql, Product.class);
		query.setParameter("storeId", storeId);
		return query.getResultList();
	}
	
	public int countProductsSoldOut(Long storeId ){
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT count(p) FROM Product p "
				+ "WHERE p.isActive = true "
				+ "AND p.store.storeId = :storeId "
				+ "AND p.category.isDeleted = false "
				+ "AND p.quantity < 5";
		TypedQuery<Number> query = entityManager.createQuery(jpql, Number.class);
		query.setParameter("storeId", storeId);
		return query.getSingleResult().intValue();
	}
}
