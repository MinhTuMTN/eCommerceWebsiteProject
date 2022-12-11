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

@WebFilter(urlPatterns = "/admin/*")
public class AdminFeaturesFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;

		Integer id = null;
		Integer role = null;
		try {
			Cookie[] cookies = req.getCookies();
			if (cookies != null)
				for (Cookie ck : cookies)
					if ("id".equals(ck.getName()))
						id = Integer.valueOf(ck.getValue());
					else if ("role".equals(ck.getName()))
						role = Integer.valueOf(ck.getValue());
			if (role != null) {
				if (id != null && role == 0) {
					chain.doFilter(request, response);
					return;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendRedirect(req.getContextPath() + "/dang-nhap");
			return;
		}

		resp.sendRedirect(req.getContextPath() + "/dang-nhap");

	}

}