<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page errorPage="errorPage.jsp" %>
<!DOCTYPE html>  
<html>  
<head>  
	<link rel="stylesheet" href="Usercss/css/style2.css">
	<meta charset="UTF-8">
	<title>UpdateCompany</title>

	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body style="background-image: url('Admincss/images/bg1.jpg');">  
	<div class="container" id="reg_form">
		<div class="title">Update Company</div>
		
		<form onsubmit="validate()" action="UpdateCompanyNew" method="post">
			<div class="user-details">
			<input type="hidden" value=${id} name="comp_id">
				<div class="input-box">
					<span class="details"> Company Name</span>
					<input type="text" value=${name} name="companyname" required>
				</div>
				<div class="input-box">
					<span class="details">Company Email</span>
					<input type="text" value=${companyemail} name="companyemail" required>
				</div>
								
				<div class="input-box"><br>
					<span class="details">Company Contact</span>
					<input type="number" value=${contact} name="CompanyContact" required>
				</div>
				<div class="input-box">
					<span class="details">Company Address</span>
					<input type="text"  value=${address} name="companyAddress" required>
				</div>
				<div>	<br>		
					<div class="button">
						<input type="submit" value="Add" >
				    </div>
				    </div>
				    </div>
		</form>
	</div>
</body>                            
</html>  