package com.dao.admin.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.JPAConfig;
import com.entity.User;

public class DAOUserImpl {
	
	public List<User> getAllUser(){
		List<User> users = new ArrayList<User>();
		String jpql = "SELECT u FROM User u";
		
		EntityManager entityManager = JPAConfig.getEntityManager();
		TypedQuery<User> query = entityManager.createQuery(jpql, User.class);
		users = query.getResultList();
		return users;
	}
	
	public int countAllUser() {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT COUNT(u) FROM User u";
		TypedQuery<Number> query = entityManager.createQuery(jpql, Number.class);
		return query.getSingleResult().intValue();
	}
	
	public List<User> getUserPagination(int pageNumber, int size){
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT u FROM User u ORDER BY u.userId DESC";
		TypedQuery<User>  query = entityManager.createQuery(jpql, User.class);
		query.setFirstResult(pageNumber * size);
		query.setMaxResults(size);
		return query.getResultList();
	}
}