package hcmuteshop.controller.web;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hcmuteshop.dao.impl.DAOUserImpl;
import hcmuteshop.dao.impl.DAOUserOrderImpl;
import hcmuteshop.entity.User;

@WebServlet(urlPatterns = "/payment")
public class PaymentWebController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int userId = 0;
		Cookie[] cookies = req.getCookies();
		for(Cookie cookie: cookies)
			if(cookie.getName().equals("id"))
				userId = Integer.valueOf(cookie.getValue());
		
		User user = new DAOUserImpl().findUserById(userId);
		Double total = new DAOUserOrderImpl().payment(userId);
		if(user == null || total == null || total == 0) {
			resp.sendRedirect(req.getContextPath() + "/home");
			return;
		}
		req.setAttribute("user", user);
		req.setAttribute("total", total);
		req.setAttribute("date", new Date());
		req.getRequestDispatcher("/views/web/payment.jsp").forward(req, resp);
	}
}
