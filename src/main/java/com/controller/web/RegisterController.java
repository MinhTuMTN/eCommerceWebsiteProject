package com.controller.web;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.dao.impl.DAOUserImpl;
import com.entity.User;

@WebServlet(urlPatterns = "/dang-ky")
public class RegisterController extends HttpServlet{
	DAOUserImpl daoUserImpl = new DAOUserImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("views/web/dang-ky.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = new User();
		try {
			BeanUtils.populate(user, req.getParameterMap());
			if(daoUserImpl.insertUser(user) != null)
				req.setAttribute("message", "Đăng ký thành công");
			else {
				req.setAttribute("message", "Đăng ký không thành công");
			}
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			req.setAttribute("message", "Đăng ký không thành công");
		}
		
		
		req.getRequestDispatcher("views/web/home.jsp").forward(req, resp);
	}
}
