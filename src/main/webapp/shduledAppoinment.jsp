<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.connection.DBConnect"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Reception Dash Board</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="vendors/base/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="images/favicon.png" />
</head>
<body>
  <div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo me-5" href="index.jsp"><img
					src="images/logo.png" class="me-2" alt="logo" /></a> <a
					class="navbar-brand brand-logo-mini" href="index.jsp"><img
					src="images/logo.png" alt="logo" /></a>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
          <span class="ti-view-list"></span>
        </button>
        
        <ul class="navbar-nav navbar-nav-right">
            
          <li class="nav-item nav-profile dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" id="profileDropdown">
              <i class="ti-user icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
              <a class="dropdown-item" href="EmployeeLogoutServelet">
                <i class="ti-power-off text-primary"></i>
                Logout
              </a>
            </div>
          </li>
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="ti-view-list"></span>
        </button>
      </div>
    </nav>
    
    
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" href="apoinments.jsp">
              <i class="ti-shield menu-icon"></i>
              <span class="menu-title">Appoinments</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="doctors.jsp">
              <i class="ti-shield menu-icon"></i>
              <span class="menu-title">Doctors</span>
            </a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="profile.jsp">
              <i class="ti-shield menu-icon"></i>
              <span class="menu-title">Profile</span>
            </a>
          </li> 

        </ul>
      </nav>
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-md-12 grid-margin">
              <div class="d-flex justify-content-between align-items-center">
                <div >
                  <h3 class="font-weight-bold mb-0">Shedule Appoinment</h3>
                </div>
              </div>
            </div>
          </div>
          <section id="appointment" class="appointment section-bg">
		      <div class="container">
		      
		      <%
		            String mob = request.getParameter("appId");
		            Connection con = DBConnect.getConnection();
		            String s = "SELECT p.name, p.email, p.phone, p.nic, a.date, d.fname, d.lname " +
		                    "FROM apoinment a " +
		                    "INNER JOIN patient p ON p.nic = a.patient_nic " +
		                    "INNER JOIN doctor d ON a.doctor_doctorId = d.doctorId " +
		                    "WHERE apoinmentId = '" + mob + "'";
		            PreparedStatement pstmt = con.prepareStatement(s);
		            ResultSet  rs = pstmt.executeQuery();
		            while (rs.next()) {
		        %> 
		
		
		        <form action="/Receptionist/ResheduleServelet" method="POST" class="appointment-form">
			       <!--   <c:if test="${not empty errorMessage}">
			        	<p>${errorMessage}</p>
			    	</c:if>-->
			    	<input type="hidden" name="appid" value="<%= mob%>" id="appid">
			          <div class="row">
			            <div class="col-md-4 form-group">
			              <input type="text" name="name" class="form-control" value="<%= rs.getString(1)%>" id="name" placeholder="Your Name" readonly>
			              
			            </div>
			            <div class="col-md-4 form-group mt-3 mt-md-0">
			              <input type="email" class="form-control" name="email" value="<%= rs.getString(2)%>" id="email" placeholder="Your Email" readonly>
			              
			            </div>
			            <div class="col-md-4 form-group mt-3 mt-md-0">
			              <input type="text" class="form-control" name="mobile" value="<%= rs.getString(3)%>" id="phone" placeholder="Your Phone" readonly>
			              
			            </div>
			          </div>
			          <div class="row">
			          	<div class="col-md-4 form-group mt-3">
			              <input type="text" class="form-control" name="nic" value="<%= rs.getString(4)%>" id="nic" placeholder="Your NIC" readonly>
			              
			            </div>
			            <div class="col-md-4 form-group mt-3">
			              <input type="text" name="date" class="form-control datepicker" value="<%= rs.getString(5)%>" id="date" placeholder="Appointment Date">
			              
			            </div>
			            <div class="col-md-4 form-group mt-3">
			              <select name="doctor" id="doctor" class="form-select" >
			                
						       	
						       	<option><%=rs.getString(6)%> <%=rs.getString(7)%></option>
						       	
						       	
			              </select>
			              
			            </div>
			          </div>
			          
			          <div class="text-center"><button type="submit" name= "submit"class="btn btn-primary md-5">Reshedule</button></div>
			        </form>
			        
			        <%
			        
		            }
			        
			        %>
		
		      </div>
		    </section><!-- End Appointment Section -->
        </div>
        <!-- content-wrapper ends -->
        <!-- partial:partials/_footer.html -->
        <footer class="footer">
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © <a href="https://www.bootstrapdash.com/" target="_blank">bootstrapdash.com </a>2021</span>
          </div>
        </footer>
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->

  <!-- plugins:js -->
  <script src="vendors/base/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page-->
  <script src="vendors/chart.js/Chart.min.js"></script>
  <script src="js/jquery.cookie.js" type="text/javascript"></script>
  <!-- End plugin js for this page-->
  <!-- inject:js -->
  <script src="js/off-canvas.js"></script>
  <script src="js/hoverable-collapse.js"></script>
  <script src="js/template.js"></script>
  <script src="js/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="js/dashboard.js"></script>
  <!-- End custom js for this page-->
</body>

</html>

