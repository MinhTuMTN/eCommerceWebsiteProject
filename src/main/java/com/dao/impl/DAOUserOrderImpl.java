package com.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import com.JPAConfig;
import com.entity.Cart;
import com.entity.CartItem;
import com.entity.Order;
import com.entity.OrderItem;
import com.entity.Product;
import com.entity.Store;
import com.entity.User;

public class DAOUserOrderImpl {	
	
	private Order findOrderInListOrders(Long storeId, List<Order> orders) {
		for(Order order: orders)
			if(order.getStore().getStoreId() == storeId)
				return order;
		return null;
	}
	
	public boolean payment(int userId) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			Cart cart = new DAOCartImpl().findCartByUserId(userId);
			List<CartItem> cartItems = cart.getCartItems();
			List<Order> orders = new ArrayList<Order>();
			
			for(CartItem cartItem : cartItems) {
				Long storeId = cartItem.getProduct().getStore().getStoreId();
				Order order = findOrderInListOrders(storeId, orders);
				
				// Nếu không tồn tại thì tạo đơn mới
				if(order == null) {
					// Tạo đơn hàng mới
					order = new Order();
					order.setCreatedAt(new Date());
					order.setUser(entityManager.find(User.class, userId));
					order.setStore(entityManager.find(Store.class, storeId));
					order.setAmountFromUser(0D);
					entityManager.persist(order);
				}
				
				// Thêm product vào 
				List<OrderItem> orderItems = order.getOrderItems();
				OrderItem orderItem = new OrderItem();
				orderItem.setCount(cartItem.getCount());
				orderItem.setProduct(cartItem.getProduct());
				orderItem.setCreatedAt(new Date());
				orderItems.add(orderItem);
				
				// Cập nhật giá tiền cho đơn hàng
				Double amount = order.getAmountFromUser();
				amount += cartItem.getProduct().getPrice() * cartItem.getCount();
				order.setAmountFromUser(amount);
				entityManager.merge(order);
				
				// Cập nhật số lượng đã bán của Product
				Product product = cartItem.getProduct();
				product.setQuantity(product.getQuantity() - cartItem.getCount());
				product.setSold(product.getSold() + cartItem.getCount());
				entityManager.persist(product);
				
				// Xóa cartItem ra khỏi giỏ hàng
				entityManager.remove(cartItem);
				orders.add(order); 
				
			}
			transaction.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			return false;
		}		
	}
}
