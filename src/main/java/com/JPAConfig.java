package com;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import com.dao.impl.DAOUserImpl;
import com.entity.Product;
import com.entity.User;
import com.entity.UserLevel;

public class JPAConfig {
	static EntityManagerFactory factory;
	static EntityManager entityManager;

	public static EntityManager getEntityManager() {

		factory = Persistence.createEntityManagerFactory("jpaSQL");

		return factory.createEntityManager();

	}

	public static void main(String[] args) {
		getEntityManager();
		factory.close();
	}
}