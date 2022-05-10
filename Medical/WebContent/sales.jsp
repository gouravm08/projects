<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page errorPage="errorPage.jsp" %>
 <%@page import="java.sql.*"%>
<%@page import="Model.*"%>
<%@page import="controller.*"%>
  <%@  page import="java.util.ArrayList"  %>
    <%@  page import="Model.MedicineBeen"  %>
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
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta charset="ISO-8859-1">
<title>Medicines</title>
<style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</style>
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

 <%
  ArrayList al=(ArrayList)getServletContext().getAttribute("element"); %>
     	
    <form action="SalesUpdate" method="post"  >
     
   <!--  <input type="text" id="search" placeholder="search medicine"></input> -->
   <div class="checkout">
   
    
    <center style="font-size: 22px;  margin-bottom: 16px"><caption style="font-size: 22px; " >Select Quantities :</caption></center>
   <table class="table table-striped" style="width: 100%; float:left; height:100px;margin:0px 10px 10px 0px" id="myTable">
 
      <thead class="thead-dark">
  
       
          <tr>
             <th scope="col">PRODUCT_ID</th>
             <th scope="col">PRODUCT_NAME</th>
             <th scope="col">COMPANY</th>
             <th scope="col">CATEGORY</th>
             <th scope="col">AVAILABLE</th>
             <th scope="col">PPU</th>
             <th scope="col">QUANTITY</th>
             <th scope="col">AMOUNT</th>
             <th scope="col">Remove</th>
          </tr>
      </thead>
      <tbody>
        <% for(int i=0;i<al.size();i++){
        	System.out.println(al.size());
	 MedicineBeen u=(MedicineBeen)al.get(i);%>	
            <tr id='rows' class="medicine_row">
            <!-- Product id  --> 
                <td >
                	<%=u.getProduct_id() %>
                	<input type="hidden" name="product_id[]" value="<%=u.getProduct_id() %>"/>
                </td>
                <!--  Product name--> 
                <td>
                <%=u.getProduct_name()%>
                <input type="hidden" name="product_name[]" value="<%=u.getProduct_name() %>"/>
                </td>
                <!--product company name  --> 
                <td>
                <%=u.getCompany_name() %>
                <input type="hidden" name="Company_name[]" value="<%=u.getCompany_name() %>"/>
                </td>
                <!-- product category --> 
                <td>
                <%=u.getProduct_category()%>
                <input type="hidden" name="Product_category[]" value="<%=u.getProduct_category() %>"/>
                </td> 
                <!-- Available --> 
                  <td id="demo" class="demo" qty="<%=u.getProduct_quantity() %>"><%=u.getProduct_quantity()-1 %>
                   <input type="hidden" name="Product_quantity[]" value="<%=u.getProduct_quantity()-1 %>" />
                  </td>
                   <!-- PRice per unit of product --> 
                <td class="price" data-price="<%=u.getProduct_price() %>"><%=u.getProduct_price() %>
                 <input type="hidden" name="ppu[]" value="<%=u.getProduct_price() %>"/>
                </td>
                <!-- quantity  of product entered by user -->
                <td><input type="number" min="1" value="1" max="<%=u.getProduct_quantity() %>" name="quantity[]" class="quantity"  placeholder=""></td>
                <td>
                <!--amount calculate by ppu and quantity  --> 
                               <input type="text" value="<%=u.getProduct_price() %>" id="amount"  class="amount" disabled >
                     <input type="hidden"  name="amount[]" value="<%=u.getProduct_price() %>"  class="amount"/>
                </td>
                <td><a href="#" class="delete_tr" >X</a></td>
            </tr>
            <%
     
        }%>
        <!-- total quantity and amount  -->
            <tr>
            	<td colspan="6">Total Price</td>
            	    <td><input type="text" name="total_quantity" class="total_quantity" disabled >
            	   <input type="hidden" name="total_quantity" class="total_quantity"/>
            	</td>
            	    <td><input type="text" id="total_amount" name="total_amount" class="total_amount" disabled >
            	    <input type="hidden" name="total_amount" class="total_amount"/>
            	</td>
            </tr>
           </tbody>
        </table><br></div>
        <input type="submit" value="Sell" class="right" >
        </form>
        </div>
        <script>
        $(document).ready(function(){
        	
        	$(".delete_tr").on("click",function(){
        		var atLeastOneIsChecked = $('[name="product_id[]"]').length ==1 ;
        		console.log(atLeastOneIsChecked);
        		if(atLeastOneIsChecked)
        			{$(this).closest('tr').remove();
        			//window.location.href = "Order.jsp";
        			 window.location = "Order.jsp";
        			
        			}
        		swal({
        			  title: "Are you sure?",
        			  text: "Once deleted,You will not be able to get again!",
        			  icon: "warning",
        			  buttons: true,
        			  dangerMode: true,
        			})
        			.then((willDelete) => {
        			  if (willDelete) {
        				  $(this).closest('tr').remove();
                                calculation(); 
                             
        			    swal("Removed Successfully!", {
        			      icon: "success",
        			    });
        			  } 
        			});
        });
        });
        	        </script>
        	        
   <!-- Amount Calculation -->
