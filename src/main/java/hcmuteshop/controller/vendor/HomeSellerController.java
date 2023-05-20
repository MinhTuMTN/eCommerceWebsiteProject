package hcmuteshop.controller.vendor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hcmuteshop.dao.seller.impl.DAOStoreSellerImpl;
import hcmuteshop.entity.Store;

@WebServlet(urlPatterns = "/seller/home")
public class HomeSellerController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("fnProfile", true);
		int storeId = 0;
		for(Cookie cookie : req.getCookies())
			if(cookie.getName().equals("id"))
				storeId = Integer.valueOf(cookie.getValue());
		Store store = new DAOStoreSellerImpl().getStoreByUserId(storeId);
		req.setAttribute("store", store);	
		req.getRequestDispatcher("/views/seller/shop-profile.jsp").forward(req, resp);
	}
}
