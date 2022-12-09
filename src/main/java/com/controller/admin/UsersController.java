package com.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.admin.impl.DAOUserImpl;
import com.entity.Product;
import com.entity.User;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = {"/admin/users", "/admin/user-detail"})
public class UsersController extends HttpServlet {
	DAOUserImpl daoUserImpl = new DAOUserImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURL().toString();

		if (url.contains("/users")) {
			userList(req, resp);
		}

		if (url.contains("/user-detail")) {
			userDetail(req, resp);
		}
		
	}
	
	protected void userList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int pageSize = 4;
		int pageNumber = 0;

		float temp = (float) daoUserImpl.countAllUser() / pageSize;
		int totalPages = (float) ((int) temp) < temp ? (int) temp : (int) temp - 1;
		try {
			pageNumber = Integer.valueOf(req.getParameter("page"));
		} catch (Exception e) {
			// TODO: handle exception
		}

		List<User> users = daoUserImpl.getUserPagination(pageNumber, pageSize);
		
		req.setAttribute("users", users);
		req.setAttribute("totalPages", totalPages);
		req.setAttribute("number", pageNumber);
		req.getRequestDispatcher("/views/admin/user-list.jsp").forward(req, resp);
	}
	
	protected void userDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int userId = Integer.valueOf(req.getParameter("userId"));
		User user = daoUserImpl.getUserById(userId);
		
		if(user == null) {
			resp.sendRedirect(req.getContextPath() + "/admin/users");
			return;
		}
		
		req.setAttribute("user", user);
		
		req.getRequestDispatcher("/views/admin/user-detail.jsp").forward(req, resp);
	}
}
