package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.JDBCClass;

/**
 * Servlet implementation class Updateuser
 */
public class UpdateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUser() {
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
		//System.out.println(id);
		String name=null;
		String mobile=null;
		String email=null;
		String address=null;
		String gender=null;
		Connection con=null;
		try {
			con=JDBCClass.getCon();
			String sql="select * from user where id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				 name=rs.getString(2);
				 mobile=rs.getString(3);
				 email=rs.getString(5);
				 address=rs.getString(6);
				 gender=rs.getString(7);
			}
			request.setAttribute("id", id);
			request.setAttribute("name", name);
			request.setAttribute("mobile", mobile);
			request.setAttribute("email",email);
			request.setAttribute("address",address);
			request.setAttribute("gender", gender);
			RequestDispatcher rd=request.getRequestDispatcher("Update.jsp");
			rd.include(request, response);
		}
		catch (Exception e) {
			// TODO: handle exception
		e.printStackTrace();
		}
	}

}
