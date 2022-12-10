package com.controller.vendor;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.dao.impl.DAOProductImpl;
import com.dao.seller.impl.DAOCategoriesSellerImpl;
import com.dao.seller.impl.DAOProductSellerImpl;
import com.entity.Category;
import com.entity.Product;
import com.entity.Store;
import com.util.Constant;

@WebServlet(urlPatterns = {"/seller/edit-product", "/seller/edit-status-product"})
public class EditProductSellerController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("fnProducts", true);
		String uri = req.getRequestURI();
		int productId = 0;
		Product product = new Product();
		try {
			productId = Integer.valueOf(req.getParameter("productId"));
		} catch (Exception e) {
			resp.sendRedirect(req.getContextPath() + "/seller/products");
			return;
		}
		if(uri.contains("edit-status-product")) {
			new DAOProductSellerImpl().changeStatusProduct(productId);
			resp.sendRedirect(req.getContextPath() + "/seller/products");
			return;
		}	
		
		try {
			product = new DAOProductImpl().getProductById(productId);			
		} catch (Exception e) {
			resp.sendRedirect(req.getContextPath() + "/seller/products");
		}
		
		
		List<Category> categories = new DAOCategoriesSellerImpl().getAllCategories();
		req.setAttribute("categories", categories);
		req.setAttribute("product", product);
		req.getRequestDispatcher("/views/seller/add-product.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int productId = 0;
		try {
			productId = Integer.valueOf(req.getParameter("productId"));
		} catch (Exception e) {
			resp.sendRedirect(req.getContextPath() + "/home");
			return;
		}
		Store store = SellerConfig.getStoreByCookies(req);
		Product product = new DAOProductSellerImpl().getProductsByProductId(productId);
		if(product == null) {
			resp.sendRedirect(req.getContextPath() + "/home");
			return;
		}

		DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
		ServletFileUpload servletFileUpload = new ServletFileUpload(diskFileItemFactory);
		servletFileUpload.setHeaderEncoding("UTF-8");

		try {
			List<FileItem> items = servletFileUpload.parseRequest(req);
			for (FileItem item : items) {
				if (item.getFieldName().equals("description")) {
					product.setDescription(item.getString("UTF-8"));
				} else if (item.getFieldName().equals("name")) {
					product.setName(item.getString("UTF-8"));
				} else if (item.getFieldName().equals("price")) {
					product.setPrice(Double.valueOf(item.getString("UTF-8")));
				} else if (item.getFieldName().equals("image")) {
					String originalFileName = item.getName();
					if (originalFileName == "")
						continue;

					int index = originalFileName.lastIndexOf(".");
					String ext = originalFileName.substring(index + 1);
					String fileName = System.currentTimeMillis() + "." + ext;

					// Custom
					File file = new File(Constant.DIR + "/Products/" + fileName);
					item.write(file);

					// Custom
					product.setImage(fileName);
				} else if (item.getFieldName().equals("quantity")) {
					product.setQuantity(Integer.valueOf(item.getString("UTF-8")));
				} else if (item.getFieldName().equals("category")) {
					Long catrogoryId = Long.valueOf(item.getString("UTF-8"));
					Category category = new DAOCategoriesSellerImpl().getCategoryByCategoryId(catrogoryId);
					product.setCategory(category);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		new DAOProductSellerImpl().updateProduct(product);
		resp.sendRedirect(req.getContextPath() + "/seller/products");
	}
}