package com.controller.vendor;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.Product;
import com.entity.Store;

@WebServlet(urlPatterns = {"/seller/products"})
public class ProductsSellerController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("fnProducts", true);
		Store store = SellerConfig.getStoreByCookies(req);
		List<Product> products = store.getProducts();
		req.setAttribute("products", products);
		req.getRequestDispatcher("/views/seller/list-products.jsp").forward(req, resp);
	}
}
