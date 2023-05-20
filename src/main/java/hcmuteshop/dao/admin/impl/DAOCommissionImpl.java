package hcmuteshop.dao.admin.impl;

import java.sql.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import hcmuteshop.JPAConfig;
import hcmuteshop.entity.Commission;

public class DAOCommissionImpl {
	public void insertCommission(Commission commission) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			entityManager.persist(commission);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
		}
	}

	public void updateCommission(Commission commission) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			entityManager.merge(commission);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
		}
	}

	public boolean deleteCommission(Commission commission) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			Date updatedAt = new Date(System.currentTimeMillis());
			commission.setUpdatedAt(updatedAt);
			commission.setIsDeleted(true);
			entityManager.merge(commission);
			transaction.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			return false;
		}
	}

	public boolean restoreCommission(Commission commission) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			Date updatedAt = new Date(System.currentTimeMillis());
			commission.setUpdatedAt(updatedAt);
			commission.setIsDeleted(false);
			entityManager.merge(commission);
			transaction.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			return false;
		}
	}

	public List<Commission> getAllCommissionsPagination(int pageNumber, int size) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT c FROM Commission c ORDER BY c.commissionId DESC";
		TypedQuery<Commission> query = entityManager.createQuery(jpql, Commission.class);
		query.setFirstResult(pageNumber * size);
		query.setMaxResults(size);
		return query.getResultList();
	}

	public int countAllCommissions() {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT COUNT(c) FROM Commission c";
		TypedQuery<Number> query = entityManager.createQuery(jpql, Number.class);

		return query.getSingleResult().intValue();
	}

	public Commission getCommissionById(Long commissionId) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		Commission commission = entityManager.find(Commission.class, commissionId);
		return commission;
	}
}
