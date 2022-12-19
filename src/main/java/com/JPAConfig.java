package com;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import com.dao.impl.DAOUserImpl;
import com.dao.impl.DAOUserOrderImpl;
import com.dao.seller.impl.DAOOrderSellerImpl;
import com.entity.Product;
import com.entity.User;
import com.entity.UserLevel;

import antlr.debug.NewLineEvent;

public class JPAConfig {
	static EntityManagerFactory factory;
	static EntityManager entityManager;
	
	static {
		factory = Persistence.createEntityManagerFactory("jpaSQL");
	}
	
	public static EntityManager getEntityManager() {	

		return factory.createEntityManager();

	}

	public static void main(String[] args) {
		getEntityManager();
		factory.close();
	}
}