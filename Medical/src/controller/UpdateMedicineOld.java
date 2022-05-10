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
 * Servlet implementation class UpdateMedicineOld
 */
public class UpdateMedicineOld extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMedicineOld() {
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
		
		int prd_id=Integer.parseInt(request.getParameter("pr_id"));
        try {
       	 Connection con=JDBCClass.getCon();
       	 PreparedStatement ps=con.prepareStatement("select * from medicine where  product_id=?");
       	 ps.setInt(1, prd_id);
       	 //request.setAttribute("id",prd_id);
       	 ResultSet rs=ps.executeQuery();
       	 while(rs.next())
       	 {    request.setAttribute("id", prd_id);
       		 request.setAttribute("name", rs.getString(2));
       		 request.setAttribute("company", rs.getString(3));
       		 request.setAttribute("category",rs.getString(4));
       		 request.setAttribute("qty",rs.getInt(5));
       		 request.setAttribute("price", rs.getDouble(6));
       	 }
       	 request.getRequestDispatcher("UpdateMedicine.jsp").forward(request, response);
       	 
        }catch (Exception e) {
			// TODO: handle exception
       	 e.printStackTrace();
		}
	}

}
