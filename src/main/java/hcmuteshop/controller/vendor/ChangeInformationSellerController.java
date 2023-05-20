package hcmuteshop.controller.vendor;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import hcmuteshop.dao.seller.impl.DAOStoreSellerImpl;
import hcmuteshop.entity.Store;
import hcmuteshop.util.Constant;

@WebServlet(urlPatterns = "/seller/change-information")
public class ChangeInformationSellerController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("fnProfile", true);
		int storeId = 0;
		for (Cookie cookie : req.getCookies())
			if (cookie.getName().equals("id"))
				storeId = Integer.valueOf(cookie.getValue());
		Store store = new DAOStoreSellerImpl().getStoreByUserId(storeId);
		req.setAttribute("store", store);
		req.getRequestDispatcher("/views/seller/shop-change-information.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int storeId = 0;
		for (Cookie cookie : req.getCookies())
			if (cookie.getName().equals("id"))
				storeId = Integer.valueOf(cookie.getValue());
		Store store = new DAOStoreSellerImpl().getStoreByUserId(storeId);
		if (store == null)
			return;

		DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
		ServletFileUpload servletFileUpload = new ServletFileUpload(diskFileItemFactory);
		servletFileUpload.setHeaderEncoding("UTF-8");

		try {
			List<FileItem> items = servletFileUpload.parseRequest(req);
			for (FileItem item : items) {
				if (item.getFieldName().equals("name")) {
					store.setName(item.getString("UTF-8"));
				} else if (item.getFieldName().equals("avatar")) {
					String originalFileName = item.getName();
					if (originalFileName == "")
						continue;

					int index = originalFileName.lastIndexOf(".");
					String ext = originalFileName.substring(index + 1);
					String fileName = System.currentTimeMillis() + "." + ext;

					// Custom
					File file = new File(Constant.DIR + "/Stores/" + fileName);
					item.write(file);

					// Custom
					store.setAvatar(fileName);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		new DAOStoreSellerImpl().updateStore(store);
		resp.sendRedirect(req.getContextPath() + "/seller/home");
	}
}
