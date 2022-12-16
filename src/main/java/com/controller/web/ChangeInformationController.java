package com.controller.web;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.dao.impl.DAOUserImpl;
import com.entity.User;

@WebServlet(urlPatterns = "/change-information")
public class ChangeInformationController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Integer userId = getUserIdFromCookie(req);
		User user = new DAOUserImpl().findUserById(userId);
		req.setAttribute("user", user);
		req.getRequestDispatcher("/views/web/change-information.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Integer userId = getUserIdFromCookie(req);
		User user = new DAOUserImpl().findUserById(userId);
		try {
			BeanUtils.populate(user, req.getParameterMap());
			user.setUpdatedAt(new Date());
			new DAOUserImpl().updateUser(user);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		resp.sendRedirect(req.getContextPath() + "/home");
	}
	
	private int getUserIdFromCookie(HttpServletRequest req) {
		Integer userId = 0;
		for(Cookie cookie : req.getCookies())
			if(cookie.getName().equals("id"))
				userId = Integer.valueOf(cookie.getValue());
		return userId;
	}
}
