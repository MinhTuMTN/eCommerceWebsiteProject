package com.controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.admin.impl.DAOStatisticNewUsersImpl;
import com.dao.admin.impl.DAOUserImpl;
import com.entity.Order;
import com.entity.User;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = "/admin/statistics")
public class StatisticsNewUsersController extends HttpServlet{
	DAOStatisticNewUsersImpl daoStatisticsNewUsersImpl = new DAOStatisticNewUsersImpl();
	DAOUserImpl daoUserImpl = new DAOUserImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Integer> top3 = daoStatisticsNewUsersImpl.getTop3UserByAmount();
		List<User> top3Users = new ArrayList<User>();
		for(int userId : top3) {
			top3Users.add(daoUserImpl.getUserById(userId));
		}
		req.setAttribute("top3Users", top3Users);
		req.getRequestDispatcher("/views/admin/statistics.jsp").forward(req, resp);
	}
}
