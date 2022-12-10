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
import com.dao.impl.MessageDAOImpl;
import com.entity.Message;
import com.entity.User;

import antlr.debug.MessageEvent;

@WebServlet("/contact")
public class ContactWebController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/web/contact.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int userId = 0;
		for(Cookie cookie : req.getCookies())
			if(cookie.getName().equals("id"))
				userId = Integer.valueOf(cookie.getValue());
		User user = new DAOUserImpl().findUserById(userId);
		Message message = new Message();
		try {
			BeanUtils.populate(message, req.getParameterMap());
			message.setUser(user);
			message.setCreatedDate(new Date());
			new MessageDAOImpl().insertMessage(message);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		resp.sendRedirect(req.getContextPath() + "/home");
	}
}
