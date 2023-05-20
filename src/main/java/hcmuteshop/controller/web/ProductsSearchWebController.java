package hcmuteshop.controller.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hcmuteshop.dao.impl.DAOProductImpl;
import hcmuteshop.entity.Product;

@WebServlet(urlPatterns = "/search-product")
public class ProductsSearchWebController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String searchText = "";
		try {
			searchText = req.getParameter("search-text").trim();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		req.setAttribute("isSearch", true);
		req.setAttribute("searchText", searchText);
		DAOProductImpl daoProductImpl = new DAOProductImpl();
		int pageSize = 8;
		int pageNumber = 0;		
		
		float temp = (float)daoProductImpl.countAllProductsSearch(searchText) / pageSize;
		int totalPages = (float)((int) temp) < temp ? (int)temp : (int)temp - 1;
		try {
			pageNumber = Integer.valueOf(req.getParameter("page"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		List<Product> products = daoProductImpl.findProductsPaginationByName(pageNumber, pageSize, searchText);
		req.setAttribute("products", products);
		req.setAttribute("totalPages", totalPages);	
		req.setAttribute("number", pageNumber);	
		req.getRequestDispatcher("/views/web/product-list.jsp").forward(req, resp);
	}
}
