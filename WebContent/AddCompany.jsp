<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page errorPage="errorPage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Company Name List</title>
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body bgcolor=#f2f2f2>
<div class="container" id="reg_form">
		<div class="title">Add an Item</div>
		<form onsubmit=" return validate()" action="AddCompany" method="post">
			<div class="user-details">
				
				<div class="input-box">
					<span class="details"> Company Name</span>
					<input type="text" placeholder="Enter Company name" name="companyname" required>
				</div>
				<div class="input-box">
					<span class="details">Company Email</span>
					<input type="text" placeholder="Enter Company email" name="companyemail" required>
				</div>
								
				<div class="input-box"><br>
					<span class="details">Company Contact</span>
					<!-- <input name="mobile"  id="mobile" type="number"    required> -->
					<input type='text' id='ph' maxlength='12' placeholder="Enter your phone" name="mobile"/>
					 <span id="spnPhoneStatus"></span>
					<!-- <input type="text" placeholder="Enter Company Contact" maxlength="10" name="CompanyContact" required> -->
				</div>
				<div class="input-box">
					<span class="details">Company Address</span>
					<input type="text"  placeholder="Enter Company Address" name="companyAddress" required>
				</div>
				<div>	<br>		
					<div class="button">
						<input type="submit" value="Add" >
				    </div>
				    </div>
				    </div>
		</form>
	</div>
	<script type="text/javascript">
	$("#ph").change(function() {
        var a = $("#ph").val();
        var filter = /^[7-9][0-9]{9}$/;

        if (filter.test(a)) {
            /* alert("valid"); */
            $('#spnPhoneStatus').html('Valid');
            $('#spnPhoneStatus').hide();
            $('#spnPhoneStatus').css('color', 'green');
        }
        else {
           /*  alert("not valid"); */
            $('#spnPhoneStatus').html('Invalid');
            $('#spnPhoneStatus').css('color', 'red');
        }
    });
	</script>
</body>
</html>