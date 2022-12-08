package com;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import com.dao.impl.DAOUserImpl;
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
		User user = new User("Nguyen", "Tu", "nguyenminhtu@gmail.com", "0987654321", "123",  2, "HCM", null);
		//User user = new DAOUserImpl().findUserById(1);
		user.setLastName("Tú");
		System.out.println(new DAOUserImpl().insertUser(user));
	}
}