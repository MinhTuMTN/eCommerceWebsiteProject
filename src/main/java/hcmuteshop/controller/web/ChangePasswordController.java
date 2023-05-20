package hcmuteshop.controller.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hcmuteshop.dao.impl.DAOUserImpl;

@WebServlet(urlPatterns = "/change-password")
public class ChangePasswordController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/web/change-password.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int userId = 0;
		Cookie[] cookies = req.getCookies();
		for (Cookie cookie : cookies)
			if (cookie.getName().equals("id"))
				userId = Integer.valueOf(cookie.getValue());
		String oldPassword = req.getParameter("oldPassword");
		String newPassword = req.getParameter("newPassword");
		String reNewPassword = req.getParameter("reNewPassword");
		if (oldPassword.trim().equals("") || newPassword.trim().equals("") || reNewPassword.trim().equals("")
				|| !newPassword.trim().equals(reNewPassword.trim())) {
			resp.sendRedirect(req.getContextPath() + "/change-password");
			return;
		}
			
		if(!new DAOUserImpl().changeUserPassword(userId, oldPassword.trim(), reNewPassword.trim())) {
			resp.sendRedirect(req.getContextPath() + "/change-password");
			return;
		}
			
		resp.sendRedirect(req.getContextPath() + "/home");
	}
}
