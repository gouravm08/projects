package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.*;


/**
 * Servlet implementation class AddCompany
 */
public class AddCompany extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCompany() {
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
		CompanyBeen cb=new CompanyBeen();
		   cb.setCompanyName(request.getParameter("companyname"));
		   cb.setCompanyEmail(request.getParameter("companyemail"));
		   cb.setCompanyPhone(request.getParameter("mobile"));
		   cb.setCompanyAddress(request.getParameter("companyAddress"));
		   try {
			   Connection con = JDBCClass.getCon(); 
			   PreparedStatement ps=con.prepareStatement("insert into companynames(comany_name,company_email,company_contact,company_Address) values(?,?,?,?)");
		         ps.setString(1, cb.getCompanyName());
		         ps.setString(2, cb.getCompanyEmail());
		         ps.setString(3, cb.getCompanyPhone());
		          ps.setString(4, cb.getCompanyAddress());
		          int a=ps.executeUpdate();
		      	
				  if(a!=0)
				  {
					  RequestDispatcher rd=request.getRequestDispatcher("ViewCompany?status=1");
			                  rd.forward(request, response);
				  }
				  else {
					  RequestDispatcher rd=request.getRequestDispatcher("UserDashboard.jsp");
					  rd.include(request, response);
				  }
		   }catch (Exception e) {
			// TODO: handle exception
		}
		   
	}

}
