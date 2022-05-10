<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page errorPage="errorPage.jsp" %>
     <%@page import="java.sql.*"%>
<%@page import="Model.*"%>
<!DOCTYPE html>  
<html>  
<head>  
	<link rel="stylesheet" href="Usercss/css/style2.css">
	<meta charset="UTF-8">
	<title>userLogin</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<style>
	.button{
	align:center;
	width:40%;
	margin : 0px 0px 0px 135px;
	}
	</style>
	<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
 %> 
</head>
<body bgcolor=#f2f2f2>
	<div class="container" id="reg_form">
		<div class="title">Add an Item</div>
		<form onsubmit=" return validate()" action="AddMedicine" method="post">
			<div class="user-details">
				<div class="input-box">
					<span class="details">Product Name</span>
					<input type="text" placeholder="Enter Medicine name" name="medicinename" required>
				</div>
				
				<div class="input-box">
					<span class="details">Product Company</span>
					<select name="company_name">
					<option>Select Company</option>
					<%
					try
					{
						Connection con=JDBCClass.getCon();
						PreparedStatement ps=con.prepareStatement("select comany_name from companynames");
						ResultSet rs=ps.executeQuery();
						while(rs.next())
						{%>
						<option value="<%= rs.getString("comany_name")%>"><%= rs.getString("comany_name") %></option>	
						<%}
					 }
					catch(Exception e)
					{}
					%>
					</select>
				</div>
				<div class="input-box">
					<span class="details">Category</span>
					<input type="text" placeholder="Enter Category" name="category" required>
				</div>
								
				<div class="input-box"><br>
					<span class="details">Quantity</span>
					<input type="number" placeholder="Enter Quantity" name="quantity" required>
				</div>
				<div class="input-box">
					<span class="details">Price per unit</span>
					<input type="text"  placeholder="Enter Price" name="price" required>
				</div>
				<div>	<br>		
					<div class="button">
						<input type="submit" value="Add" >
				    </div>
				    </div>
				    </div>
		</form>
	</div>
</body>                            
</html>  