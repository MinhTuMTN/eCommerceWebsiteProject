package com.controller.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/dang-xuat")
public class LogoutController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		Cookie[] cookies = request.getCookies();
		if(cookies!=null)
			for (int i = 0; i < cookies.length; i++) {
				if(cookies[i].getName().equals("id") || cookies[i].getName().equals("role") || cookies[i].getName().equals("storeId"))
				{
					cookies[i].setMaxAge(0);
					resp.addCookie(cookies[i]);
				}
					
		}
		resp.sendRedirect(request.getContextPath() + "/home");
	}
}
