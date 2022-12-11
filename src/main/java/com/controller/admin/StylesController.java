package com.controller.admin;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.dao.admin.impl.DAOCategoryImpl;
import com.dao.admin.impl.DAOStyleImpl;
import com.entity.Category;
import com.entity.Style;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = { "/admin/styles", "/admin/style-detail", "/admin/add-style", "/admin/update-style",
		"/admin/delete-style", "/admin/restore-style"})
public class StylesController extends HttpServlet {
	DAOStyleImpl daoStyleImpl = new DAOStyleImpl();
	DAOCategoryImpl daoCategoryImpl = new DAOCategoryImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURL().toString();

		if (url.contains("/styles")) {
			styleList(req, resp);
		} else if (url.contains("/style-detail")) {
			styleDetail(req, resp);
		} else if (url.contains("/add-style")) {
			List<Category> categories = daoCategoryImpl.getAllCategories();
			req.setAttribute("categories", categories);
			req.getRequestDispatcher("/views/admin/style-add.jsp").forward(req, resp);
		} else if (url.contains("/update-style")) {
			Long styleId = Long.valueOf(req.getParameter("styleId"));
			Style style = daoStyleImpl.getStyleById(styleId);
			req.setAttribute("style", style);

			List<Category> categories = daoCategoryImpl.getAllCategories();
			req.setAttribute("categories", categories);

			req.getRequestDispatcher("/views/admin/style-update.jsp").forward(req, resp);
		} else if (url.contains("/delete-style")) {
			deleteStyle(req, resp);
		} else if (url.contains("/restore-style")) {
			restoreStyle(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURL().toString();
		if (url.contains("/add-style")) {
			addStyle(req, resp);
		} else if (url.contains("/update-style")) {
			updateStyle(req, resp);
		}
	}

	private void restoreStyle(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Style style = daoStyleImpl.getStyleById(Long.valueOf(req.getParameter("styleId")));
		String message = "";
		if (daoStyleImpl.restoreStyle(style)) {
			message = "Khôi phục cấp độ người dùng thành công!";
		} else {
			message = "Khôi phục cấp độ người dùng thất bại!";
		}

		req.setAttribute("message", message);

		resp.sendRedirect(req.getContextPath() + "/admin/styles");
		return;

	}

	private void deleteStyle(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Style style = daoStyleImpl.getStyleById(Long.valueOf(req.getParameter("styleId")));
		String message = "";
		if (daoStyleImpl.deleteStyle(style)) {
			message = "Xóa cấp độ người dùng thành công!";
		} else {
			message = "Xóa cấp độ người dùng thất bại!";
		}

		req.setAttribute("message", message);

		resp.sendRedirect(req.getContextPath() + "/admin/styles");

		return;

	}

	private void updateStyle(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Long styleId = Long.valueOf(req.getParameter("styleId"));
			Style oldStyle = daoStyleImpl.getStyleById(styleId);
			Style style = new Style();
			style.setCreatedAt(oldStyle.getCreatedAt());
			
			Category category = daoCategoryImpl.getCategoryById(Long.valueOf(req.getParameter("categoryId")));
			BeanUtils.populate(style, req.getParameterMap());
			style.setCategory(category);

			Date updatedAt = new Date(System.currentTimeMillis());
			style.setUpdatedAt(updatedAt);

			daoStyleImpl.updateStyle(style);

			req.setAttribute("message", "Cập nhật loại sản phẩm thành công!");

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("message", "Cập nhật loại sản phẩm thất bại. Eror: " + e.getMessage());
		}

		resp.sendRedirect(req.getContextPath() + "/admin/styles");
		return;
	}

	private void addStyle(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			Style style = new Style();
			Category category = daoCategoryImpl.getCategoryById(Long.valueOf(req.getParameter("categoryId")));

			BeanUtils.populate(style, req.getParameterMap());

			style.setCategory(category);

			Date createdAt = new Date(System.currentTimeMillis());
			style.setCreatedAt(createdAt);
			style.setUpdatedAt(createdAt);

			daoStyleImpl.insertStyle(style);

			req.setAttribute("message", "Thêm loại sản phẩm thành công!");

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("message", "Thêm loại sản phẩm thất bại. Eror: " + e.getMessage());
		}

		resp.sendRedirect(req.getContextPath() + "/admin/styles");
		return;
	}

	private void styleDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long styleId = Long.valueOf(req.getParameter("styleId"));
		Style style = daoStyleImpl.getStyleById(styleId);

		if (style == null) {
			resp.sendRedirect(req.getContextPath() + "/admin/styles");
			return;
		}

		req.setAttribute("style", style);

		req.getRequestDispatcher("/views/admin/style-detail.jsp").forward(req, resp);
	}

	private void styleList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int pageSize = 4;
		int pageNumber = 0;

		float temp = (float) daoStyleImpl.countAllStyles() / pageSize;
		int totalPages = (float) ((int) temp) < temp ? (int) temp : (int) temp - 1;
		try {
			pageNumber = Integer.valueOf(req.getParameter("page"));
		} catch (Exception e) {
			// TODO: handle exception
		}

		List<Style> styles = daoStyleImpl.getAllStylesPagination(pageNumber, pageSize);

		req.setAttribute("styles", styles);
		req.setAttribute("totalPages", totalPages);
		req.setAttribute("number", pageNumber);
		req.getRequestDispatcher("/views/admin/style-list.jsp").forward(req, resp);
	}
}
