package com.controller.web;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.impl.DAOCartImpl;
import com.entity.CartItem;

@WebServlet(urlPatterns = {"/addToCart", "/cart", "/updateCart", "/removeCart"})
public class CartWebController extends HttpServlet{
	DAOCartImpl daoCartImpl = new DAOCartImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI();
		
		// Lấy thông tin userId
		int userId = 0;
		try {
			Cookie[] cookies = req.getCookies();
			for (Cookie cookie : cookies) {
				if("id".equals(cookie.getName()))
					userId = Integer.valueOf(cookie.getValue());
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		//Lấy mã sản phầm cần xóa
		if(url.contains("removeCart")) {
			try {
				int productId = Integer.valueOf(req.getParameter("productId"));
				daoCartImpl.removeCartItem(userId, productId);
			} catch (Exception e) {
			}
			
		}else if (url.contains("addToCart")){
			// Lấy thông tin mã sản phẩm và số lượng để thêm
			try {			
				int productId = Integer.valueOf(req.getParameter("productId"));
				int quantity = 1;
				try {
					quantity = Integer.valueOf(req.getParameter("quantity"));
				} catch (Exception e) {
					// TODO: handle exception
				}
				 
				daoCartImpl.addToCart(userId, productId, quantity);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		try {
			List<CartItem> cartItems = daoCartImpl.findCartByUserId(userId).getCartItems();
			req.setAttribute("cartItems", cartItems);
		} catch (Exception e) {
			e.printStackTrace();
		}
//		
		req.getRequestDispatcher("/views/web/cart.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Dành cho cập nhật đơn hàng
		int userId = 0;
		try {			
			Cookie[] cookies = req.getCookies();
			for (Cookie cookie : cookies) {
				if("id".equals(cookie.getName()))
					userId = Integer.valueOf(cookie.getValue());
			}
			int productId = Integer.valueOf(req.getParameter("productId"));
			int quantity = Integer.valueOf(req.getParameter("quantityU"));
			daoCartImpl.findAndUpdateCartItem(userId, productId, quantity);
		} catch (Exception e) {
			e.printStackTrace();
		}
		resp.sendRedirect(req.getContextPath() + "/cart");
	}
}
