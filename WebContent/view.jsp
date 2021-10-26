<%@ page errorPage="errorPage.jsp" %>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="Model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
 %> 
<title>List of Employees</title>
<style>

table, th, td {
  border: 1px solid black;
  padding: 5px;
  text-align:center;
}
table {
  border-spacing: 0.5px;
}
caption {
    padding: 10px;
    caption-side: top;
    font:100;
}
.button {
  background-color: #c49ba2;
  border: none;
  color: white;
  text-align: center;
  font-size: 15px;
  margin: 5px 10px;
  width:10%;
  cursor: pointer;
}

 input.right {
        float: right;
      }
.right {width: 10%;}
.table-body{
	    width: 96%;
    margin-left: 2%;
    margin-top: 2%;
}

</style>
</head>

<body bgcolor=#f2f2f2>
<div class="table-body">
<br>
<br>
    <%
ArrayList al=(ArrayList)getServletContext().getAttribute("USER");
        
       %>    
   <center style="font-size: 22px;"><caption style="font-size: 22px;" >Users List</caption></center>
    <table class="table table-striped"    id="myTable">
 
      <thead class="thead-dark">
 
          <tr>
             <th scope="col">ID</th>
             <th scope="col">NAME</th>
             <th scope="col">EMAIL</th>
             <th scope="col">MOBILE</th>
             <th scope="col">GENDER</th>
             <th scope="col">ADDRESS</th>
             <th scope="col">ACTION</th>
             <th scope="col">ACTION</th>
          </tr>
      </thead>
      <tbody>
      <% for(int i=0;i<al.size();i++){
    	  user_registration rs=(user_registration)al.get(i);
    	  %>
            <tr>
                <td><%=rs.getId() %></td>
                <td><%=rs.getUser_name() %></td>
                <td><%=rs.getEmail() %></td>
                <td><%=rs.getMob() %></td>
                <td><%=rs.getGender() %></td>
                <td><%=rs.getAddress() %></td>
               <td><a href="DeleteUser?id=<%=rs.getId() %>" onclick="return confirm('Are you sure?')"><button type="button" class="delete">Delete</button></a></td>
               <td><a href="UpdateUser?id=<%=rs.getId() %>" "><button type="button">Update</button></a></td>
            </tr>
            <%}%>
           </tbody>
        </table><br>	
</body>
</html>