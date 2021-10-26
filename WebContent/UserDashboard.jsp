<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page errorPage="errorPage.jsp" %>
        <%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
 %> 
  <%-- 
    <%
      if(session.getAttribute("name")==null)
      {
    	  response.sendRedirect("UserLogin.jsp");
      }
    %> --%>
<!DOCTYPE html>
<html>
<head>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,400i,600,700|Raleway:300,400,400i,500,500i,700,800,900" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="assets/vendor/nivo-slider/css/nivo-slider.css" rel="stylesheet"> 
  <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: eBusiness - v3.0.0
  * Template URL: https://bootstrapmade.com/ebusiness-bootstrap-corporate-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
<meta charset="ISO-8859-1">
<title>User Dashboard</title>
<style>
div.hover-div:hover {
	transform:scale(1.2);
}
a.hover-div:hover {
	transform:scale(1.5);
	 	
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- ======= Services Section ======= -->
    <div id="services" class="services-area area-padding">
    <div class="container-fluid" style="text-align:right;">
    	<!-- <button><a href="UserLogout" >LOGOUT</a></button>-->
    		 <a href="UserLogout" class="btn btn-info btn-lg">
          <span class="glyphicon glyphicon-log-out"></span> Log out
        </a>
    	
    </div>
      <div class="container">
        <div class="row">
          <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="section-headline services-head text-center hover-div">
              <h2>User Dashboard</h2>
            </div>
          </div>
        </div>
        <div class="row text-center">
          <!-- Start Left services -->
          <div class="col-md-4 col-sm-4 col-xs-12">
            <div class="about-move ">
              <div class="services-details hover-div">
                <div class="single-services  ">
                  <a class="services-icon " href="viewStock.jsp">
                   <i class="fa fa-cubes"></i>
                  </a>
                  <h4>Medicines</h4>
                  <p>
                 add,update or delete current stock</p>
                </div>
              </div>
              <!-- end about-details -->
            </div>
          </div>
          <div class="col-md-4 col-sm-4 col-xs-12">
            <div class="about-move">
              <div class="services-details hover-div">
                <div class="single-services">
                  <a class="services-icon" href="ViewCompany?status=1">
                  <i class="fa fa-sellsy"></i>
                  </a>
                  <h4>Tie-Ups</h4>
                  <p>
                    add,update or delete companies
                  </p>
                </div>
              </div>
              <!-- end about-details -->
            </div>
          </div>
          <div class="col-md-4 col-sm-4 col-xs-12">
            <!-- end col-md-4 -->
            <div class=" about-move">
              <div class="services-details">
                <div class="single-services hover-div">
                  <a class="services-icon" href="Order.jsp">
                   <i class="fa fa-bar-chart"></i>
                  </a>
                  <h4>Sales</h4>
                  <p>
                    add or view total sales
                  </p>
                </div>
              </div>
              <!-- end about-details -->
            </div>
          </div>
         
          <!-- End Left services -->
         
          <!-- End Left services -->
          
      </div>
    </div><!-- End Services Section -->
</body>
</html>