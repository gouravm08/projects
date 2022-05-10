<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page errorPage="errorPage.jsp" %>
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
		<div class="title">Update User</div>
		
		<form action="UpdateUserNew" method="post">
			<input type="hidden" value=${id}  name="id">
			<div class="user-details">
				<div class="input-box">
					<span class="details">User Name</span>
					<input type="text" value=${name}  name="firstname" required>
				</div>
				<div class="input-box">
					<span class="details">Email</span>
					<input type="text" value=${email} name="email" required>
				</div>
				<div class="input-box">
					<span class="details">Phone</span>
					<input type="text" value=${mobile}  name="phone" required>
				</div>
				<div class="gender"><br>
					<span class="gender-title">Gender</span><br>
					<input type="radio" value="Male" <%= request.getAttribute("gender").equals("Male")?"checked":"" %> name="gender1"/>
					<span>Male</span>
					<input type="radio" value="Female" <%= request.getAttribute("gender").equals("Female")?"checked":"" %> name="gender1"/>
					<span>Female</span>
					<input type="radio" value="Other" <%= request.getAttribute("gender").equals("Others")?"checked":"" %> name="gender1"/>
					<span>Others</span>
				</div>
				<div class="input-box"><br>
					<span class="details">Address</span>
					<input type="text" value=${address}  name="address" required>
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