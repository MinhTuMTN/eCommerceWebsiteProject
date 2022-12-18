package com.dao.admin.impl;

import java.sql.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import com.JPAConfig;
import com.entity.Store;

public class DAOStoreImpl {
	public boolean licenseStore(Store store) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			Date updatedAt = new Date(System.currentTimeMillis());
			store.setUpdatedAt(updatedAt);
			store.setIsActive(true);
			store.setIsOpen(true);
			if (licenseStoreProducts(store.getStoreId())) {
				entityManager.merge(store);
				transaction.commit();
				return true;
			} else {
				transaction.rollback();
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			return false;
		}
	}

	public boolean banStore(Store store) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			Date updatedAt = new Date(System.currentTimeMillis());
			store.setUpdatedAt(updatedAt);
			store.setIsActive(false);
			store.setIsOpen(false);
			if (banStoreProducts(store.getStoreId())) {
				entityManager.merge(store);
				transaction.commit();
				return true;
			} else {
				transaction.rollback();
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			return false;
		}
	}

	public boolean licenseStoreProducts(Long storeId) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			Date updatedAt = new Date(System.currentTimeMillis());
			String jpql = "UPDATE Product p SET p.isActive=true, p.updatedAt=:updatedAt WHERE p.store.storeId = :storeId";
			int query = entityManager.createQuery(jpql).setParameter("storeId", storeId).setParameter("updatedAt", updatedAt).executeUpdate();
			
				transaction.commit();
				return true;
			
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			return false;
		}
	}

	public boolean banStoreProducts(Long storeId) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			Date updatedAt = new Date(System.currentTimeMillis());
			String jpql = "UPDATE Product p SET p.isActive=false, p.updatedAt=:updatedAt WHERE p.store.storeId = :storeId";
			int query = entityManager.createQuery(jpql).setParameter("storeId", storeId).setParameter("updatedAt", updatedAt).executeUpdate();
	
				transaction.commit();
				return true;

		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			return false;
		}
	}

	public List<Store> getActiveStoresPagination(int pageNumber, int size) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT s FROM Store s WHERE s.isActive = true ORDER BY s.storeId DESC";
		TypedQuery<Store> query = entityManager.createQuery(jpql, Store.class);
		query.setFirstResult(pageNumber * size);
		query.setMaxResults(size);
		return query.getResultList();
	}

	public List<Store> getInactiveStoresPagination(int pageNumber, int size) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT s FROM Store s WHERE s.isActive = false ORDER BY s.storeId DESC";
		TypedQuery<Store> query = entityManager.createQuery(jpql, Store.class);
		query.setFirstResult(pageNumber * size);
		query.setMaxResults(size);
		return query.getResultList();
	}

	public List<Store> getAllStoresPagination(int pageNumber, int size) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT s FROM Store s ORDER BY s.storeId DESC";
		TypedQuery<Store> query = entityManager.createQuery(jpql, Store.class);
		query.setFirstResult(pageNumber * size);
		query.setMaxResults(size);
		return query.getResultList();
	}

	public int countActiveStores() {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT COUNT(s) FROM Store s WHERE s.isActive = true";
		TypedQuery<Number> query = entityManager.createQuery(jpql, Number.class);

		return query.getSingleResult().intValue();
	}

	public int countInactiveStores() {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT COUNT(s) FROM Store s WHERE s.isActive = false";
		TypedQuery<Number> query = entityManager.createQuery(jpql, Number.class);

		return query.getSingleResult().intValue();
	}

	public int countAllStores() {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT COUNT(s) FROM Store s";
		TypedQuery<Number> query = entityManager.createQuery(jpql, Number.class);

		return query.getSingleResult().intValue();
	}

	public Store getStoreById(Long storeId) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		Store store = entityManager.find(Store.class, storeId);
		return store;
	}
	
	public int countAllStoresSearch(String searchText) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT COUNT(s) FROM Store s WHERE s.name like :searchText";
		TypedQuery<Number> query = entityManager.createQuery(jpql, Number.class);
		query.setParameter("searchText", "%" + searchText + "%");
		return query.getSingleResult().intValue();
	}
	
	public List<Store> findStoresPaginationByName(int pageNumber, int size, String searchText) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT s FROM Store s WHERE s.name like :searchText";
		TypedQuery<Store> query = entityManager.createQuery(jpql, Store.class);
		query.setParameter("searchText", '%' + searchText + '%');
		query.setFirstResult(pageNumber * size);
		query.setMaxResults(size);
		return query.getResultList();	
	}
}
