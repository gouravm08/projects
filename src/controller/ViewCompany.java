package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import Model.*;

/**
 * Servlet implementation class ViewCompany
 */
public class ViewCompany extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewCompany() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		int status = Integer.parseInt(request.getParameter("status"));
		
		ArrayList al=new ArrayList();
		try {
			 
			    	Connection con=JDBCClass.getCon();
			        PreparedStatement ps=con.prepareStatement("select * from companynames");
			        ResultSet rs=ps.executeQuery();
			        while(rs.next())
			        {
			        	CompanyBeen u=new CompanyBeen();
			        	u.setCompany_id(rs.getInt(1));
			        	u.setCompanyName(rs.getString(2));
			        	u.setCompanyEmail(rs.getString(3));
			        	u.setCompanyPhone(rs.getString(4));
			        	u.setCompanyAddress(rs.getString(5));
			                al.add(u);
			         // System.out.println(u);
			        }
			    request.getServletContext().setAttribute("element",al);
			    if(status==1)
			    	response.sendRedirect("company.jsp");//user TAble
				    //request.getRequestDispatcher("company.jsp").include(request, response);
				    else
				    	response.sendRedirect("companyAdminView.jsp");//Admin Table
			    
				    	//request.getRequestDispatcher("companyAdminView.jsp").include(request, response);
			    //request.getRequestDispatcher("company.jsp").include(request, response);
		}catch (Exception e) {
			// TODO: handle exception
	   e.printStackTrace();
		}
	}

}
