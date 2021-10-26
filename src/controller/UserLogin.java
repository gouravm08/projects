package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import Model.JDBCClass;

/**
 * Servlet implementation class UserLogin
 */
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLogin() {
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
		
		String name=request.getParameter("username");
		String pass=request.getParameter("password");
		
		//Connection con=JDBCClass.getCon();
		try {
			 Class.forName("com.mysql.jdbc.Driver");
			  Connection   con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","");
			PreparedStatement ps=con.prepareStatement("select * from user where user_name=? and user_password=?");
			ps.setString(1,name);
			ps.setString(2, pass);
			 boolean validationFlag=false;
			ResultSet rs=ps.executeQuery();
			   if(rs.next())
			   {   
				   HttpSession session=request.getSession();
				   session.setAttribute("user_name", rs.getInt(1));
				   //response.sendRedirect("UserDashboard.jsp");
				   validationFlag=true;
				   //rd.forward(request, response);
			   }
			   
			   if(validationFlag){                
		           response.setContentType("text/html;charset=UTF-8");
		           response.getWriter().write("True");
		 }
		}catch (Exception e) {
			
			// TODO: handle exception
		}
	}

}
