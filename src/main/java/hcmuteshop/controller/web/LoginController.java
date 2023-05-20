package hcmuteshop.controller.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hcmuteshop.dao.impl.DAOUserImpl;
import hcmuteshop.entity.User;

@WebServlet(urlPatterns = "/dang-nhap")
public class LoginController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("views/web/dang-nhap.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email").trim();
		String password = req.getParameter("password").trim();

		DAOUserImpl daoUserImpl = new DAOUserImpl();
		User user = daoUserImpl.checkUserPassword(email, password);
		if (user != null) {
			Cookie cookie = new Cookie("id", String.valueOf(user.getUserId()));
			cookie.setMaxAge(60 * 60 * 24 * 30);
			resp.addCookie(cookie);
			
			Cookie cookie2 = new Cookie("role", String.valueOf(user.getRole()));
			cookie2.setMaxAge(60 * 60 * 24 * 30);
			resp.addCookie(cookie2);
			
			if(user.getRole() == 1) {
				Cookie cookie3 = new Cookie("storeId", String.valueOf(user.getStore().getStoreId()));
				cookie3.setMaxAge(60 * 60 * 24 * 30);
				resp.addCookie(cookie3);
			}
			
			if (user.getRole() == 0) {
				resp.sendRedirect(req.getContextPath() + "/admin/home");
			} else if (user.getRole() == 1) {
				resp.sendRedirect(req.getContextPath() + "/seller/home");
			} else {
				resp.sendRedirect(req.getContextPath() + "/home");
			}
		} else {
			resp.sendRedirect(req.getContextPath() + "/dang-nhap");
		}
	}
}
