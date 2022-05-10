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
 * Servlet implementation class UpdateMedicine
 */
public class UpdateMedicine extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMedicine() {
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
		
		int id=Integer.parseInt(request.getParameter("prd_id"));
		String name=request.getParameter("prd_name");
		String company=request.getParameter("comp_name");
		String category=request.getParameter("category");
		String  qty=request.getParameter("quantity");
		double ppu=Double.parseDouble(request.getParameter("price"));
		double price=Double.parseDouble(String.format("%.2f", ppu));
		try {
			Connection con=JDBCClass.getCon();
		    PreparedStatement ps=con.prepareStatement("UPDATE medicine SET product_name=?,company_name=?,product_category=?,product_qty=?,product_price=? WHERE product_id=?");
		    ps.setString(1, name);
		    ps.setString(2, company);
		    ps.setString(3,category);
		    ps.setString(4,qty);
		    ps.setDouble(5,price);
		    ps.setInt(6, id);
		    int a=ps.executeUpdate();
		    if(a!=0)
		    {
		    PrintWriter out=response.getWriter();
		    out.println("<script type=\"text/javascript\">");
		    out.println("alert('Updated Successfully');");
		    out.println("location='viewStock.jsp';");
		    out.println("</script>");
		    }else {		    	
		    }
		}catch (Exception e) {
			// TODO: handle exception
		e.printStackTrace();
		}
	}

}
