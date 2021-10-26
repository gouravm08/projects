package controller;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.JDBCClass;

/**
 * Servlet implementation class AdminLoginServlet
 */
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginServlet() {
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
		
		String name=request.getParameter("username");
		String password=request.getParameter("password");
	  try {
		  Class.forName("com.mysql.jdbc.Driver");
		  Connection   con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","");
	   // con=JDBCClass.getCon();
	  PreparedStatement ps=null;
	   ps=con.prepareStatement("SELECT * FROM `admin` WHERE `admin_name`=? AND `admin_password`=?  OR `admin_email`=? AND `admin_password`=?");
	  ps.setString(1,name);
	  ps.setString(2,password);
	  ps.setString(3, name);
	  ps.setString(4,password);
	  ResultSet rs=ps.executeQuery();
	  boolean validationFlag=false;
	   if(rs.next())
	   {
			/*
			 * RequestDispatcher rd=request.getRequestDispatcher("admin_dashboard.jsp");
			 * rd.forward(request, response);
			 */
		  
		   HttpSession session=request.getSession();
		   session.setAttribute("admin_name", name);
		   validationFlag=true;
		   //response.sendRedirect("admin_dashboard.jsp");
	   }
	   if(validationFlag){                
           response.setContentType("text/html;charset=UTF-8");
           response.getWriter().write("True");
 }
	  }
	  catch(Exception e)
	  {
		  e.printStackTrace();
	  }
	}

}
