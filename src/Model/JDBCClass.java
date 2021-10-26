package Model;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBCClass {
	private static Connection con=null;
	private JDBCClass() {}
	public static Connection getCon()
	{	
		if(con==null) {
	   try {
		Class.forName("com.mysql.jdbc.Driver");
	    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","");
	    }
    	catch(Exception e)
	   {
			/* e.printStackTrace(); */
    		System.out.println(e);
	    }
	 }
   return con;
	}

}
