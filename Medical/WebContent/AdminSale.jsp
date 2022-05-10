<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page errorPage="errorPage.jsp" %>
    <%@page import="java.sql.*"%>
<%@page import="Model.*"%>
<%@page import="controller.*"%>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<head>
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

.table1{

    width: 100%;
}

</style>


</head>
<body bgcolor=#f2f2f2>
<div class="table-body">
 <%
    try
    {
    	Connection con=JDBCClass.getCon();
        PreparedStatement ps=con.prepareStatement("select orders.order_id,user.user_name,orders.total_amt,orders.date from orders inner join user where orders.user_id=user.id ");
        ResultSet rs=ps.executeQuery();
    %>
     <input type='text' id='txt_searchall' placeholder='Enter search text' style="width:20%; padding: 3px;"> 
     <!-- <div  align="right ">
     <p float="right">Date: <input type="text" id="fromDate"> TO <input type="text" id="toDate"></p>
     </div> -->
   <!--  <input type="text" id="search" placeholder="search medicine"></input> -->
   <div class="checkout">
   <center style="font-size: 22px;"><caption style="font-size: 22px;" >Sells</caption></center>
    <table class="table table-striped" style="width: 100%; float:left; height:100px;margin:0px 10px 10px 0px" id="myTable">
 
      <thead class="thead-dark">
       
          <tr >
             <th scope="col">ORDER_ID</th>
             <th scope="col">USER_NAME</th>
             <th scope="col">TOTAL_AMOUNT </th>
             <th scope="col">DATE TIME</th>
             
          </tr>
      </thead>
      <tbody>
        <%
        while(rs.next())
        {
            %>
            <tr id='<%=rs.getInt(1) %>' class="medicine_row" data-toggle="modal" data-target="#myModal">
                <td><%=rs.getInt(1) %></td>
                <td><%=rs.getString(2) %></td>
                <td><%=rs.getDouble(3) %></td>
                <td><%=rs.getString(4) %></td>
            </tr>
            <%
     
        }%>
           
           </tbody>
        </table><br></div>
       
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
    

</div>

<div class="container">
 
  <!-- Trigger the modal with a button --><!-- 
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>
 -->
  <!-- Modal -->
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="myModal">Order ID :<span class="Test">  orders</span></h5>
        
      </div>
      <div class="modal-body">
       <table class="table1" >
  <thead class="thead-light">
    <tr>
      <th scope="col">Items</th>
      <th scope="col">Product Name</th>
      <th scope="col">Product Quantity</th>
      <th scope="col">PPU</th>
      <th scope="col">Total</th>
    </tr>
  </thead>
  <tbody id="tbodyAdminLocation" style="font-size: small;">

            </tbody>
</table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>
  
</div>


</body>

<script>
$(document).ready(function(){
	$(".medicine_row").click(function(){
		var id=$(this).attr("id")
		 
		 $(".Test").text( $(this).attr("id")); 
  		//getData($(this).attr("id"));
  		
  		myFunction(id)
  		
  		console.log(id);
  	  	    }); 
  	    });



function myFunction(p1) {
	$.ajax({
          type: "POST",
          url: "OrderData",
          data: {p1},
         
          dataType:"html",
        success    : function(msg){
        	// $('#tbodyAdminLocation').html('');
             $('#tbodyAdminLocation').html(msg);
        	
      	},
      	error : function(jqXHR, exception){
      	console.log('Error occured!!');
      	}
            }); 
}
</script>

<script type="text/javascript">
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
    </script>
    
    
    <!-- <script type="text/javascript">
    
    $( function() {
    	  var from = $( "#fromDate" )
    	      .datepicker({
    	        dateFormat: "dd/mm/yy",
    	        changeMonth: true
    	      })
    	      .on( "change", function() {
    	        to.datepicker( "option", "minDate", getDate( this ) );
    	      }),
    	    to = $( "#toDate" ).datepicker({
    	      dateFormat: "dd/mm/yy",
    	      changeMonth: true
    	    })
    	    .on( "change", function() {
    	      from.datepicker( "option", "maxDate", getDate( this ) );
    	    });

    	  function getDate( element ) {
    	    var date;
    	    var dateFormat = "dd/mm/yy";
    	    try {
    	      date = $.datepicker.parseDate( dateFormat, element.value );
    	    } catch( error ) {
    	      date = null;
    	    }

    	    return date;
    	  }
    	});
    </script>
     -->
    

</html>