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

@WebServlet(urlPatterns = "/home")
public class HomeWebController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		DAOProductImpl daoProductImpl = new DAOProductImpl();
		List<Product> lastProducts = daoProductImpl.getTop4LastProducts();
		List<Product> bestProducts = daoProductImpl.getTop4BestSellerProducts();
		Product topProduct = bestProducts.size() > 0 ? bestProducts.get(0) : null;
		req.setAttribute("topProduct", topProduct);
		req.setAttribute("lastProducts", lastProducts);
		req.setAttribute("bestProducts", bestProducts);
		req.getRequestDispatcher("views/web/home.jsp").forward(req, resp);
	}
}
