package com.controller.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.impl.DAOProductImpl;
import com.entity.Product;

@WebServlet(urlPatterns = "/products")
public class ProductsWebController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		DAOProductImpl daoProductImpl = new DAOProductImpl();
		int pageSize = 1;
		int pageNumber = 0;
		
		
		float temp = (float)daoProductImpl.countAllProducts() / pageSize;
		int totalPages = (float)((int) temp) < temp ? (int)temp : (int)temp - 1;
		try {
			pageNumber = Integer.valueOf(req.getParameter("page"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		List<Product> products = daoProductImpl.getProductsPagination(pageNumber, pageSize);
		req.setAttribute("products", products);
		req.setAttribute("totalPages", totalPages);	
		req.setAttribute("number", pageNumber);	
		req.getRequestDispatcher("/views/web/product-list.jsp").forward(req, resp);
	}
}
