<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page errorPage="errorPage.jsp" %>
 <%@page import="java.sql.*"%>
<%@page import="Model.*"%>
<%@page import="controller.*"%>
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
 <script src="https://unpkg.com/sweetalert2@7.8.2/dist/sweetalert2.all.js"></script>
<meta charset="ISO-8859-1">
<title>Medicines</title>
<style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="assets/vendor/sweetalert2/dist/sweetalert2.min.css">
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
    try
    {
    	Connection con=JDBCClass.getCon();
        PreparedStatement ps=con.prepareStatement("select * from medicine");
        ResultSet rs=ps.executeQuery();
    %>
    <form action="SalesUpdate"  >
     <input type='text' id='txt_searchall' placeholder='Enter search text' style="width:20%; padding: 3px;"> 
   <!--  <input type="text" id="search" placeholder="search medicine"></input> -->
   <div class="checkout">
   <center style="font-size: 22px;  margin-bottom: 16px"><caption style="font-size: 22px; " >Select to Order :</caption></center>
   <table class="table table-striped" style="width: 100%; float:left; height:100px;margin:0px 10px 10px 0px" id="myTable">
 
      <thead class="thead-dark">
       
          <tr>
             <th scope="col">PRODUCT_ID</th>
             <th scope="col">PRODUCT_NAME</th>
             <th scope="col">COMPANY</th>
             <th scope="col">CATEGORY</th>
             <th scope="col">AVAILABLE</th>
             <th scope="col">PPU</th>
          </tr>
      </thead>
      <tbody>
        <%
        while(rs.next())
        {
            %>
            <tr id='rows' class="medicine_row">
                <td>
                <input type="checkbox"  name="product_id[]" value="<%=rs.getInt("product_id") %>">
                	<%=rs.getInt("product_id") %>
                	
                </td>
                <td><%=rs.getString("product_name") %></td>
                <td><%=rs.getString("company_name") %></td>
                <td><%=rs.getString("product_category") %></td>
                <td><%=rs.getInt("product_qty") %></td>
                <td class="price" data-price="<%=rs.getDouble("product_price") %>"><%=rs.getDouble("product_price") %></td>
        
            </tr>
            <%
     
        }%>
           
           </tbody>
        </table><br></div>
       
        <input type="submit" value="Order" class="right" onclick="return checkSelected();">
        </form> </div>
       
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

<script type='text/javascript'>
 var total_qty=0;
var total_amt=0;
$(document).ready(function(){
	$(".quantity").on("input",function(){
		var price=parseFloat($(this).closest('tr').find('td:nth-child(6)').html());
		var available=parseInt($(this).closest('tr').find('td:nth-child(5)').html());
	
		var qty=parseInt($(this).val());
		var amount=price*qty;
		
		if(qty<=available){
		total_qty+=qty;
		total_amt+=amount;
		if(amount!==NaN && qty>0){
		$
		(this).closest('tr').find('td:nth-child(8)').children().val(amount.toFixed(2));
		
		}
		else
			$(this).closest('tr').find('td:nth-child(8)').children().val("0");
		}else{
			console.log("hello exceedd");
		}	
	});
}); 



 $(document).on("change", ".quantity", function() {
    var sum = 0;
    $(".quantity").each(function(){
        sum += +$(this).val();
    });
    $(".total_quantity").val(sum);
    var sum1=0;
    $(".amount").each(function(){
        sum1+= +$(this).val();
    });
    if(amount!==NaN)
    $(".total_amount").val(sum1);
    else
    	$(".total_amount").val("0");
});
 	 	

    $(document).ready(function(){

        // Search all columns
        $('#txt_searchall').keyup(function(){
            var search = $(this).val();

            $('table tbody tr').hide();

            var len = $('table tbody tr:not(.notfound) td:contains("'+search+'")').length;

            if(len > 0){
              $('table tbody tr:not(.notfound) td:contains("'+search+'")').each(function(){
                  $(this).closest('tr').show();
              });
            }else{
              $('.notfound').show();
            }
            
        });
    });
    // Case-insensitive searching (Note - remove the below script for Case sensitive search )
    $.expr[":"].contains = $.expr.createPseudo(function(arg) {
        return function( elem ) {
            return $(elem).text().toUpperCase().indexOf(arg.toUpperCase()) >= 0;
        };
    });
    
    
    function checkSelected() {
    	var atLeastOneIsChecked = $('input[name="product_id[]"]:checked').length > 0;
    	if(!atLeastOneIsChecked){
    		swal({
    			  title: 'Please Select CheckBox to Order !',
    			  type: 'warning',
    			  confirmButtonColor: '#DD6B55',
    			  confirmButtonText: 'OK',
    			})
    			return false;
    	}
    	else
    		return true;
    }
    </script>
    
    
    <script>
    $("tr").click(function() {
        var checkbox = $(this).find("input[type='checkbox']");
    		checkbox.attr('checked', !checkbox.attr('checked'));
    });
    </script>
    
</body>
</html>
