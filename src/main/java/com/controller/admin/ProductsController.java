package com.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.admin.impl.DAOCategoryImpl;
import com.dao.admin.impl.DAOProductImpl;
import com.entity.Product;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = { "/admin/products", "/admin/product-detail", "/admin/delete-product", "/admin/restore-product" })
public class ProductsController extends HttpServlet {
	DAOProductImpl daoProductImpl = new DAOProductImpl();
	DAOCategoryImpl daoCategoryImpl = new DAOCategoryImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURL().toString();

		if (url.contains("/products")) {
			productList(req, resp);
		} else if (url.contains("/product-detail")) {
			productDetail(req, resp);
		} else if (url.contains("/delete-product")) {
			deleteProduct(req, resp);
		} else if (url.contains("/restore-product")) {
			restoreProduct(req, resp);
		}
	}

	private void restoreProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		Product product = daoProductImpl.getProductById(Integer.valueOf(req.getParameter("productId")));
		String message = "";
		if (daoProductImpl.restoreProduct(product)) {
			if(product.getCategory().getIsDeleted()) {
				daoCategoryImpl.restoreCategory(product.getCategory());
			}
			message = "Khôi phục sản phẩm thành công!";
		} else {
			message = "Khôi phục sản phẩm thất bại!";
		}

		req.setAttribute("message", message);

		resp.sendRedirect(req.getContextPath() + "/admin/products");
		
	}

	private void deleteProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		Product product = daoProductImpl.getProductById(Integer.valueOf(req.getParameter("productId")));
		String message = "";
		if (daoProductImpl.deleteProduct(product)) {
			if(daoProductImpl.countActiveProductsByCategory(product.getCategory().getCategoryId()) == 0) {
				daoCategoryImpl.deleteCategory(product.getCategory());
			}
			message = "Xóa sản phẩm thành công!";
		} else {
			message = "Xóa sản phẩm thất bại!";
		}

		req.setAttribute("message", message);

		resp.sendRedirect(req.getContextPath() + "/admin/products");
		
	}

	protected void productList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String parameter =  req.getParameter("filter");
		int filter = 2;
		if(parameter != null) {
			filter = Integer.valueOf(parameter);
		}
		int pageSize = 4;
		int pageNumber = 0;

		float temp = (float) daoProductImpl.countAllProducts() / pageSize;

		int totalPages = (float) ((int) temp) < temp ? (int) temp : (int) temp - 1;
		
		totalPages = (float) ((int) temp) < temp ? (int) temp : (int) temp - 1;
		try {
			pageNumber = Integer.valueOf(req.getParameter("page"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		List<Product> products = daoProductImpl.getAllProductsPagination(pageNumber, pageSize);
		
		if (filter == 2) {
			products = daoProductImpl.getAllProductsPagination(pageNumber, pageSize);
		} else if (filter == 1) {
			temp = (float) daoProductImpl.countActiveProducts() / pageSize;
			totalPages = (float) ((int) temp) < temp ? (int) temp : (int) temp - 1;
			try {
				pageNumber = Integer.valueOf(req.getParameter("page"));
			} catch (Exception e) {
				// TODO: handle exception
			}
			products = daoProductImpl.getActiveProductsPagination(pageNumber, pageSize);
		} else if (filter == 0) {
			temp = (float) daoProductImpl.countInactiveProducts() / pageSize;
			totalPages = (float) ((int) temp) < temp ? (int) temp : (int) temp - 1;
			try {
				pageNumber = Integer.valueOf(req.getParameter("page"));
			} catch (Exception e) {
				// TODO: handle exception
			}
			products = daoProductImpl.getInactiveProductsPagination(pageNumber, pageSize);
		}
		
		req.setAttribute("filter", filter);
		req.setAttribute("products", products);
		req.setAttribute("totalPages", totalPages);
		req.setAttribute("number", pageNumber);
		req.getRequestDispatcher("/views/admin/product-list.jsp").forward(req, resp);
	}
	
	protected void productDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int productId = Integer.valueOf(req.getParameter("productId"));
		Product product = daoProductImpl.getProductById(productId);
		
		if (product == null) {
			resp.sendRedirect(req.getContextPath() + "/admin/products");
			return;
		}

		req.setAttribute("product", product);

		req.getRequestDispatcher("/views/admin/product-detail.jsp").forward(req, resp);
	}

}
