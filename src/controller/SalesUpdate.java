package controller;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.*;

import java.util.ArrayList;

/**
 * Servlet implementation class SalesUpdate
 */
public class SalesUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SalesUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
      ArrayList<Object> al =new ArrayList<Object>();
     // MedicineBeen medicine=new MedicineBeen();
		String s[]=request.getParameterValues("product_id[]");
		if(s!=null) {
	
		//System.out.println(s[1]);
		for(int i=0;i<s.length;i++)
		{ MedicineBeen medicine=new MedicineBeen();
			/* System.out.println(s[i]); */
			int prdct_id=Integer.parseInt(s[i]);
			try
		    {
		    	Connection con=JDBCClass.getCon();
		        PreparedStatement ps=con.prepareStatement("select * from medicine where product_id=?");
		        ps.setInt(1, prdct_id);
		        ResultSet rs=ps.executeQuery();
		        if(rs.next())
		         {
		           medicine.setProduct_id(rs.getInt(1));
		           medicine.setProduct_name(rs.getString(2));
		           medicine.setCompany_name(rs.getString(3));
		           medicine.setProduct_category(rs.getString(4));
		           medicine.setProduct_quantity(rs.getInt(5));
		           medicine.setProduct_price(rs.getDouble(6));	           
   		           al.add(medicine);

   		        //System.out.println(medicine);
   		   
		         }
		        }
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		getServletContext().setAttribute("element",al);
		  //System.out.println(al.size()); 
		response.sendRedirect("sales.jsp");
	  }
		else {
			getServletContext().setAttribute("element",al.add(1));
			//System.out.println("not data selected");
			response.sendRedirect("sales.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String product_id[]=request.getParameterValues("product_id[]");
		String product_name[]=request.getParameterValues("product_name[]");
		//String Company_name[]=request.getParameterValues("Company_name[]");
		String Product_category[]=request.getParameterValues("Product_category[]");
		String Product_quantity[]=request.getParameterValues("Product_quantity[]");
		String enteredquantity[]=request.getParameterValues("quantity[]");
		String amount[]=request.getParameterValues("amount[]");
		String ppu[]=request.getParameterValues("ppu[]");
		Integer total_quantity=Integer.parseInt(request.getParameter("total_quantity"));
		Double total_amount=Double.parseDouble(request.getParameter("total_amount"));
		//System.out.println(product_id.length);
		
			HttpSession session=request.getSession();
			Integer user_name=(Integer)session.getAttribute("user_name");
 			//System.out.println(user_name);
			/*
			 * for(int i=0;i<product_id.length;i++) { System.out.println(
			 * Product_quantity[i]+"  "+enteredquantity[i]+" "+amount[i]); }
			 */
		try
		{
			LocalDateTime myDateObj = LocalDateTime.now();
			DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
			String formattedDate = myDateObj.format(myFormatObj);
			
			Connection con=JDBCClass.getCon();
			PreparedStatement ps=con.prepareStatement("insert into orders(user_id,total_qty,total_amt,date) values(?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
			ps.setInt(1, user_name);
			ps.setInt(2,total_quantity);
			ps.setDouble(3, total_amount);
			ps.setString(4, formattedDate);
			int a=ps.executeUpdate();
			ResultSet rs = ps.getGeneratedKeys();
		
			int getgeneratedkey=0;
			if (rs.next()){
				getgeneratedkey=rs.getInt(1);
				insertItem(product_name,Product_category,enteredquantity,ppu,amount,getgeneratedkey);
				updateQuantity(product_id,Product_quantity);
				
				OrdersBeen order=sellMedicine(getgeneratedkey,user_name);
				request.setAttribute("order", order);
				RequestDispatcher rd= request.getRequestDispatcher("Invoice.jsp");
				rd.forward(request, response);
			}			
		}
		catch(Exception e)
		{
				e.printStackTrace();
		}
	}

	private OrdersBeen sellMedicine(int getgeneratedkey,int user_name  ) {
		// TODO Auto-generated method stub
		ArrayList<Items> al=new ArrayList<Items>();
	 try
	 {
		 Connection con=JDBCClass.getCon();
		 PreparedStatement ps=con.prepareStatement("select * from items inner join orders on items.order_id=orders.order_id where items.order_id=?");
		 ps.setInt(1, getgeneratedkey);
		 PreparedStatement userdata=con.prepareStatement("select user_name from user where id=?");
		 userdata.setInt(1, user_name);
		
		 ResultSet rs=ps.executeQuery();
		 ResultSet rs1=userdata.executeQuery();
		 
		 OrdersBeen order=new OrdersBeen();
		 while(rs1.next())
			 order.setuserName(rs1.getString(1));
		 order.setOrderID(getgeneratedkey);
		 
		 while(rs.next())
		 { 
		 order.setTotal_quantity(rs.getInt(10));
		 order.setTotal_amount(rs.getDouble(11));
			 Items item=new Items();
			 
			 item.setProduct_name(rs.getString(3));
			 item.setProduct_category(rs.getString(4));
			 item.setEntered_quantity(rs.getInt(5));
			 item.setProduct_ppu(rs.getDouble(6));
			 item.setCalculated_amount(rs.getDouble(7));
			 al.add(item);
		 }
		 order.setItems(al);
		 
		 return order;
		 
	 }
	 catch (Exception e) {
		// TODO: handle exception
		 e.printStackTrace();
	}
		
		
		return null;
	}

	private int updateQuantity(String[] product_id, String[] product_quantity) {
		// TODO Auto-generated method stub
		//System.out.println("hello update");
		for(int i=0;i<product_id.length;i++)
		{
			
			try {
				//System.out.println("hello update");
				Connection con=JDBCClass.getCon();
			PreparedStatement ps=con.prepareStatement("update medicine set product_qty=? where product_id=?",Statement.RETURN_GENERATED_KEYS);
			ps.setInt(2, Integer.parseInt(product_id[i]));
			ps.setInt(1,Integer.parseInt(product_quantity[i]));
			int a=ps.executeUpdate();
				}catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
		}
		return 0;
	}

	private int insertItem(String[] product_name, String[] product_category, String[] enteredquantity, String[] ppu,
			String[] amount, int getgeneratedkey) {
	//	System.out.println("hello insert");
		// TODO Auto-generated method stub
		for(int i=0;i<product_name.length;i++)
		{
			
			try {
				//System.out.println("hello insert");
			Connection con=JDBCClass.getCon();
		PreparedStatement ps=con.prepareStatement("insert into items(order_id,product_name,product_category,product_qty,product_ppu,calculated_amount) values(?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
		ps.setInt(1, getgeneratedkey);
		ps.setString(2,product_name[i]);
		ps.setString(3,product_category[i]);
		ps.setInt(4,Integer.parseInt(enteredquantity[i]));
		ps.setDouble(5,Double.parseDouble(ppu[i]));
		ps.setDouble(6,Double.parseDouble(amount[i]));
		int a=ps.executeUpdate();
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		return 0;
	}

}
