package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import Model.JDBCClass;

/**
 * Servlet implementation class UpdateUserNew
 */
public class UpdateUserNew extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserNew() {
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
		
		int id=Integer.parseInt(request.getParameter("id"));
		String name=request.getParameter("firstname");
		String email=request.getParameter("email");
		String mobile=request.getParameter("phone");
		String  gender=request.getParameter("gender1");
		String Add=request.getParameter("address");
		try {
			Connection con=JDBCClass.getCon();
		    PreparedStatement ps=con.prepareStatement("UPDATE user SET user_name=?,user_mobile=?,user_email=?,user_address=?,user_gender=? WHERE id=?");
		    ps.setString(1, name);
		    ps.setString(2, mobile);
		    ps.setString(3,email);
		    ps.setString(4,Add);
		    ps.setString(5,gender);
		    ps.setInt(6, id);
		    int a=ps.executeUpdate();
		    if(a!=0)
		    {
		    PrintWriter out=response.getWriter();
		    out.println("<script type=\"text/javascript\">");
		    out.println("alert('Updated Successfully');");
		    out.println("location='ViewUser';");
		    out.println("</script>");
		    }else {		    	
		    }
		}catch (Exception e) {
			// TODO: handle exception
		e.printStackTrace();
		}
	}

}
