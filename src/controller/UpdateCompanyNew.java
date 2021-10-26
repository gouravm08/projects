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
 * Servlet implementation class UpdateCompanyNew
 */
public class UpdateCompanyNew extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCompanyNew() {
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
		int id=Integer.parseInt(request.getParameter("comp_id"));
		String companyname=request.getParameter("companyname");
		String companyemail=request.getParameter("companyemail");
		String CompanyContact=request.getParameter("CompanyContact");
		String  companyAddress=request.getParameter("companyAddress");
		try {
			Connection con=JDBCClass.getCon();
		    PreparedStatement ps=con.prepareStatement("UPDATE companynames SET comany_name=?,company_email=?,company_contact=?,company_Address=? WHERE company_id=?");
		    ps.setString(1, companyname);
		    ps.setString(2, companyemail);
		    ps.setString(3,CompanyContact);
		    ps.setString(4,companyAddress);
		    ps.setInt(5, id);
		    int a=ps.executeUpdate();
		    if(a!=0)
		    {
		    PrintWriter out=response.getWriter();
		    out.println("<script type=\"text/javascript\">");
		    out.println("alert('Updated Successfully');");
		    out.println("location='ViewCompany?status=1';");
		    out.println("</script>");
		    }else {		    	
		    }
		}catch (Exception e) {
			// TODO: handle exception
		e.printStackTrace();
		}
	}

}
