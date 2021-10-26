<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page errorPage="errorPage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
 %> 

<title>AdminLogin</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="stylesheet" type="text/css" href="Admincss/css/NewForm.css">
</head>
<body>
	 <div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    <div class="fadeIn first">
    <i class="fa fa-user-circle-o"  style="font-size:35px;" aria-hidden="true"></i>
      Admin Login
      
    </div>

    <!-- Login Form -->
    <form method="post">
      <input type="text"  class="fadeIn second" id="username" name="username" placeholder="username or email" required>
      <input type="password"  class="fadeIn third"  id="password"  name="password" placeholder="password" required>
      <input type="submit" class="fadeIn fourth  TEST" value="Log In">
    </form>
  </div>
</div>

	<script>
	
	$(document).ready(function(){
		$(".TEST").click(function(){
			
			  var user=$('#username').val();
          var pwd=$('#password').val();
			 if(user==""||pwd==""){
				 alert("please enter username or password");
				 } else{ 
	  		$.ajax({
          type: "POST",
          url: "AdminLoginServlet",
          data: {"username":user,"password":pwd},
         
          dataType:"html",
        success    : function(data){
        
        	if(data=='True'){
                $(location).attr('href','admin_dashboard.jsp');
              }else{
                  alert('username or password is  wrong');
                  
              }
        	
      	},
      	error : function(jqXHR, exception){
      	console.log('Error occured!!');
      	alert("id password wrong");
      	}
            });
	  		} 
	  	  	    }); 
	  	    });
	</script>
</body>
</html>