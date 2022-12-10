package com.controller.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.impl.DAOProductImpl;
import com.dao.impl.DAOStoreImpl;
import com.entity.Category;
import com.entity.Product;
import com.entity.Store;

@WebServlet(urlPatterns = "/store")
public class StoreWebController extends HttpServlet{
	DAOStoreImpl daoStoreImpl = new DAOStoreImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long storeId = 1L;
		try {
			storeId = Long.valueOf(req.getParameter("storeId"));
		} catch (Exception e) {
		}
		
		
		try {
			int pageSize = 12;
			int pageNumber = 0;		
			
			try {
				pageNumber = Integer.valueOf(req.getParameter("page"));
			}catch (Exception e) {
				// TODO: handle exception
			}
			Store store = daoStoreImpl.getStoreByStoreId(storeId);
			List<Product> products = daoStoreImpl.getProductsByStoreIdPagination(pageNumber, pageSize, storeId);
			
			float temp = (float)daoStoreImpl.countProductsByStoreId(storeId) / pageSize;
			int totalPages = (float)((int) temp) < temp ? (int)temp : (int)temp - 1;
			
			req.setAttribute("store", store);
			req.setAttribute("products", products);
			req.setAttribute("totalPages", totalPages);	
			req.setAttribute("number", pageNumber);
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		req.getRequestDispatcher("/views/web/shop.jsp").forward(req, resp);
	}
}
