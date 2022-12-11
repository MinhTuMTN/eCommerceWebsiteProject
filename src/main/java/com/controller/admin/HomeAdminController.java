package com.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.admin.impl.DAOStatisticNewUsersImpl;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = "/admin/home")
public class HomeAdminController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		DAOStatisticNewUsersImpl daoStatisticsNewUsersImpl = new DAOStatisticNewUsersImpl();
		int totalUsers = daoStatisticsNewUsersImpl.countAllActiveUsers();
		req.setAttribute("totalUsers", totalUsers);
		req.getRequestDispatcher("/views/admin/home.jsp").forward(req, resp);
	}
}
