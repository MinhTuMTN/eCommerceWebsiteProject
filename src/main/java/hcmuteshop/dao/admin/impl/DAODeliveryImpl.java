package hcmuteshop.dao.admin.impl;

import java.sql.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import hcmuteshop.JPAConfig;
import hcmuteshop.entity.Delivery;

public class DAODeliveryImpl {
	public void insertDelivery(Delivery delivery) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			entityManager.persist(delivery);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
		}
	}

	public void updateDelivery(Delivery delivery) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			entityManager.merge(delivery);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
		}
	}

	public boolean deleteDelivery(Delivery delivery) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			Date updatedAt = new Date(System.currentTimeMillis());
			delivery.setUpdatedAt(updatedAt);
			delivery.setIsDeleted(true);
			entityManager.merge(delivery);
			transaction.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			return false;
		}
	}

	public boolean restoreDelivery(Delivery delivery) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			Date updatedAt = new Date(System.currentTimeMillis());
			delivery.setUpdatedAt(updatedAt);
			delivery.setIsDeleted(false);
			entityManager.merge(delivery);
			transaction.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			return false;
		}
	}

	public List<Delivery> getAllDeliveriesPagination(int pageNumber, int size) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT d FROM Delivery d ORDER BY d.deliveryId DESC";
		TypedQuery<Delivery> query = entityManager.createQuery(jpql, Delivery.class);
		query.setFirstResult(pageNumber * size);
		query.setMaxResults(size);
		return query.getResultList();
	}

	public int countAllDeliveries() {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT COUNT(d) FROM Delivery d";
		TypedQuery<Number> query = entityManager.createQuery(jpql, Number.class);

		return query.getSingleResult().intValue();
	}

	public Delivery getDeliveryById(int deliveryId) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		Delivery delivery = entityManager.find(Delivery.class, deliveryId);
		return delivery;
	}
}