<script type='text/javascript'>
 var total_qty=0;
var total_amt=0;
var t=0;
$(document).ready(function(){
	$(".quantity").on("input",function(){
		var quanty_column=$(this).closest('tr').find('td:nth-child(5)');
		var price=parseFloat($(this).closest('tr').find('td:nth-child(6)').html());
		var available=parseInt(quanty_column.attr("qty"));
		console.log(quanty_column);
		var qty=parseInt($(this).val());
		var amount=price*qty;
		console.log(available); 
		if(qty<=available){
		total_qty+=qty;
		total_amt+=amount;
		if(amount!==NaN && qty>0){	
		$(this).closest('tr').find('td:nth-child(8)').children().val(amount.toFixed(2));
		 
  		quanty_column.html((available-qty)+'<input type="hidden" name="Product_quantity[]" value="'+(available-qty)+'">');
  		console.log(quanty_column.html());
		}
		else{
			$(this).closest('tr').find('td:nth-child(8)').children().val(t);
		
		   }
		}
		else{
			//console.log("hello exceedd");
			$(this).closest('tr').find('td:nth-child(8)').children().val(t);
			quanty_column.text(available);
		}	
	});
}); 

/* After deleting a row */
function calculation()
{
	var sum = 0;
    var sum1=0;
    $(".quantity").each(function(){
        sum += +$(this).val();   
    	var ab=$(this).closest('tr').find('td:nth-child(8)').children().val();
        sum1+= parseInt(ab);
     //   console.log(ab);
       // console.log(sum1);
    });
    $(".total_quantity").val(sum);
    if(amount!==NaN)
    $(".total_amount").val(sum1.toFixed(2));
    else
    	$(".total_amount").val("0"); 
}

/* Total qty and total amt */
 $(document).on("input", ".quantity", function() {
    var sum = 0;
    var sum1=0;
    $(".quantity").each(function(){
        sum += +$(this).val();   
    	var ab=$(this).closest('tr').find('td:nth-child(8)').children().val();
        sum1+= parseInt(ab);
    //    console.log(ab);
      //  console.log(sum1);
    });
    $(".total_quantity").val(sum);
    if(amount!==NaN)
    $(".total_amount").val(sum1.toFixed(2));
    else
    	$(".total_amount").val("0"); 
    
});  
 
 /* Total qty and total amt 1st time */
    $(".quantity", function() {
    	 var sum = 0;
    	    var sum1=0;
    	$(".quantity").each(function(){
            sum += +$(this).val();   
        	var ab=$(this).closest('tr').find('td:nth-child(8)').children().val();
            sum1+= parseInt(ab);
          //  console.log(ab);
         //   console.log(sum1);
        });
        $(".total_quantity").val(sum);
        if(amount!==NaN)
        $(".total_amount").val(sum1.toFixed(2));
        else
        	$(".total_amount").val("0"); 
           
});   
 
 
 
    </script>
  
</body>
</html>
