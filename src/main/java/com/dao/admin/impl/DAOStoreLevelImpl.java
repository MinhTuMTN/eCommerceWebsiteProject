package com.dao.admin.impl;

import java.sql.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import com.JPAConfig;
import com.entity.StoreLevel;

public class DAOStoreLevelImpl {
	public void insertStoreLevel(StoreLevel storeLevel) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			entityManager.persist(storeLevel);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
		}
	}

	public void updateStoreLevel(StoreLevel storeLevel) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			entityManager.merge(storeLevel);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
		}
	}

	public boolean deleteStoreLevel(StoreLevel storeLevel) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			Date updatedAt = new Date(System.currentTimeMillis());
			storeLevel.setUpdatedAt(updatedAt);
			storeLevel.setIsDeleted(true);
			entityManager.merge(storeLevel);
			transaction.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			return false;
		}
	}

	public boolean restoreStoreLevel(StoreLevel storeLevel) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			Date updatedAt = new Date(System.currentTimeMillis());
			storeLevel.setUpdatedAt(updatedAt);
			storeLevel.setIsDeleted(false);
			entityManager.merge(storeLevel);
			transaction.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			return false;
		}
	}

	public List<StoreLevel> getAllStoreLevelsPagination(int pageNumber, int size) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT sl FROM StoreLevel sl ORDER BY sl.storeLevelId DESC";
		TypedQuery<StoreLevel> query = entityManager.createQuery(jpql, StoreLevel.class);
		query.setFirstResult(pageNumber * size);
		query.setMaxResults(size);
		return query.getResultList();
	}

	public int countAllStoreLevels() {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT COUNT(sl) FROM StoreLevel sl";
		TypedQuery<Number> query = entityManager.createQuery(jpql, Number.class);

		return query.getSingleResult().intValue();
	}

	public StoreLevel getStoreLevelById(Long storeLevelId) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		StoreLevel storeLevel = entityManager.find(StoreLevel.class, storeLevelId);
		return storeLevel;
	}
}
