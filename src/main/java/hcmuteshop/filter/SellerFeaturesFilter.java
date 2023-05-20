package hcmuteshop.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hcmuteshop.dao.seller.impl.DAOOrderSellerImpl;
import hcmuteshop.dao.seller.impl.DAOProductSellerImpl;

@WebFilter(urlPatterns = "/seller/*")
public class SellerFeaturesFilter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		
		Integer id = null;
		Integer role = null;
		Long storeId = null;
		try {
			Cookie[] cookies = req.getCookies();
			if (cookies != null)
				for (Cookie ck : cookies)
					if ("id".equals(ck.getName()))
						id = Integer.valueOf(ck.getValue());
					else if ("role".equals(ck.getName()))
						role = Integer.valueOf(ck.getValue());
					else if ("storeId".equals(ck.getName()))
						storeId = Long.valueOf(ck.getValue());
			if(id != null && role == 1){
				int ordersCount = new DAOOrderSellerImpl().countOrdersProcessing(id);
				req.setAttribute("ordersCount", ordersCount);
				
				int productsSoldOut =  new DAOProductSellerImpl().countProductsSoldOut(storeId);
				req.setAttribute("productsSoldOut", productsSoldOut);
				chain.doFilter(request, response);
				return;
			}
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendRedirect(req.getContextPath() + "/dang-nhap");
			return;
		}

		resp.sendRedirect(req.getContextPath() + "/dang-nhap");
		
	}
	
}
