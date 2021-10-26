<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page errorPage="errorPage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="Usercss/css/style.css">
	<meta charset="UTF-8">
	

	<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
<title>Insert title here</title>
</head>
<body bgcolor=#f2f2f2>
<div class="container" id="reg_form">
		<div class="title">Registration</div>
		<form action="UserRegister" method="post">
			<div class="user-details">
				<div class="input-box">
					<span class="details">User Name</span>
					<input type="text" placeholder="Enter your name" name="firstname" required>
				</div>
				
				<div class="input-box">
					<span class="details">Email</span>
					<input type="email" placeholder="Enter your email" name="email" required>
				</div>
				
				<div class="input-box">
				<span class="details">Phone</span>
				
					 <input type='text' id='ph' maxlength='12' placeholder="Enter your phone" name="phone"/>
                            <span id="spnPhoneStatus"></span>
				</div>
				
				<div class="gender"><br>
					<span class="gender-title">Gender</span><br>
					<input type="radio" value="Male" name="gender1"/>
					<span>Male</span>
					<input type="radio" value="Female" name="gender1"/>
					<span>Female</span>
					<input type="radio" value="Others" name="gender1"/>
					<span>Others</span>
					</div>
				
				<div class="input-box"><br>
					<span class="details">Address</span>
					<input type="text" placeholder="Enter your address" name="address" required>
				</div>
				
				<div class="input-box">
					<span class="details">Password</span>
					<input type="password" id="ps" placeholder="Enter your password" name="password" required>
				</div>
				
				<div class="input-box">
					<span class="details">Retype-Password</span>
					<input type="password" id="ps1" placeholder="Confirm your password"  name="password1" required>
				</div>
					
						<div>	<br>			
					<div class="button">
						<input type="submit" value="Register" >
				    </div>
				    </div>
				    </div>
		</form>
	</div>
	<script>
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
<!-- <script>
  function validate() {
  var a=document.getElementById("ps").value;
  var b=document.getElementById("ps1").value;
  if(a!=b)
	  {
	  alert("password does not match");
	  return false;
	  }
  else return true;
}
</script> -->
</html>