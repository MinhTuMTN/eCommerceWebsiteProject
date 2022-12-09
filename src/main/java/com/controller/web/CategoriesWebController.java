package com.controller.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.impl.DAOCategoryImpl;
import com.entity.Category;
import com.entity.Product;

@WebServlet(urlPatterns = "/categories")
public class CategoriesWebController extends HttpServlet{
	DAOCategoryImpl daoCategoryImpl = new DAOCategoryImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long categoryId = 1L;
		try {
			categoryId = Long.valueOf(req.getParameter("categoryId"));
		} catch (Exception e) {
		}
		
		List<Category> categories = daoCategoryImpl.getAllCategories();
		Category category = daoCategoryImpl.findCategoryByCategoryId(categoryId);
		List<Product> products = category.getProducts();
		products.sort((o1, o2) -> ((Integer)o2.getProductId()).compareTo((Integer)o1.getProductId()));
		Product topProduct = null;
		try {
			topProduct = products.get(0);
		}catch (Exception e) {
			// TODO: handle exception
		}
		req.setAttribute("categories", categories);
		req.setAttribute("category", category);
		req.setAttribute("products", products);
		req.setAttribute("topProduct", topProduct);
		req.getRequestDispatcher("/views/web/category-detai.jsp").forward(req, resp);
	}
}
