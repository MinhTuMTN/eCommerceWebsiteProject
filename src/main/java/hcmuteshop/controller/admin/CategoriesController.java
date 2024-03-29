package hcmuteshop.controller.admin;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hcmuteshop.dao.admin.impl.DAOCategoryImpl;
import hcmuteshop.entity.Category;
import hcmuteshop.util.Constant;
import hcmuteshop.util.UploadUtils;

@SuppressWarnings("serial")
@MultipartConfig
@WebServlet(urlPatterns = { "/admin/categories", "/admin/category-detail", "/admin/add-category",
		"/admin/update-category", "/admin/delete-category", "/admin/restore-category", "/admin/search-categories" })
public class CategoriesController extends HttpServlet {
	DAOCategoryImpl daoCategoryImpl = new DAOCategoryImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURL().toString();

		if (url.contains("/categories")) {
			categoryList(req, resp);
		} else if (url.contains("/category-detail")) {
			categoryDetail(req, resp);
		} else if (url.contains("/add-category")) {
			req.getRequestDispatcher("/views/admin/category-add.jsp").forward(req, resp);
		} else if (url.contains("/update-category")) {
			Long categoryId = Long.valueOf(req.getParameter("categoryId"));
			Category category = daoCategoryImpl.getCategoryById(categoryId);
			req.setAttribute("category", category);
			req.getRequestDispatcher("/views/admin/category-update.jsp").forward(req, resp);
		} else if (url.contains("/delete-category")) {
			deleteCategory(req, resp);
		} else if (url.contains("/restore-category")) {
			restoreCategory(req, resp);
		} else if (url.contains("/search-categories")) {
			searchCategories(req, resp);
		}
	}

	private void searchCategories(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String searchText = "";
		try {
			searchText = req.getParameter("search-text").trim();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		req.setAttribute("isSearch", true);
		req.setAttribute("searchText", searchText);
		int pageSize = 4;
		int pageNumber = 0;		
		
		float temp = (float)daoCategoryImpl.countAllCategoriesSearch(searchText) / pageSize;
		int totalPages = (float)((int) temp) < temp ? (int)temp : (int)temp - 1;
		try {
			pageNumber = Integer.valueOf(req.getParameter("page"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		List<Category> categories = daoCategoryImpl.findCategoriesPaginationByName(pageNumber, pageSize, searchText);
		req.setAttribute("categories", categories);
		req.setAttribute("totalPages", totalPages);	
		req.setAttribute("number", pageNumber);	
		req.getRequestDispatcher("/views/admin/category-list.jsp").forward(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURL().toString();
		if (url.contains("/add-category")) {
			addCategory(req, resp);
		} else if (url.contains("/update-category")) {
			updateCategory(req, resp);
		}
	}

	private void restoreCategory(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Category category = daoCategoryImpl.getCategoryById(Long.valueOf(req.getParameter("categoryId")));
		String message = "";
		if (daoCategoryImpl.restoreCategory(category)) {
			message = "Khôi phục loại sản phẩm thành công!";
		} else {
			message = "Khôi phục loại sản phẩm thất bại!";
		}

		req.setAttribute("message", message);

		resp.sendRedirect(req.getContextPath() + "/admin/categories");

	}

	private void deleteCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Category category = daoCategoryImpl.getCategoryById(Long.valueOf(req.getParameter("categoryId")));
		String message = "";
		if (daoCategoryImpl.deleteCategory(category)) {
			message = "Xóa loại sản phẩm thành công!";
		} else {
			message = "Xóa loại sản phẩm thất bại!";
		}

		req.setAttribute("message", message);

		resp.sendRedirect(req.getContextPath() + "/admin/categories");

	}

	private void updateCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Category category = new Category();

			category.setCategoryId(Long.parseLong(req.getParameter("categoryId")));
			String name = req.getParameter("name");
			category.setName(name);
			category.setSlug(Slugify.makeSlug(name));

			Date updatedAt = new Date(System.currentTimeMillis());
			category.setUpdatedAt(updatedAt);
			String fileName = category.getSlug() + System.currentTimeMillis();
			String image = UploadUtils.processUpload("image", req, Constant.DIR + "\\Categories\\", fileName);
			category.setImage(image);

			daoCategoryImpl.updateCategory(category);

			req.setAttribute("message", "Cập nhật loại sản phẩm thành công!");

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("message", "Cập nhật loại sản phẩm thất bại. Eror: " + e.getMessage());
		}

		resp.sendRedirect(req.getContextPath() + "/admin/categories");
	}

	private void addCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Category category = new Category();

			String name = req.getParameter("name");
			category.setName(name);
			category.setSlug(Slugify.makeSlug(name));

			Date createdAt = new Date(System.currentTimeMillis());
			category.setCreatedAt(createdAt);
			category.setUpdatedAt(createdAt);

			String fileName = category.getSlug() + System.currentTimeMillis();
			category.setImage(UploadUtils.processUpload("image", req, Constant.DIR + "\\Categories\\", fileName));

			daoCategoryImpl.insertCategory(category);

			req.setAttribute("message", "Thêm loại sản phẩm thành công!");

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("message", "Thêm loại sản phẩm thất bại. Eror: " + e.getMessage());
		}

		resp.sendRedirect(req.getContextPath() + "/admin/categories");
	}

	private void categoryDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long categoryId = Long.valueOf(req.getParameter("categoryId"));
		Category category = daoCategoryImpl.getCategoryById(categoryId);

		if (category == null) {
			resp.sendRedirect(req.getContextPath() + "/admin/categories");
			return;
		}

		req.setAttribute("category", category);

		req.getRequestDispatcher("/views/admin/category-detail.jsp").forward(req, resp);
	}

	private void categoryList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int pageSize = 4;
		int pageNumber = 0;

		float temp = (float) daoCategoryImpl.countAllCategories() / pageSize;
		int totalPages = (float) ((int) temp) < temp ? (int) temp : (int) temp - 1;
		try {
			pageNumber = Integer.valueOf(req.getParameter("page"));
		} catch (Exception e) {
			// TODO: handle exception
		}

		List<Category> categories = daoCategoryImpl.getAllCategoriesPagination(pageNumber, pageSize);

		req.setAttribute("categories", categories);
		req.setAttribute("totalPages", totalPages);
		req.setAttribute("number", pageNumber);
		req.getRequestDispatcher("/views/admin/category-list.jsp").forward(req, resp);
	}
}
