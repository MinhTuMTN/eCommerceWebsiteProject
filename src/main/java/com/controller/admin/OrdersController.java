package com.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.admin.impl.DAOOrderIpml;
import com.entity.Order;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = { "/admin/orders", "/admin/order-detail" })
public class OrdersController extends HttpServlet {
	DAOOrderIpml daoOrderIpml = new DAOOrderIpml();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURL().toString();

		if (url.contains("/orders")) {
			orderList(req, resp);
		} else if (url.contains("/order-detail")) {
			orderDetail(req, resp);
		}
	}
	protected void orderList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String parameter =  req.getParameter("filter");
		int filter = 1;
		if(parameter != null) {
			filter = Integer.valueOf(parameter);
		}
		int pageSize = 4;
		int pageNumber = 0;

		float temp = (float) daoOrderIpml.countAllOrders() / pageSize;

		int totalPages = (float) ((int) temp) < temp ? (int) temp : (int) temp - 1;
		
		totalPages = (float) ((int) temp) < temp ? (int) temp : (int) temp - 1;
		try {
			pageNumber = Integer.valueOf(req.getParameter("page"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		List<Order> orders = daoOrderIpml.getAllOrdersPagination(pageNumber, pageSize);
		
		if (filter == 1) {
			orders = daoOrderIpml.getAllOrdersPagination(pageNumber, pageSize);
		} else if (filter == 0) {
			temp = (float) daoOrderIpml.countShippedOrders() / pageSize;
			totalPages = (float) ((int) temp) < temp ? (int) temp : (int) temp - 1;
			try {
				pageNumber = Integer.valueOf(req.getParameter("page"));
			} catch (Exception e) {
				// TODO: handle exception
			}
			orders = daoOrderIpml.getShippedOrdersPagination(pageNumber, pageSize);
		}
		
		req.setAttribute("filter", filter);
		req.setAttribute("orders", orders);
		req.setAttribute("totalPages", totalPages);
		req.setAttribute("number", pageNumber);
		req.getRequestDispatcher("/views/admin/order-list.jsp").forward(req, resp);
	}
	
	protected void orderDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int orderId = Integer.valueOf(req.getParameter("orderId"));
		Order order = daoOrderIpml.getOrderById(orderId);
		
		if (order == null) {
			resp.sendRedirect(req.getContextPath() + "/admin/orders");
			return;
		}

		req.setAttribute("order", order);

		req.getRequestDispatcher("/views/admin/order-detail.jsp").forward(req, resp);
	}
}
