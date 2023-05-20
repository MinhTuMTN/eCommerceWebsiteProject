package hcmuteshop.controller.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hcmuteshop.dao.admin.impl.DAOOrderIpml;
import hcmuteshop.entity.Order;

@WebServlet(urlPatterns = { "/orders-processing", "/orders-shipping"
							, "/orders-shipped", "/orders-refused" })
public class OrdersWebController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		
		int userId = 0;
		for(Cookie cookie : req.getCookies())
			if(cookie.getName().equals("id"))
				userId = Integer.valueOf(cookie.getValue());
		
		List<Order> orders = new ArrayList<Order>();
		DAOOrderIpml daoOrderIpml = new DAOOrderIpml();
		if (uri.contains("orders-processing")) {
			req.setAttribute("o1", true);
			orders = daoOrderIpml.getUserOrdersProcessing(userId);			
		} else if (uri.contains("orders-shipping")) {
			req.setAttribute("o2", true);
			orders = daoOrderIpml.getUserOrdersShipping(userId);
		} else if (uri.contains("orders-shipped")) {
			req.setAttribute("o3", true);
			orders = daoOrderIpml.getUserOrdersShipped(userId);
		} else if (uri.contains("orders-refused")) {
			req.setAttribute("o4", true);
			orders = daoOrderIpml.getUserOrdersRefused(userId);
		}
		req.setAttribute("orders", orders);
		req.getRequestDispatcher("/views/web/user-orders.jsp").forward(req, resp);
	}
}
