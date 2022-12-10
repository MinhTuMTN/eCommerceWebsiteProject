package com.dao.admin.impl;

import java.sql.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import com.JPAConfig;
import com.entity.UserLevel;

public class DAOUserLevelImpl {
	public void insertUserLevel(UserLevel userLevel) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			entityManager.persist(userLevel);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
		}
	}

	public void updateUserLevel(UserLevel userLevel) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			entityManager.merge(userLevel);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
		}
	}

	public boolean deleteUserLevel(UserLevel userLevel) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			Date updatedAt = new Date(System.currentTimeMillis());
			userLevel.setUpdatedAt(updatedAt);
			userLevel.setIsDeleted(true);
			entityManager.merge(userLevel);
			transaction.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			return false;
		}
	}

	public boolean restoreUserLevel(UserLevel userLevel) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			Date updatedAt = new Date(System.currentTimeMillis());
			userLevel.setUpdatedAt(updatedAt);
			userLevel.setIsDeleted(false);
			entityManager.merge(userLevel);
			transaction.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			return false;
		}
	}

	public List<UserLevel> getAllUserLevelsPagination(int pageNumber, int size) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT ul FROM UserLevel ul ORDER BY ul.userLevelId DESC";
		TypedQuery<UserLevel> query = entityManager.createQuery(jpql, UserLevel.class);
		query.setFirstResult(pageNumber * size);
		query.setMaxResults(size);
		return query.getResultList();
	}

	public int countAllUserLevels() {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT COUNT(ul) FROM UserLevel ul";
		TypedQuery<Number> query = entityManager.createQuery(jpql, Number.class);

		return query.getSingleResult().intValue();
	}

	public UserLevel getUserLevelById(int userLevelId) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		UserLevel userLevel = entityManager.find(UserLevel.class, userLevelId);
		return userLevel;
	}
}
