package com.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.admin.impl.DAOStoreImpl;
import com.entity.Category;
import com.entity.Commission;
import com.entity.Product;
import com.entity.Store;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = { "/admin/stores", "/admin/store-detail", "/admin/license-store", "/admin/search-stores" })
public class StoresController extends HttpServlet {
	DAOStoreImpl daoStoreImpl = new DAOStoreImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURL().toString();

		if (url.contains("/stores")) {
			storeList(req, resp);
		} else if (url.contains("/store-detail")) {
			storeDetail(req, resp);
		} else if (url.contains("/license-store")) {
			storeLicensed(req, resp);
		} else if (url.contains("/search-stores")) {
			searchStores(req, resp);
		}
	}

	private void searchStores(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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

		float temp = (float) daoStoreImpl.countAllStoresSearch(searchText) / pageSize;
		int totalPages = (float) ((int) temp) < temp ? (int) temp : (int) temp - 1;
		try {
			pageNumber = Integer.valueOf(req.getParameter("page"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		List<Store> stores = daoStoreImpl.findStoresPaginationByName(pageNumber, pageSize, searchText);
		req.setAttribute("stores", stores);
		req.setAttribute("totalPages", totalPages);
		req.setAttribute("number", pageNumber);
		req.getRequestDispatcher("/views/admin/store-list.jsp").forward(req, resp);

	}

	private void storeList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String parameter = req.getParameter("filter");
		int filter = 2;
		if (parameter != null) {
			filter = Integer.valueOf(parameter);
		}
		int pageSize = 4;
		int pageNumber = 0;

		float temp = (float) daoStoreImpl.countAllStores() / pageSize;

		int totalPages = (float) ((int) temp) < temp ? (int) temp : (int) temp - 1;

		try {
			pageNumber = Integer.valueOf(req.getParameter("page"));
		} catch (Exception e) {
			// TODO: handle exception
		}

		List<Store> stores = null;

		if (filter == 2) {
			stores = daoStoreImpl.getAllStoresPagination(pageNumber, pageSize);
		} else if (filter == 1) {
			temp = (float) daoStoreImpl.countActiveStores() / pageSize;
			totalPages = (float) ((int) temp) < temp ? (int) temp : (int) temp - 1;
			try {
				pageNumber = Integer.valueOf(req.getParameter("page"));
			} catch (Exception e) {
				// TODO: handle exception
			}
			stores = daoStoreImpl.getActiveStoresPagination(pageNumber, pageSize);
		} else if (filter == 0) {
			temp = (float) daoStoreImpl.countInactiveStores() / pageSize;
			totalPages = (float) ((int) temp) < temp ? (int) temp : (int) temp - 1;
			try {
				pageNumber = Integer.valueOf(req.getParameter("page"));
			} catch (Exception e) {
				// TODO: handle exception
			}
			stores = daoStoreImpl.getInactiveStoresPagination(pageNumber, pageSize);
		}

		req.setAttribute("filter", filter);
		req.setAttribute("stores", stores);
		req.setAttribute("totalPages", totalPages);
		req.setAttribute("number", pageNumber);
		req.getRequestDispatcher("/views/admin/store-list.jsp").forward(req, resp);

	}

	private void storeDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long storeId = Long.valueOf(req.getParameter("storeId"));
		Store store = daoStoreImpl.getStoreById(storeId);

		if (store == null) {
			resp.sendRedirect(req.getContextPath() + "/admin/stores");
			return;
		}

		req.setAttribute("store", store);

		req.getRequestDispatcher("/views/admin/store-detail.jsp").forward(req, resp);
	}

	private void storeLicensed(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Store store = daoStoreImpl.getStoreById(Long.valueOf(req.getParameter("storeId")));
		int licensed = Integer.valueOf(req.getParameter("licensed"));
		String message = "";
		if (licensed == 1) {
			if (daoStoreImpl.licenseStore(store)) {
				message = "Thành công!";
			} else {
				message = "Thất bại!";
			}
		} else {
			if (daoStoreImpl.banStore(store)) {
				message = "Thành công!";
			} else {
				message = "Thất bại!";
			}
		}
		req.setAttribute("message", message);

		resp.sendRedirect(req.getContextPath() + "/admin/stores");

		return;
	}
}
