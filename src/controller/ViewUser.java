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
 * Servlet implementation class ViewUser
 */
public class ViewUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ArrayList al=new ArrayList();
		try {
			 
			    	Connection con=JDBCClass.getCon();
			        PreparedStatement ps=con.prepareStatement("select * from user");
			        ResultSet rs=ps.executeQuery();
			        while(rs.next())
			        {
			        	user_registration u=new user_registration();
			        	u.setId(rs.getInt(1));
			        	u.setUser_name(rs.getString(2));
			        	u.setMob(rs.getString(3));
			        	u.setEmail(rs.getString(5));
			        	u.setAddress(rs.getString(6));
			        	u.setGender(rs.getString(7));
			          al.add(u);
			          //System.out.println(u);
			        }
			    request.getServletContext().setAttribute("USER",al);
			    //request.getRequestDispatcher("view.jsp").forward(request, response);
			    response.sendRedirect("view.jsp");
		}catch (Exception e) {
			// TODO: handle exception
	   e.printStackTrace();
		}
	}

}
