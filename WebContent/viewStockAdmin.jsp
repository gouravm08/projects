<%@page import="java.sql.*"%>
<%@page import="Model.*"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page errorPage="errorPage.jsp" %>
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
	    width: 96%;
    margin-left: 2%;
    margin-top: 2%;
}
.table1{
/* justify-content:center; */
margin-left:5em;
margin-right:5em
}
</style>
</head>
<body bgcolor=#f2f2f2>
<div class="table-body">
 <%
    try
    {
    	Connection con=JDBCClass.getCon();
        PreparedStatement ps=con.prepareStatement("select * from medicine");
        ResultSet rs=ps.executeQuery();
    %>
       <center style="font-size: 22px;"><caption style="font-size: 22px;" >Current Stock</caption></center>
    <table  class="table table-striped" style="width: 100%; float:left; height:100px;margin:0px 10px 10px 0px">

      <thead class="thead-dark">
       
          <tr>
             <th scope="col">PRODUCT_ID</th>
             <th scope="col">PRODUCT_NAME</th>
             <th scope="col">COMPANY</th>
             <th scope="col">CATEGORY</th>
             <th scope="col">QUANTITY</th>
             <th scope="col"> PRICE</th>
          </tr>
      </thead>
      <tbody >
        <%while(rs.next())
        {
            %>
            <tr>
                <td><%=rs.getInt("product_id") %></td>
                <td><%=rs.getString("product_name") %></td>
                <td><%=rs.getString("company_name") %></td>
                <td><%=rs.getString("product_category") %></td>
                <td><%=rs.getInt("product_qty") %></td>
                <td><%=rs.getDouble("product_price") %></td>
                
            </tr>
            <%}%>
           </tbody>
        </table><br>
        </div>
       
    <%}
    catch(Exception e){
        out.print(e.getMessage());%>
        <br><%
    }
    /* finally{
        ps.close();
        con.close();
    } */
    %>
</body>
</html>