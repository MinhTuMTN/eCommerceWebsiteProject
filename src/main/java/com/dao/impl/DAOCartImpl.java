package com.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import com.JPAConfig;
import com.entity.Cart;
import com.entity.CartItem;
import com.entity.Product;

public class DAOCartImpl {
	private Cart findCartByUserId(int userId) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT c FROM Cart c WHERE c.user.userId = :userId";
		TypedQuery<Cart> query = entityManager.createQuery(jpql, Cart.class);
		query.setParameter("userId", userId);
		List<Cart> carts = query.getResultList();
		return carts.size() > 0 ? carts.get(0) : null;
	}
	
	private Cart createCart(int userId) {
		Cart cart = new Cart();
		cart.setUser(new DAOUserImpl().findUserById(userId));
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			entityManager.persist(cart);
			transaction.commit();
			return cart;
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			return null;
		}
		
	}
	public boolean addToCart(int userId, int productId, int quantity) {
		Cart cart = findCartByUserId(userId);
		if(cart == null)
			cart = createCart(userId);
		Product product = new DAOProductImpl().getProductById(productId);
		if (product == null) {
			return false;
		}
		
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		CartItem cartItem = new CartItem();
		cartItem.setCart(cart);
		cartItem.setCount(quantity);
		cartItem.setProduct(product);
		try {
			transaction.begin();
			entityManager.persist(cartItem);			
			transaction.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			return false;
		}
	}
	
	public static void main(String[] args) {
		new DAOCartImpl().addToCart(1, 1, 10);
	}
}
