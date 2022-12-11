package com.dao.admin.impl;

import java.sql.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import com.JPAConfig;
import com.entity.StoreLevel;
import com.entity.Style;

public class DAOStyleImpl {
	public void insertStyle(Style style) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			entityManager.persist(style);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
		}
	}

	public void updateStyle(Style style) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			entityManager.merge(style);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
		}
	}

	public boolean deleteStyle(Style style) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			Date updatedAt = new Date(System.currentTimeMillis());
			style.setUpdatedAt(updatedAt);
			style.setIsDeleted(true);
			entityManager.merge(style);
			transaction.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			return false;
		}
	}

	public boolean restoreStyle(Style style) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			Date updatedAt = new Date(System.currentTimeMillis());
			style.setUpdatedAt(updatedAt);
			style.setIsDeleted(false);
			entityManager.merge(style);
			transaction.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			return false;
		}
	}

	public List<Style> getAllStylesPagination(int pageNumber, int size) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT st FROM Style st ORDER BY st.styleId DESC";
		TypedQuery<Style> query = entityManager.createQuery(jpql, Style.class);
		query.setFirstResult(pageNumber * size);
		query.setMaxResults(size);
		return query.getResultList();
	}

	public int countAllStyles() {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT COUNT(st) FROM Style st";
		TypedQuery<Number> query = entityManager.createQuery(jpql, Number.class);

		return query.getSingleResult().intValue();
	}

	public Style getStyleById(Long styleId) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		Style style = entityManager.find(Style.class, styleId);
		return style;
	}
}
