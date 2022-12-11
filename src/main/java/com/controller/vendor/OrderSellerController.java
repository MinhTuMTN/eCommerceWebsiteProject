package com.controller.vendor;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.seller.impl.DAOOrderSellerImpl;
import com.entity.Order;
import com.entity.Store;

@WebServlet(urlPatterns = { "/seller/orders", "/seller/order-items", "/seller/order-shipping", "/seller/order-shipped",
		"/seller/order-refused", "/seller/refuse", "/seller/accept"  })
public class OrderSellerController extends HttpServlet {
	DAOOrderSellerImpl daoOrderSellerImpl = new DAOOrderSellerImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Store store = SellerConfig.getStoreByCookies(req);
		req.setAttribute("fnOrders", true);
		String uri = req.getRequestURI();

		if (uri.contains("seller/orders")) {
			req.setAttribute("o1", true);
			List<Order> orders = daoOrderSellerImpl.getAllOrdersProcessing(store.getStoreId());
			req.setAttribute("orders", orders);
			req.getRequestDispatcher("/views/seller/orders-list.jsp").forward(req, resp);
		} else if (uri.contains("seller/order-shipping")) {
			req.setAttribute("o2", true);
			List<Order> orders = daoOrderSellerImpl.getAllOrdersShipping(store.getStoreId());
			req.setAttribute("orders", orders);
			req.getRequestDispatcher("/views/seller/orders-list.jsp").forward(req, resp);
		} else if (uri.contains("seller/order-shipped")) {
			req.setAttribute("o3", true);
			List<Order> orders = daoOrderSellerImpl.getAllOrdersShipped(store.getStoreId());
			req.setAttribute("orders", orders);
			req.getRequestDispatcher("/views/seller/orders-list.jsp").forward(req, resp);
		} else if (uri.contains("seller/order-refused")) {
			req.setAttribute("o4", true);
			List<Order> orders = daoOrderSellerImpl.getAllOrdersRefused(store.getStoreId());
			req.setAttribute("orders", orders);
			req.getRequestDispatcher("/views/seller/orders-list.jsp").forward(req, resp);
		} else if (uri.contains("seller/order-items")) {
			int orderId = 0;
			try {
				orderId = Integer.valueOf(req.getParameter("orderId"));
			} catch (Exception e) {
				e.printStackTrace();
				resp.sendRedirect(req.getContextPath() + "/seller/orders");
				return;
			}

			Order order = daoOrderSellerImpl.getOrderByOrderId(store.getStoreId(), orderId);
			if (order == null) {
				resp.sendRedirect(req.getContextPath() + "/seller/orders");
				return;
			}

			req.setAttribute("order", order);
			req.getRequestDispatcher("/views/seller/order-details.jsp").forward(req, resp);
		} else if (uri.contains("seller/refuse")) {
			req.setAttribute("o1", true);
			try {
				int orderId = Integer.valueOf(req.getParameter("orderId"));
				daoOrderSellerImpl.refusedOrder(store.getStoreId(), orderId);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			List<Order> orders = daoOrderSellerImpl.getAllOrdersProcessing(store.getStoreId());
			req.setAttribute("orders", orders);
			req.getRequestDispatcher("/views/seller/orders-list.jsp").forward(req, resp);
		} else if (uri.contains("seller/accept")) {
			req.setAttribute("o1", true);
			try {
				int orderId = Integer.valueOf(req.getParameter("orderId"));
				daoOrderSellerImpl.acceptOrder(store.getStoreId(), orderId);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			List<Order> orders = daoOrderSellerImpl.getAllOrdersProcessing(store.getStoreId());
			req.setAttribute("orders", orders);
			req.getRequestDispatcher("/views/seller/orders-list.jsp").forward(req, resp);
		}
	}
}
