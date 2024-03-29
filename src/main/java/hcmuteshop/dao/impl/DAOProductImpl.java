package hcmuteshop.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import hcmuteshop.JPAConfig;
import hcmuteshop.entity.Product;

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
		if(product.getIsActive() == false || product.getCategory().getIsDeleted())
			return null;
		return product;
	}
	
	public List<Product> getTop4BestSellerProducts(){
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT p FROM Product p WHERE p.isActive = true AND p.category.isDeleted = false ORDER BY p.sold DESC";
		TypedQuery<Product> query = entityManager.createQuery(jpql, Product.class);
		query.setFirstResult(0);
		query.setMaxResults(4);
		return query.getResultList();
	}
	
	public List<Product> getTop4LastProducts(){
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT p FROM Product p WHERE p.isActive = true AND p.category.isDeleted = false ORDER BY p.productId DESC";
		TypedQuery<Product> query = entityManager.createQuery(jpql, Product.class);
		query.setFirstResult(0);
		query.setMaxResults(4);
		return query.getResultList();
	}
	
	public List<Product> getProductsPagination(int pageNumber, int size){
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT p FROM Product p WHERE p.isActive = true AND p.category.isDeleted = false ORDER BY p.productId DESC";
		TypedQuery<Product> query = entityManager.createQuery(jpql, Product.class);
		query.setFirstResult(pageNumber * size);
		query.setMaxResults(size);
		return query.getResultList();
	}
	
	public int countAllProducts() {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT COUNT(p) FROM Product p WHERE p.isActive = true AND p.category.isDeleted = false";
		TypedQuery<Number> query = entityManager.createQuery(jpql, Number.class);
		
		return query.getSingleResult().intValue();
	}
	
	public List<Product> getTop4ProductsByCategoryId(Long categoryId, int productId) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT p FROM Product p WHERE p.isActive = true AND p.category.isDeleted = false AND p.category.categoryId = :categoryId AND p.productId != :productId";
		TypedQuery<Product> query = entityManager.createQuery(jpql, Product.class);
		query.setParameter("categoryId", categoryId);
		query.setParameter("productId", productId);
		query.setFirstResult(0);
		query.setMaxResults(4);
		return query.getResultList();
	}
	
	public List<Product> getProductsPaginationByCategoryId(int pageNumber, int size, Long categoryId) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT p FROM Product p WHERE p.isActive = true AND p.category.isDeleted = false AND p.category.categoryId = :categoryId";
		TypedQuery<Product> query = entityManager.createQuery(jpql, Product.class);
		query.setParameter("categoryId", categoryId);
		query.setFirstResult(pageNumber * size);
		query.setMaxResults(size);
		return query.getResultList();
	}
	
	public int countAllProductsSearch(String searchText) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT COUNT(p) FROM Product p WHERE p.isActive = true AND p.category.isDeleted = false AND (p.name like :searchText OR p.category.name like :searchText)";
		TypedQuery<Number> query = entityManager.createQuery(jpql, Number.class);
		query.setParameter("searchText", "%" + searchText + "%");
		return query.getSingleResult().intValue();
	}
	
	public List<Product> findProductsPaginationByName(int pageNumber, int size, String searchText) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT p FROM Product p WHERE p.isActive = true AND p.category.isDeleted = false AND (p.name like :searchText OR p.category.name like :searchText)";
		TypedQuery<Product> query = entityManager.createQuery(jpql, Product.class);
		query.setParameter("searchText", '%' + searchText + '%');
		query.setFirstResult(pageNumber * size);
		query.setMaxResults(size);
		return query.getResultList();	
	}
}
