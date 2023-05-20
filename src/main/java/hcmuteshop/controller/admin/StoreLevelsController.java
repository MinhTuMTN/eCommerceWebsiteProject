package hcmuteshop.controller.admin;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hcmuteshop.dao.admin.impl.DAOStoreLevelImpl;
import hcmuteshop.entity.StoreLevel;
import org.apache.commons.beanutils.BeanUtils;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = {"/admin/storelevels",  "/admin/storelevel-detail", "/admin/add-storelevel",
		"/admin/update-storelevel", "/admin/delete-storelevel", "/admin/restore-storelevel"})
public class StoreLevelsController extends HttpServlet{
	DAOStoreLevelImpl daoStoreLevelImpl = new DAOStoreLevelImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURL().toString();

		if (url.contains("/storelevels")) {
			storeLevelList(req, resp);
		} else if (url.contains("/storelevel-detail")) {
			storeLevelDetail(req, resp);
		} else if (url.contains("/add-storelevel")) {
			req.getRequestDispatcher("/views/admin/storelevel-add.jsp").forward(req, resp);
		} else if (url.contains("/update-storelevel")) {
			Long storeLevelId = Long.valueOf(req.getParameter("storeLevelId"));
			StoreLevel storeLevel = daoStoreLevelImpl.getStoreLevelById(storeLevelId);
			req.setAttribute("storeLevel", storeLevel);
			req.getRequestDispatcher("/views/admin/storelevel-update.jsp").forward(req, resp);
		} else if (url.contains("/delete-storelevel")) {
			deleteStoreLevel(req, resp);
		} else if (url.contains("/restore-storelevel")) {
			restoreStoreLevel(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURL().toString();
		if (url.contains("/add-storelevel")) {
			addStoreLevel(req, resp);
		} else if (url.contains("/update-storelevel")) {
			updateStoreLevel(req, resp);
		}
	}

	private void restoreStoreLevel(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		StoreLevel storeLevel = daoStoreLevelImpl.getStoreLevelById(Long.valueOf(req.getParameter("storeLevelId")));
		String message = "";
		if (daoStoreLevelImpl.restoreStoreLevel(storeLevel)) {
			message = "Khôi phục cấp độ người dùng thành công!";
		} else {
			message = "Khôi phục cấp độ người dùng thất bại!";
		}

		req.setAttribute("message", message);

		resp.sendRedirect(req.getContextPath() + "/admin/storelevels");
		return;

	}

	private void deleteStoreLevel(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		StoreLevel storeLevel = daoStoreLevelImpl.getStoreLevelById(Long.valueOf(req.getParameter("storeLevelId")));
		String message = "";
		if (daoStoreLevelImpl.deleteStoreLevel(storeLevel)) {
			message = "Xóa cấp độ người dùng thành công!";
		} else {
			message = "Xóa cấp độ người dùng thất bại!";
		}

		req.setAttribute("message", message);

		resp.sendRedirect(req.getContextPath() + "/admin/storelevels");
		
		return;

	}

	private void updateStoreLevel(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Long storeLevelId = Long.valueOf(req.getParameter("storeLevelId"));
			StoreLevel oldStoreLevel = daoStoreLevelImpl.getStoreLevelById(storeLevelId);
			StoreLevel storeLevel = new StoreLevel();
			storeLevel.setCreatedAt(oldStoreLevel.getCreatedAt());
			BeanUtils.populate(storeLevel, req.getParameterMap());

			Date updatedAt = new Date(System.currentTimeMillis());
			storeLevel.setUpdatedAt(updatedAt);

			daoStoreLevelImpl.updateStoreLevel(storeLevel);

			req.setAttribute("message", "Cập nhật loại sản phẩm thành công!");

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("message", "Cập nhật loại sản phẩm thất bại. Eror: " + e.getMessage());
		}

		resp.sendRedirect(req.getContextPath() + "/admin/storelevels");
		return;
	}

	private void addStoreLevel(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			StoreLevel storeLevel = new StoreLevel();

			BeanUtils.populate(storeLevel, req.getParameterMap());

			Date createdAt = new Date(System.currentTimeMillis());
			storeLevel.setCreatedAt(createdAt);
			storeLevel.setUpdatedAt(createdAt);

			daoStoreLevelImpl.insertStoreLevel(storeLevel);

			req.setAttribute("message", "Thêm loại sản phẩm thành công!");

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("message", "Thêm loại sản phẩm thất bại. Eror: " + e.getMessage());
		}

		resp.sendRedirect(req.getContextPath() + "/admin/storelevels");
		return;
	}

	private void storeLevelDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long storeLevelId = Long.valueOf(req.getParameter("storeLevelId"));
		StoreLevel storeLevel = daoStoreLevelImpl.getStoreLevelById(storeLevelId);

		if (storeLevel == null) {
			resp.sendRedirect(req.getContextPath() + "/admin/storelevels");
			return;
		}

		req.setAttribute("storeLevel", storeLevel);

		req.getRequestDispatcher("/views/admin/storelevel-detail.jsp").forward(req, resp);
	}

	private void storeLevelList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int pageSize = 4;
		int pageNumber = 0;

		float temp = (float) daoStoreLevelImpl.countAllStoreLevels() / pageSize;
		int totalPages = (float) ((int) temp) < temp ? (int) temp : (int) temp - 1;
		try {
			pageNumber = Integer.valueOf(req.getParameter("page"));
		} catch (Exception e) {
			// TODO: handle exception
		}

		List<StoreLevel> storeLevels = daoStoreLevelImpl.getAllStoreLevelsPagination(pageNumber, pageSize);

		req.setAttribute("storeLevels", storeLevels);
		req.setAttribute("totalPages", totalPages);
		req.setAttribute("number", pageNumber);
		req.getRequestDispatcher("/views/admin/storelevel-list.jsp").forward(req, resp);
	}
}
