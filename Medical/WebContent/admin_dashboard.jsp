<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
    <%@ page errorPage="errorPage.jsp" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
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
  * Author: Gourav makwawna and Neha Gujar
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
<meta charset="ISO-8859-1">
<title>Admin Dashboard</title>
<style>
div.hover-div:hover {
	transform:scale(1.2);
}
a.hover-div:hover {
	transform:scale(1.5);
	 	
}
</style>
</head>
<body>
<%-- <p>Message: <%= session.getAttribute("message")== null?"":session.getAttribute("message") %></p>
<%
session.removeAttribute("message");
%> --%>


 <!-- ======= Services Section ======= -->
    <div  id="services" class="services-area area-padding">
    
    <div class="container-fluid" style="text-align:right;">
    	<!-- <button><a class="glyphicon glyphicon-log-out" href="AdminLogout" >LOGOUT</a></button> -->
    	 <a href="AdminLogout" class="btn btn-info btn-lg">
          <span class="glyphicon glyphicon-log-out"></span> Log out
        </a>
    </div>
    
      <div class="container">
        <div class="row">
          <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="section-headline services-head text-center hover-div">
              <h2>Admin Dashboard</h2>
            </div>
          </div>
        </div>
        <div class="row text-center">
          <!-- Start Left services -->
          <div class="col-md-4 col-sm-4 col-xs-12">
            <div class="about-move ">
              <div class="services-details hover-div">
                <div class="single-services  ">
                  <a class="services-icon " href="viewStockAdmin.jsp">
                    <i class="fa fa-cubes"></i>
                  </a>
                  <h4>View Current Stock</h4>
                  <p>
                   to view medicines available </p>
                </div>
              </div>
              <!-- end about-details -->
            </div>
          </div>
          <div class="col-md-4 col-sm-4 col-xs-12">
            <div class="about-move">
              <div class="services-details hover-div">
                <div class="single-services">
                  <a class="services-icon" href="ViewCompany?status=2">
                  <i class="fa fa-sellsy"></i>
                  </a>
                  <h4>View Tie-Ups</h4>
                  <p>
                    To view all companies
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
                  <a class="services-icon" href="AdminSale.jsp">
                   <i class="fa fa-bar-chart"></i>
                  </a>
                  <h4>View Sales</h4>
                  <p>
                    To view total sales
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
                  <a class="services-icon" href="UserSignup.jsp">
                  <i class="fa fa-user-plus"></i>
                  </a>
                  <h4>Create User</h4>
                  <p>
                   To create a new user & enter details
                  </p>
                </div>
              </div>
              <!-- end about-details -->
            </div>
          </div>
          <!-- End Left services -->
          <div class="col-md-4 col-sm-4 col-xs-12">
            <!-- end col-md-4 -->
            <div class=" about-move">
              <div class="services-details">
                <div class="single-services hover-div">
                  <a class="services-icon " href="ViewUser">
                    <i class="fa fa-eye"></i>
                  </a>
                  <h4>View Users</h4>
                  <p>
                    To view,update or delete current employees
                  </p>
                </div>
              </div>
              <!-- end about-details -->
            </div>
          </div>
          <!-- End Left services -->
          <div class="col-md-4 col-sm-4 col-xs-12">
            <!-- end col-md-4 -->
            
          </div>
        </div>
      </div>
    </div><!-- End Services Section -->
</body>
</html>