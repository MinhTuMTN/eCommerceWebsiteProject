package hcmuteshop.controller.admin;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import hcmuteshop.dao.admin.impl.DAOUserLevelImpl;
import hcmuteshop.entity.UserLevel;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = {"/admin/userlevels",  "/admin/userlevel-detail", "/admin/add-userlevel",
		"/admin/update-userlevel", "/admin/delete-userlevel", "/admin/restore-userlevel"})
public class UserLevelsController extends HttpServlet{
	DAOUserLevelImpl daoUserLevelImpl = new DAOUserLevelImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURL().toString();

		if (url.contains("/userlevels")) {
			userLevelList(req, resp);
		} else if (url.contains("/userlevel-detail")) {
			userLevelDetail(req, resp);
		} else if (url.contains("/add-userlevel")) {
			req.getRequestDispatcher("/views/admin/userlevel-add.jsp").forward(req, resp);
		} else if (url.contains("/update-userlevel")) {
			int userLevelId = Integer.valueOf(req.getParameter("userLevelId"));
			UserLevel userLevel = daoUserLevelImpl.getUserLevelById(userLevelId);
			req.setAttribute("userLevel", userLevel);
			req.getRequestDispatcher("/views/admin/userlevel-update.jsp").forward(req, resp);
		} else if (url.contains("/delete-userlevel")) {
			deleteUserLevel(req, resp);
		} else if (url.contains("/restore-userlevel")) {
			restoreUserLevel(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURL().toString();
		if (url.contains("/add-userlevel")) {
			addUserLevel(req, resp);
		} else if (url.contains("/update-userlevel")) {
			updateUserLevel(req, resp);
		}
	}

	private void restoreUserLevel(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		UserLevel userLevel = daoUserLevelImpl.getUserLevelById(Integer.valueOf(req.getParameter("userLevelId")));
		String message = "";
		if (daoUserLevelImpl.restoreUserLevel(userLevel)) {
			message = "Khôi phục cấp độ người dùng thành công!";
		} else {
			message = "Khôi phục cấp độ người dùng thất bại!";
		}

		req.setAttribute("message", message);

		resp.sendRedirect(req.getContextPath() + "/admin/userlevels");
		return;

	}

	private void deleteUserLevel(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserLevel userLevel = daoUserLevelImpl.getUserLevelById(Integer.valueOf(req.getParameter("userLevelId")));
		String message = "";
		if (daoUserLevelImpl.deleteUserLevel(userLevel)) {
			message = "Xóa cấp độ người dùng thành công!";
		} else {
			message = "Xóa cấp độ người dùng thất bại!";
		}

		req.setAttribute("message", message);

		resp.sendRedirect(req.getContextPath() + "/admin/userlevels");
		return;

	}

	private void updateUserLevel(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int userLevelId = Integer.valueOf(req.getParameter("userLevelId"));
			UserLevel oldUserLevel = daoUserLevelImpl.getUserLevelById(userLevelId);
			UserLevel userLevel = new UserLevel();
			userLevel.setCreatedAt(oldUserLevel.getCreatedAt());
			BeanUtils.populate(userLevel, req.getParameterMap());

			Date updatedAt = new Date(System.currentTimeMillis());
			userLevel.setUpdatedAt(updatedAt);

			daoUserLevelImpl.updateUserLevel(userLevel);

			req.setAttribute("message", "Cập nhật loại sản phẩm thành công!");

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("message", "Cập nhật loại sản phẩm thất bại. Eror: " + e.getMessage());
		}

		resp.sendRedirect(req.getContextPath() + "/admin/userlevels");
		return;
	}

	private void addUserLevel(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			UserLevel userLevel = new UserLevel();

			BeanUtils.populate(userLevel, req.getParameterMap());

			Date createdAt = new Date(System.currentTimeMillis());
			userLevel.setCreatedAt(createdAt);
			userLevel.setUpdatedAt(createdAt);

			daoUserLevelImpl.insertUserLevel(userLevel);

			req.setAttribute("message", "Thêm loại sản phẩm thành công!");

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("message", "Thêm loại sản phẩm thất bại. Eror: " + e.getMessage());
		}

		resp.sendRedirect(req.getContextPath() + "/admin/userlevels");
		return;
	}

	private void userLevelDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int userLevelId = Integer.valueOf(req.getParameter("userLevelId"));
		UserLevel userLevel = daoUserLevelImpl.getUserLevelById(userLevelId);

		if (userLevel == null) {
			resp.sendRedirect(req.getContextPath() + "/admin/userlevels");
			return;
		}

		req.setAttribute("userLevel", userLevel);

		req.getRequestDispatcher("/views/admin/userlevel-detail.jsp").forward(req, resp);
	}

	private void userLevelList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int pageSize = 4;
		int pageNumber = 0;

		float temp = (float) daoUserLevelImpl.countAllUserLevels() / pageSize;
		int totalPages = (float) ((int) temp) < temp ? (int) temp : (int) temp - 1;
		try {
			pageNumber = Integer.valueOf(req.getParameter("page"));
		} catch (Exception e) {
			// TODO: handle exception
		}

		List<UserLevel> userLevels = daoUserLevelImpl.getAllUserLevelsPagination(pageNumber, pageSize);

		req.setAttribute("userLevels", userLevels);
		req.setAttribute("totalPages", totalPages);
		req.setAttribute("number", pageNumber);
		req.getRequestDispatcher("/views/admin/userlevel-list.jsp").forward(req, resp);
	}
}
