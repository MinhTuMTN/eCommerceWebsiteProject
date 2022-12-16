package com.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import com.JPAConfig;
import com.dao.IDAOUser;
import com.entity.User;

public class DAOUserImpl implements IDAOUser {
	@Override
	public User insertUser(User user) {
		if (checkUserExist(user.getPhone(), user.getEmail()))
			return null;

		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			entityManager.persist(user);
			transaction.commit();
			return user;
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			return null;
		}
	}

	@Override
	public User updateUser(User user) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			entityManager.merge(user);
			transaction.commit();
			return user;
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			return null;
		}
	}

	@Override
	public List<User> getAllUser() {
		List<User> users = new ArrayList<User>();
		String jpql = "SELECT u FROM User u WHERE u.isActived = true";

		EntityManager entityManager = JPAConfig.getEntityManager();
		TypedQuery<User> query = entityManager.createQuery(jpql, User.class);
		users = query.getResultList();
		return users;
	}

	@Override
	public User deleteUser(User user) {
		user.setIsActived(false);
		return updateUser(user);
	}

	@Override
	public User findUserById(int id) {
		List<User> users = new ArrayList<User>();
		String jpql = "SELECT u FROM User u WHERE u.isActived = true AND u.userId = :id";

		EntityManager entityManager = JPAConfig.getEntityManager();
		TypedQuery<User> query = entityManager.createQuery(jpql, User.class);
		query.setParameter("id", id);
		users = query.getResultList();
		return users.size() > 0 ? users.get(0) : null;
	}

	@Override
	public boolean checkUserExist(String phone, String email) {
		List<User> users = new ArrayList<User>();
		String jpql = "SELECT u FROM User u WHERE u.isActived = true AND (u.phone = :phone OR u.email = :email)";

		EntityManager entityManager = JPAConfig.getEntityManager();
		TypedQuery<User> query = entityManager.createQuery(jpql, User.class);
		query.setParameter("phone", phone);
		query.setParameter("email", email);
		users = query.getResultList();
		return users.size() > 0 ? true : false;
	}

	public User checkUserPassword(String email, String password) {
		List<User> users = new ArrayList<User>();
		String jpql = "SELECT u FROM User u WHERE u.isActived = true AND (u.email = :email AND u.password = :password)";

		EntityManager entityManager = JPAConfig.getEntityManager();
		TypedQuery<User> query = entityManager.createQuery(jpql, User.class);
		query.setParameter("password", password);
		query.setParameter("email", email);
		users = query.getResultList();
		return users.size() > 0 ? users.get(0) : null;
	}

	public boolean changeUserPassword(int userId, String oldPassword, String newPassword) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		User user = entityManager.find(User.class, userId);
		if (!user.getPassword().equals(oldPassword))
			return false;
		try {
			transaction.begin();
			user.setPassword(newPassword.trim());
			transaction.commit();
			return true;
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
			return false;
		}
	}

	public boolean rechargeEWallet(int userId, Double amount) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		User user = entityManager.find(User.class, userId);
		try {
			transaction.begin();
			user.setE_wallet(user.getE_wallet() + amount);
			entityManager.merge(user);
			transaction.commit();
			return true;
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
			return false;
		}
	}
}
