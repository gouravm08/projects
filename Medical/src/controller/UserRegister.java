package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.*;

/**
 * Servlet implementation class UserRegister
 */
public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegister() {
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
	
		user_registration user=new user_registration();
		//String password=request.getParameter("password");
		//String password1=request.getParameter("password1");
		
		user.setUser_name(request.getParameter("firstname"));
		user.setGender(request.getParameter("gender1"));
		user.setMob(request.getParameter("phone"));
		user.setAddress(request.getParameter("address"));
		user.setEmail(request.getParameter("email"));
		user.setPassword(request.getParameter("password"));
		try {
		  Connection con=JDBCClass.getCon();
		  PreparedStatement ps=con.prepareStatement("INSERT INTO `user` (`user_name`, `user_mobile`, `user_password`, `user_email`, `user_address`, `user_gender`) VALUES (?,?,?,?,?,?)");
     		ps.setString(1, user.getUser_name());
     		ps.setString(2,user.getMob());
     		ps.setString(3,user.getPassword());
     		ps.setString(4,user.getEmail());
     		ps.setString(5,user.getAddress());
     		ps.setString(6,user.getGender());
     		int a=ps.executeUpdate();	
			  if(a!=0)
			  { 
				    PrintWriter out=response.getWriter();
				    out.println("<script type=\"text/javascript\">");
				    out.println("alert('Created Successfully');");
				    out.println("location='UserSignup.jsp';");
				    out.println("</script>");
				  //RequestDispatcher rd=request.getRequestDispatcher("adminDashboard.jsp");
		            //      rd.forward(request, response);
			  }
			  else {
				  PrintWriter out=response.getWriter();
				    out.println("<script type=\"text/javascript\">");
				    out.println("alert('Something went wrong');");
				    out.println("location='admin_dashboard.jsp';");
				    out.println("</script>");
				  //RequestDispatcher rd=request.getRequestDispatcher("UserRegister.jsp");
				  //rd.include(request, response);
			  }
			 
     		
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
