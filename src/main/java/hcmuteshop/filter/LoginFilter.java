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

import hcmuteshop.dao.impl.DAOUserImpl;
import hcmuteshop.entity.User;

@WebFilter(urlPatterns = {"/*"})
public class LoginFilter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
        
		try {
			Cookie[] cookies = req.getCookies();
	        if (cookies != null)
	          for (Cookie ck : cookies) 
	            if ("id".equals(ck.getName()))  {            
	            	int id = Integer.valueOf(ck.getValue());
	            	User user = (new DAOUserImpl()).findUserById(id);
	            	String userName = user.getFirstName() + " " + user.getLastName();
	            	req.setAttribute("userName", userName);
	            	req.setAttribute("role", user.getRole());
	            }
		}catch (Exception e) {
			// TODO: handle exception
		}
        
                         
        chain.doFilter(request, response);
		
	}

}
