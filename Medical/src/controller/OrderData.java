package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.JDBCClass;

/**
 * Servlet implementation class OrderData
 */
public class OrderData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderData() {
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
		int id=Integer.parseInt(request.getParameter("p1"));
//		System.out.println(id);
		try {
			response.setContentType("text/html");
		    PrintWriter out = response.getWriter();
	
			Connection con=JDBCClass.getCon();
			PreparedStatement ps=con.prepareStatement("select product_name,product_qty,product_ppu,calculated_amount from items where order_id=?");
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			out.println("<table>");
			int i=1;
			while(rs.next())
			{
				
				 out.println("<tr><td>" + i +"</td><td>" + rs.getString(1) + "</td><td>" + rs.getInt(2) + "</td><td>" + rs.getDouble(3) + "</td><td>"+ rs.getDouble(4)+"</td></tr>");
			i++;
			}
			out.println("</table>");  	  
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}

}
