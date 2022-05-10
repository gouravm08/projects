<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page errorPage="errorPage.jsp" %>
<%@ page import="Model.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>                  
<meta charset="ISO-8859-1">
<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
 %> 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />

<style>
        body {
    background: #eee
}    
            @media print {
               .noprint {
                  visibility: hidden;
               }
            }
        </style>
<title>Insert title here</title>
</head>
<body>

<% OrdersBeen order=(OrdersBeen)request.getAttribute("order") ;
/* System.out.println(order); */
ArrayList<Items> itemarray=order.getItems();

%>

<div class="container mt-5">
    <div class="d-flex justify-content-center row">
        <div class="col-md-8">
            <div class="p-3 bg-white rounded">
                <div class="row">
                    <div class="col-md-6">
                        <h2 class="text-uppercase">Invoice</h2>
                        <div class="billed"><span class="font-weight-bold text-uppercase">Billed BY : &nbsp</span><span class="ml-1"><%=order.getuserName() %></span></div>
                        <div class="billed"><span class="font-weight-bold text-uppercase">Date : &nbsp</span><span class="ml-1" id="date1">01/01/2001</span></div>
                        <div class="billed"><span class="font-weight-bold text-uppercase">Order ID : &nbsp</span><span class="ml-1"><%=order.getOrderID() %></span></div>
                    </div>
                    
                </div>
                <div class="mt-3">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Product</th>
                                     <th>Category</th>
                                   <th>PPU</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                            <%for(int i=0;i<itemarray.size();i++){
                            	Items itm=itemarray.get(i);
                            	%>
                                <tr>
                                    <td><%=itm.getProduct_name() %></td>
                                    <td><%=itm.getProduct_category() %></td>
                                    <td><%=itm.getProduct_ppu() %></td>
                                    <td><%=itm.getEntered_quantity() %></td>
                                    <td><%=itm.getCalculated_amount() %></td>
                                </tr>
                               <%} %>
                                <tr>
                                    <td>GrandTotal</td>
                                    <td></td>
                                     <td></td>
                                    <td><%=order.getTotal_quantity() %></td>
                                    <td><%=order.getTotal_amount() %></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="text-right mb-3"><button class="btn btn-danger btn-sm mr-5 noprint" type="button" onclick="window.print()">Print</button></div>
            </div>
        </div>
    </div>
<br>
<div class="text-right mb-3 text-center"><a href="Order.jsp"><button class="btn btn-danger btn-sm mr-5 noprint" type="button">Back</button></a></div>
</div>
<script>

var myspan = document.getElementById('date1');
if (myspan.innerText) {
	
    let today = new Date().toLocaleDateString();
    myspan.innerText = "  "+today;
}

</script>
</body>
</html>