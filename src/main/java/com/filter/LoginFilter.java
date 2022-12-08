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

import com.dao.impl.DAOUserImpl;
import com.entity.User;

@WebFilter(urlPatterns = {"/*"})
public class LoginFilter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
        
        Cookie[] cookies = req.getCookies();
        if (cookies != null)
          for (Cookie ck : cookies) 
            if ("id".equals(ck.getName()))  {            
            	int id = Integer.valueOf(ck.getValue());
            	User user = (new DAOUserImpl()).findUserById(id);
            	String userName = user.getFirstName() + " " + user.getLastName();
            	req.setAttribute("userName", userName);
            }
                         
        chain.doFilter(request, response);
		
	}

}
