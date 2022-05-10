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
</head>
<body bgcolor=#f2f2f2>  
	<div class="container" id="reg_form">
		<div class="title">Update Medicine</div>
		
		<form onsubmit="validate()" action="UpdateMedicine" method="post">
			<input type="hidden" value=${id}  name="prd_id">
			<div class="user-details">
				<div class="input-box">
					<span class="details">Product name</span>
					
					<input type="text" value=${name}  name="prd_name" required>
				</div>
				
				
				<div class="input-box">
					<span class="details">Product Company</span>
					
					<select name="comp_name">
					<option>${company}</option>
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
					<input type="text" value=${category}  name="category" required>
				</div>
				<div class="input-box"><br>
					<span class="details">Quantity</span>
					<input type="text" value=${qty}  name="quantity" required>
				</div>	
				<div class="input-box"><br>
					<span class="details">Price per Unit</span>
					<input type="text" value=${price}  name="price" required>
				</div>	
						<div>	<br>			
					<div class="button">
						<input type="submit" value="Update" >
				    </div>
				    </div>
				    </div>
		</form>
	</div>
</body>                            
</html>  