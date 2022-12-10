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

import com.dao.admin.impl.DAODeliveryImpl;
import com.entity.Delivery;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = {"/admin/deliveries",  "/admin/delivery-detail", "/admin/add-delivery",
		"/admin/update-delivery", "/admin/delete-delivery", "/admin/restore-delivery"})
public class DeliveriesController extends HttpServlet{
	DAODeliveryImpl daoDeliveryImpl = new DAODeliveryImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURL().toString();

		if (url.contains("/deliveries")) {
			deliveryList(req, resp);
		} else if (url.contains("/delivery-detail")) {
			deliveryDetail(req, resp);
		} else if (url.contains("/add-delivery")) {
			req.getRequestDispatcher("/views/admin/delivery-add.jsp").forward(req, resp);
		} else if (url.contains("/update-delivery")) {
			int deliveryId = Integer.valueOf(req.getParameter("deliveryId"));
			Delivery delivery = daoDeliveryImpl.getDeliveryById(deliveryId);
			req.setAttribute("delivery", delivery);
			req.getRequestDispatcher("/views/admin/delivery-update.jsp").forward(req, resp);
		} else if (url.contains("/delete-delivery")) {
			deleteDelivery(req, resp);
		} else if (url.contains("/restore-delivery")) {
			restoreDelivery(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURL().toString();
		if (url.contains("/add-delivery")) {
			addDelivery(req, resp);
		} else if (url.contains("/update-delivery")) {
			updateDelivery(req, resp);
		}
	}

	private void restoreDelivery(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Delivery delivery = daoDeliveryImpl.getDeliveryById(Integer.valueOf(req.getParameter("deliveryId")));
		String message = "";
		if (daoDeliveryImpl.restoreDelivery(delivery)) {
			message = "Khôi phục cấp độ người dùng thành công!";
		} else {
			message = "Khôi phục cấp độ người dùng thất bại!";
		}

		req.setAttribute("message", message);

		resp.sendRedirect(req.getContextPath() + "/admin/deliveries");
		return;

	}

	private void deleteDelivery(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Delivery delivery = daoDeliveryImpl.getDeliveryById(Integer.valueOf(req.getParameter("deliveryId")));
		String message = "";
		if (daoDeliveryImpl.deleteDelivery(delivery)) {
			message = "Xóa cấp độ người dùng thành công!";
		} else {
			message = "Xóa cấp độ người dùng thất bại!";
		}

		req.setAttribute("message", message);

		resp.sendRedirect(req.getContextPath() + "/admin/deliveries");
		return;

	}

	private void updateDelivery(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int deliveryId = Integer.valueOf(req.getParameter("deliveryId"));
			Delivery oldDelivery = daoDeliveryImpl.getDeliveryById(deliveryId);
			Delivery delivery = new Delivery();
			delivery.setCreatedAt(oldDelivery.getCreatedAt());
			BeanUtils.populate(delivery, req.getParameterMap());

			Date updatedAt = new Date(System.currentTimeMillis());
			delivery.setUpdatedAt(updatedAt);

			daoDeliveryImpl.updateDelivery(delivery);

			req.setAttribute("message", "Cập nhật loại sản phẩm thành công!");

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("message", "Cập nhật loại sản phẩm thất bại. Eror: " + e.getMessage());
		}

		resp.sendRedirect(req.getContextPath() + "/admin/deliveries");
		return;
	}

	private void addDelivery(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Delivery delivery = new Delivery();

			BeanUtils.populate(delivery, req.getParameterMap());

			Date createdAt = new Date(System.currentTimeMillis());
			delivery.setCreatedAt(createdAt);
			delivery.setUpdatedAt(createdAt);

			daoDeliveryImpl.insertDelivery(delivery);

			req.setAttribute("message", "Thêm loại sản phẩm thành công!");

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("message", "Thêm loại sản phẩm thất bại. Eror: " + e.getMessage());
		}

		resp.sendRedirect(req.getContextPath() + "/admin/deliveries");
		return;
	}

	private void deliveryDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int deliveryId = Integer.valueOf(req.getParameter("deliveryId"));
		Delivery delivery = daoDeliveryImpl.getDeliveryById(deliveryId);

		if (delivery == null) {
			resp.sendRedirect(req.getContextPath() + "/admin/deliveries");
			return;
		}

		req.setAttribute("delivery", delivery);

		req.getRequestDispatcher("/views/admin/delivery-detail.jsp").forward(req, resp);
	}

	private void deliveryList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int pageSize = 4;
		int pageNumber = 0;

		float temp = (float) daoDeliveryImpl.countAllDeliveries() / pageSize;
		int totalPages = (float) ((int) temp) < temp ? (int) temp : (int) temp - 1;
		try {
			pageNumber = Integer.valueOf(req.getParameter("page"));
		} catch (Exception e) {
			// TODO: handle exception
		}

		List<Delivery> deliveries = daoDeliveryImpl.getAllDeliveriesPagination(pageNumber, pageSize);

		req.setAttribute("deliveries", deliveries);
		req.setAttribute("totalPages", totalPages);
		req.setAttribute("number", pageNumber);
		req.getRequestDispatcher("/views/admin/delivery-list.jsp").forward(req, resp);
	}
}
