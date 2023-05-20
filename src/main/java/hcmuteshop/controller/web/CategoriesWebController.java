package hcmuteshop.controller.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hcmuteshop.dao.impl.DAOCategoryImpl;
import hcmuteshop.dao.impl.DAOProductImpl;
import hcmuteshop.entity.Category;
import hcmuteshop.entity.Product;

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
		
		
		try {
			int pageSize = 6;
			int pageNumber = 0;		
			
			try {
				pageNumber = Integer.valueOf(req.getParameter("page"));
			}catch (Exception e) {
				// TODO: handle exception
			}
			List<Category> categories = daoCategoryImpl.getAllCategories();
			Category category = daoCategoryImpl.findCategoryByCategoryId(categoryId);
			List<Product> products = new DAOProductImpl().getProductsPaginationByCategoryId(pageNumber, pageSize, categoryId);
			products.sort((o1, o2) -> ((Integer)o2.getProductId()).compareTo((Integer)o1.getProductId()));
			Product topProduct = null;
			topProduct = products.get(0);
			float temp = (float)category.getProducts().size() / pageSize;
			int totalPages = (float)((int) temp) < temp ? (int)temp : (int)temp - 1;
			
			req.setAttribute("categories", categories);
			req.setAttribute("category", category);
			req.setAttribute("products", products);
			req.setAttribute("topProduct", topProduct);
			req.setAttribute("totalPages", totalPages);	
			req.setAttribute("number", pageNumber);
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		req.getRequestDispatcher("/views/web/category-detai.jsp").forward(req, resp);
	}
}
