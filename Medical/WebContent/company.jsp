<%@ page errorPage="errorPage.jsp" %>
<%@page import="java.sql.*"%>
<%@page import="Model.*"%>
<%@page import="controller.*" %>
  <%@  page import="java.util.ArrayList"  %> 
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
<meta charset="ISO-8859-1">
<title>Medicines</title>
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
	    width: 94%;
    margin-left: 3%;
    margin-top: 3%;
}



</style>
</head>
<body bgcolor=#f2f2f2>
    <div class="table-body"> 
    <a href="AddCompany.jsp"><button style="width:10%; padding: 3px;float:right">ADD</button></a>
    <center style="font-size: 22px;  margin-bottom: 16px"><caption style="font-size: 22px; " >Current Tie-Ups</caption></center>
   <table class="table table-striped" style="width: 100%; float:left; height:100px;margin:0px 10px 10px 0px" id="myTable">
 
      <thead class="thead-dark">
       
          <tr>
             <th scope="col">COMPANY_ID</th>
             <th scope="col">COMPANY_NAME</th>
             <th scope="col">COMPANY_EMAIL</th>
             <th scope="col">COMPANY_PHONE</th>
             <th scope="col">COMPANY_ADDRESS</th>
             <th scope="col">ACTION</th>
             <th scope="col">ACTION</th>
          </tr>
      </thead>
      <tbody>
       <% ArrayList al=(ArrayList)getServletContext().getAttribute("element"); %>
    <% for(int i=0;i<al.size();i++){
    	CompanyBeen cb=(CompanyBeen)al.get(i);%>	
            <tr>
                <td><%=cb.getCompany_id() %></td>
                <td><%=cb.getCompanyName() %></td>
                <td><%=cb.getCompanyEmail() %></td>
                <td><%=cb.getCompanyPhone() %></td>
                <td><%=cb.getCompanyAddress() %></td>
       <td><a href="DeleteCompany?comp_id=<%= cb.getCompany_id() %>" onclick="return confirm('Are you sure?')"><button type="button" class="delete">Delete</button></a></td>
       <td><a href="UpdateCompany?comp_id=<%= cb.getCompany_id() %>"><button type="button" >Update</button></a></td>
            </tr>
            <%} %>
           </tbody>
           
        </table><br>
        </div>
</body>
</html>