package com.dao.admin.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.JPAConfig;
import com.entity.Transaction;

public class DAOTransactionImpl {
	public List<Transaction> getAllTransactionsPagination(int pageNumber, int size) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT t FROM Transaction t ORDER BY t.transactionId DESC";
		TypedQuery<Transaction> query = entityManager.createQuery(jpql, Transaction.class);
		query.setFirstResult(pageNumber * size);
		query.setMaxResults(size);
		return query.getResultList();
	}

	public int countAllTransactions() {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT COUNT(t) FROM Transaction t";
		TypedQuery<Number> query = entityManager.createQuery(jpql, Number.class);

		return query.getSingleResult().intValue();
	}

	public Transaction getTransactionnById(Long transactionId) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		Transaction transaction = entityManager.find(Transaction.class, transactionId);
		return transaction;
	}
}
