package com.controller.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.impl.DAOUserImpl;
import com.entity.User;

@WebServlet(urlPatterns = "/profile")
public class ProfileWebController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int userId = 0;
		for(Cookie cookie : req.getCookies())
			if(cookie.getName().equals("id"))
				userId = Integer.valueOf(cookie.getValue());
		User user = new DAOUserImpl().findUserById(userId);
		req.setAttribute("user", user);
		req.getRequestDispatcher("/views/web/profile.jsp").forward(req, resp);
	}
}
