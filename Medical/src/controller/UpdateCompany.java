package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.JDBCClass;

/**
 * Servlet implementation class UpdateCompany
 */
public class UpdateCompany extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCompany() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	       doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int comp_id=Integer.parseInt(request.getParameter("comp_id"));
		try {
			//System.out.println(comp_id);
			Connection con=JDBCClass.getCon();
	       	 PreparedStatement ps=con.prepareStatement("select * from companynames where  company_id=?");
	       	 ps.setInt(1, comp_id);
	       	 //request.setAttribute("id",prd_id);
	       	 ResultSet rs=ps.executeQuery();
	       	 while(rs.next())
	       	 {    request.setAttribute("id", comp_id);
	       		 request.setAttribute("name", rs.getString(2));
	       		 request.setAttribute("companyemail", rs.getString(3));
	       		 request.setAttribute("contact",rs.getString(4));
	       		 request.setAttribute("address",rs.getString(5));
	       	 }
	       	 request.getRequestDispatcher("UpdateCompany.jsp").forward(request, response);
	       	 
	        }catch (Exception e) {
				// TODO: handle exception
	       	 e.printStackTrace();
			}
	}

}
