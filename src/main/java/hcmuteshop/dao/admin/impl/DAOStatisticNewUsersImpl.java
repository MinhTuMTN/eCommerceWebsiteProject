package hcmuteshop.dao.admin.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import hcmuteshop.JPAConfig;
import hcmuteshop.entity.User;

public class DAOStatisticNewUsersImpl {
	public int countAllActiveUsers() {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT COUNT(u) FROM User u";
		TypedQuery<Number> query = entityManager.createQuery(jpql, Number.class);
		return query.getSingleResult().intValue();
	}
	
	public List<User> countUserByUserLevels() {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT u.userLevel.userLevelId, COUNT(u) as total FROM User u GROUP BY u.user.userLevelId";
		TypedQuery<User> query = entityManager.createQuery(jpql, User.class);
		return query.getResultList();
	}
	
	public List<Integer> getTop3UserByAmount() {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT o.user.userId "
				+ "FROM Order o "
				+ "WHERE o.status = 3 "
				+ "GROUP BY o.user.userId "
				+ "ORDER BY SUM(o.amountFromUser) DESC";
		TypedQuery<Integer> query = entityManager.createQuery(jpql, Integer.class);
		query.setFirstResult(0);
		query.setMaxResults(3);
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Object[]> getTop10UsersAmount() {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT o.user.userId, SUM(o.amountFromUser)  FROM Order o WHERE o.status = 3 GROUP BY o.user.userId ORDER BY SUM(o.amountFromUser)";
		Query query = entityManager.createQuery(jpql);
		query.setFirstResult(0);
		query.setMaxResults(10);
		List<Object[]> obj = query.getResultList();
		return obj;
	}

//	public List<Order> getTop10UsersAmount() {
//		EntityManager entityManager = JPAConfig.getEntityManager();
//		String jpql = "SELECT o FROM Order WHERE o.status = 3 GROUP BY o.user.userId ORDER BY SUM(o.amountFromUser)";
//		TypedQuery<Order> query = entityManager.createQuery(jpql, Order.class);
//		query.setFirstResult(0);
//		query.setMaxResults(10);
//		return query.getResultList();
//	}
}
