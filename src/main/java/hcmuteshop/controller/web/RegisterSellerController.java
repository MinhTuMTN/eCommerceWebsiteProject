package hcmuteshop.controller.web;

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

import hcmuteshop.JPAConfig;
import hcmuteshop.dao.impl.DAOStoreImpl;
import hcmuteshop.entity.Store;
import hcmuteshop.entity.User;
import hcmuteshop.util.Constant;

@WebServlet(urlPatterns = "/register-seller")
public class RegisterSellerController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int userId = 0;
		for (Cookie cookie : req.getCookies())
			if (cookie.getName().equals("id"))
				userId = Integer.valueOf(cookie.getValue());
		if(JPAConfig.getEntityManager().find(User.class, userId).getStore() != null)
			req.setAttribute("isSeller", true);
		else
			req.setAttribute("isSeller", false);
		req.getRequestDispatcher("/views/web/register-seller.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int userId = 0;
		for (Cookie cookie : req.getCookies())
			if (cookie.getName().equals("id"))
				userId = Integer.valueOf(cookie.getValue());

		DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
		ServletFileUpload servletFileUpload = new ServletFileUpload(diskFileItemFactory);
		servletFileUpload.setHeaderEncoding("UTF-8");
		Store store = new Store();

		try {
			List<FileItem> items = servletFileUpload.parseRequest(req);
			for (FileItem item : items) {
				if (item.getFieldName().equals("storeName")) {
					store.setName(item.getString("UTF-8"));
				} else if (item.getFieldName().equals("avatar")) {
					String originalFileName = item.getName();
					if (originalFileName == "")
						continue;

					int index = originalFileName.lastIndexOf(".");
					String ext = originalFileName.substring(index + 1);
					String fileName = System.currentTimeMillis() + 1 + "." + ext;

					// Custom
					File file = new File(Constant.DIR + "/Stores/" + fileName);
					item.write(file);

					// Custom
					store.setAvatar(fileName);
				} else if (item.getFieldName().equals("cover")) {
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
					store.setCover(fileName);
				}
			}
			if(new DAOStoreImpl().registerSeller(store, userId)) {
				for (Cookie cookie : req.getCookies())
					if (cookie.getName().equals("role")) {
						cookie.setValue("1");
						resp.addCookie(cookie);
					}						
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		resp.sendRedirect(req.getContextPath() + "/seller/home");
	}
}
