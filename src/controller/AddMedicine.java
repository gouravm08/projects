package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import Model.JDBCClass;

/**
 * Servlet implementation class AddMedicine
 */
public class AddMedicine extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMedicine() {
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
		//doGet(request, response);
		String name=request.getParameter("medicinename");
		String company=request.getParameter("company_name");
		String category=request.getParameter("category");
		int qty=Integer.parseInt(request.getParameter("quantity"));
		double ppu=Double.parseDouble(request.getParameter("price"));
		double price=Double.parseDouble(String.format("%.2f", ppu));
		try {
			Connection con=JDBCClass.getCon();
			PreparedStatement ps=con.prepareStatement("insert into medicine(product_name,company_name,product_category,product_qty,product_price) values(?,?,?,?,?)");
			ps.setString(1, name);
			ps.setString(2, company);
			ps.setString(3, category);
			ps.setInt(4, qty);
			ps.setDouble(5, price);
			
			int a=ps.executeUpdate();
	
			  if(a!=0)
			  {
				  response.sendRedirect("viewStock.jsp");
			  }
			  else {
				 // RequestDispatcher rd=request.getRequestDispatcher("UserDashboard.jsp");
				  response.sendRedirect("UserDashboard.jsp");
				  //rd.include(request, response);
			  }

		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}

}
