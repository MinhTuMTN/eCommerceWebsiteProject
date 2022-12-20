package com.controller.vendor;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.seller.impl.DAOProductSellerImpl;
import com.entity.Product;
import com.entity.Store;

@WebServlet(urlPatterns = "/seller/sold-out")
public class ProductSoldoutController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("fnProducts", true);
		Store store = SellerConfig.getStoreByCookies(req);
		List<Product> products = new DAOProductSellerImpl().getProductsSoldOut(store.getStoreId());
		req.setAttribute("products", products);
		req.getRequestDispatcher("/views/seller/sold-out.jsp").forward(req, resp);
	}
}
