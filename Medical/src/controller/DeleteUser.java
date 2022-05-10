package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import Model.JDBCClass;

/**
 * Servlet implementation class DeleteUser
 */
public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUser() {
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
		
		String id=request.getParameter("id");
		try
		{
			  Connection con=JDBCClass.getCon();
			  PreparedStatement ps=con.prepareStatement("DELETE FROM user WHERE id=?");
			  ps.setString(1, id);
			  int i=ps.executeUpdate();
			  if(i!=0){
				  PrintWriter out=response.getWriter();
				    out.println("<script type=\"text/javascript\">");
				    out.println("alert('Deleted Successfully');");
				    out.println("location='ViewUser';");
				    out.println("</script>");
			}
			  else {
				  RequestDispatcher rd=request.getRequestDispatcher("view.jsp");
		          rd.forward(request, response);
			  }
		}
		catch(Exception e)
		{
		e.printStackTrace();
		}
		
	}

}
