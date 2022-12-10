package com.filter;

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

import com.dao.impl.DAOUserImpl;
import com.entity.User;

@WebFilter(urlPatterns = {"/addToCart", "/cart", "/updateCart", "/productId", "/payment"})
public class UserFeaturesFilter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
        
		try {
			Cookie[] cookies = req.getCookies();
	        if (cookies != null)
	          for (Cookie ck : cookies) 
	            if ("id".equals(ck.getName()))  {            
	            	chain.doFilter(request, response);
	            	return;
	            }
		}catch (Exception e) {
			e.printStackTrace();
			resp.sendRedirect(req.getContextPath() + "/dang-nhap");
		}
        
                         
		resp.sendRedirect(req.getContextPath() + "/dang-nhap");
	}

}
