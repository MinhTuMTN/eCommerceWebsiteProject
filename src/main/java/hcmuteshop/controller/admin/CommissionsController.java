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

import hcmuteshop.dao.admin.impl.DAOCommissionImpl;
import hcmuteshop.entity.Commission;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = {"/admin/commissions",  "/admin/commission-detail", "/admin/add-commission",
		"/admin/update-commission", "/admin/delete-commission", "/admin/restore-commission"})
public class CommissionsController extends HttpServlet{
	DAOCommissionImpl daoCommissionImpl = new DAOCommissionImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURL().toString();

		if (url.contains("/commissions")) {
			commissionList(req, resp);
		} else if (url.contains("/commission-detail")) {
			commissionDetail(req, resp);
		} else if (url.contains("/add-commission")) {
			req.getRequestDispatcher("/views/admin/commission-add.jsp").forward(req, resp);
		} else if (url.contains("/update-commission")) {
			Long commissionId = Long.valueOf(req.getParameter("commissionId"));
			Commission commission = daoCommissionImpl.getCommissionById(commissionId);
			req.setAttribute("commission", commission);
			req.getRequestDispatcher("/views/admin/commission-update.jsp").forward(req, resp);
		} else if (url.contains("/delete-commission")) {
			deleteCommission(req, resp);
		} else if (url.contains("/restore-commission")) {
			restoreCommission(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURL().toString();
		if (url.contains("/add-commission")) {
			addCommission(req, resp);
		} else if (url.contains("/update-commission")) {
			updateCommission(req, resp);
		}
	}

	private void restoreCommission(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Commission commission = daoCommissionImpl.getCommissionById(Long.valueOf(req.getParameter("commissionId")));
		String message = "";
		if (daoCommissionImpl.restoreCommission(commission)) {
			message = "Khôi phục cấp độ người dùng thành công!";
		} else {
			message = "Khôi phục cấp độ người dùng thất bại!";
		}

		req.setAttribute("message", message);

		resp.sendRedirect(req.getContextPath() + "/admin/commissions");
		return;

	}

	private void deleteCommission(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Commission commission = daoCommissionImpl.getCommissionById(Long.valueOf(req.getParameter("commissionId")));
		String message = "";
		if (daoCommissionImpl.deleteCommission(commission)) {
			message = "Xóa cấp độ người dùng thành công!";
		} else {
			message = "Xóa cấp độ người dùng thất bại!";
		}

		req.setAttribute("message", message);

		resp.sendRedirect(req.getContextPath() + "/admin/commissions");
		
		return;

	}

	private void updateCommission(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Long commissionId = Long.valueOf(req.getParameter("commissionId"));
			Commission oldCommission = daoCommissionImpl.getCommissionById(commissionId);
			Commission commission = new Commission();
			commission.setCreatedAt(oldCommission.getCreatedAt());
			BeanUtils.populate(commission, req.getParameterMap());

			Date updatedAt = new Date(System.currentTimeMillis());
			commission.setUpdatedAt(updatedAt);

			daoCommissionImpl.updateCommission(commission);

			req.setAttribute("message", "Cập nhật loại sản phẩm thành công!");

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("message", "Cập nhật loại sản phẩm thất bại. Eror: " + e.getMessage());
		}

		resp.sendRedirect(req.getContextPath() + "/admin/commissions");
		return;
	}

	private void addCommission(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Commission commission = new Commission();

			BeanUtils.populate(commission, req.getParameterMap());

			Date createdAt = new Date(System.currentTimeMillis());
			commission.setCreatedAt(createdAt);
			commission.setUpdatedAt(createdAt);

			daoCommissionImpl.insertCommission(commission);

			req.setAttribute("message", "Thêm loại sản phẩm thành công!");

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("message", "Thêm loại sản phẩm thất bại. Eror: " + e.getMessage());
		}

		resp.sendRedirect(req.getContextPath() + "/admin/commissions");
		return;
	}

	private void commissionDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long commissionId = Long.valueOf(req.getParameter("commissionId"));
		Commission commission = daoCommissionImpl.getCommissionById(commissionId);

		if (commission == null) {
			resp.sendRedirect(req.getContextPath() + "/admin/commissions");
			return;
		}

		req.setAttribute("commission", commission);

		req.getRequestDispatcher("/views/admin/commission-detail.jsp").forward(req, resp);
	}

	private void commissionList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int pageSize = 4;
		int pageNumber = 0;

		float temp = (float) daoCommissionImpl.countAllCommissions() / pageSize;
		int totalPages = (float) ((int) temp) < temp ? (int) temp : (int) temp - 1;
		try {
			pageNumber = Integer.valueOf(req.getParameter("page"));
		} catch (Exception e) {
			// TODO: handle exception
		}

		List<Commission> commissions = daoCommissionImpl.getAllCommissionsPagination(pageNumber, pageSize);

		req.setAttribute("commissions", commissions);
		req.setAttribute("totalPages", totalPages);
		req.setAttribute("number", pageNumber);
		req.getRequestDispatcher("/views/admin/commission-list.jsp").forward(req, resp);
	}
}
