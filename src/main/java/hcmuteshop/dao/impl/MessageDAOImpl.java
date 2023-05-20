package hcmuteshop.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import hcmuteshop.JPAConfig;
import hcmuteshop.entity.Message;

public class MessageDAOImpl {
	public void insertMessage(Message message) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			entityManager.persist(message);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
		}
	}
}
