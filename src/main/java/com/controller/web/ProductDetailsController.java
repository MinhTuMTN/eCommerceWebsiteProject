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

@WebServlet(urlPatterns = "/product-details")
public class ProductDetailsController extends HttpServlet{
	DAOProductImpl productImpl = new DAOProductImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int productId = Integer.valueOf(req.getParameter("productId"));
			Product product = productImpl.getProductById(productId);
			if(product == null) {
				resp.sendRedirect(req.getContextPath() + "/home");
				return;
			}
			List<Product> otherProducts = productImpl.getTop4ProductsByCategoryId(product.getCategory().getCategoryId(), productId);
			req.setAttribute("product", product);
			req.setAttribute("otherProducts", otherProducts);
			req.getRequestDispatcher("/views/web/product-detail.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendRedirect(req.getContextPath() + "/home");
		}
	}
}
