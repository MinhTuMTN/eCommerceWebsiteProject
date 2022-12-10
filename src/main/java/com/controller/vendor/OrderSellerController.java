package com.controller.vendor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/seller/orders"})
public class OrderSellerController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("fnOrders", true);
		String uri = req.getRequestURI();
		if(uri.contains("orders")) {
			req.setAttribute("o2", true);
			req.getRequestDispatcher("/views/seller/orders-list.jsp").forward(req, resp);
		}
	}
}
