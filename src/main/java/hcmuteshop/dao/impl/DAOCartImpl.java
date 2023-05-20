package hcmuteshop.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import hcmuteshop.JPAConfig;
import hcmuteshop.entity.Cart;
import hcmuteshop.entity.CartItem;
import hcmuteshop.entity.Product;

public class DAOCartImpl {
	public Cart findCartByUserId(int userId) {
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
	
	private CartItem findCartItem(int userId, int productId) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT c FROM CartItem c WHERE c.product.productId = :productId AND c.cart.user.userId = :userId";
		TypedQuery<CartItem> query = entityManager.createQuery(jpql, CartItem.class);
		query.setParameter("productId", productId);
		query.setParameter("userId", userId);
		List<CartItem> cartItems = query.getResultList();
		return cartItems.size() > 0 ? cartItems.get(0) : null;
	}
	
	public CartItem updateCartItem(CartItem cartItem, int newQuantity) {
		cartItem.setCount(newQuantity);
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			entityManager.merge(cartItem);
			transaction.commit();
			return cartItem;
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
		
		CartItem cartItem = findCartItem(userId, productId);
		if(cartItem != null) {		
			updateCartItem(cartItem, cartItem.getCount() + quantity);
		}else {
			cartItem = new CartItem();
			cartItem.setCart(cart);
			cartItem.setCount(quantity);
			cartItem.setProduct(product);
		}
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
	
	public CartItem findAndUpdateCartItem(int userId, int productId, int newQuantity) {
		CartItem cartItem = findCartItem(userId, productId);
		if(cartItem == null)
			return null;
		
		updateCartItem(cartItem, newQuantity);
		return cartItem;
	}
	
	public boolean removeCartItem(int userId, int productId) {
		CartItem cartItem = findCartItem(userId, productId);
		if(cartItem == null)
			return false;
		
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			cartItem = entityManager.find(CartItem.class, cartItem.getCartItemId());
			entityManager.remove(cartItem);
			transaction.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			return false;
		}
	}
	
}
