package filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class AdminFilter
 */
public class AdminFilter implements Filter {

    /**
     * Default constructor. 
     */
    public AdminFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		HttpServletRequest req=(HttpServletRequest)request;
		HttpSession session=req.getSession();
		String admin_name=(String)session.getAttribute("admin_name");
		
		/*
		 * HttpServletResponse respond = (HttpServletResponse) response;
		 * respond.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //
		 * HTTP 1.1. respond.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		 * respond.setDateHeader("Expires", 0); // Proxies.
		 */
		// pass the request along the filter chain
		if(admin_name!=null)
			chain.doFilter(request, response);
		else
		{
			HttpServletResponse res=(HttpServletResponse)response;
			res.sendRedirect("AdminLogin.jsp");
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
