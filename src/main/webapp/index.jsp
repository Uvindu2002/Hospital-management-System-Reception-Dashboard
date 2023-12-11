<!-- 109 Get  patient count from database -->
<!-- 141 Get doctors count -->
<!-- 175 Get Appointment Count --> 

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
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
			<div
				class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
				<a class="navbar-brand brand-logo me-5" href="index.jsp"><img
					src="images/logo.png" class="me-2" alt="logo" /></a> <a
					class="navbar-brand brand-logo-mini" href="index.jsp"><img
					src="images/logo.png" alt="logo" /></a>
			</div>
			<div
				class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
				<button class="navbar-toggler navbar-toggler align-self-center"
					type="button" data-toggle="minimize">
					<span class="ti-view-list"></span>
				</button>

				<ul class="navbar-nav navbar-nav-right">

					<li class="nav-item nav-profile dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						data-bs-toggle="dropdown" id="profileDropdown"> <i
							class="ti-user icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
					</a>
						<div class="dropdown-menu dropdown-menu-right navbar-dropdown"
							aria-labelledby="profileDropdown">
							<a class="dropdown-item" href="logout.jsp"> <i
								class="ti-power-off text-primary"></i> Logout
							</a>
						</div></li>
				</ul>
				<button
					class="navbar-toggler navbar-toggler-right d-lg-none align-self-center"
					type="button" data-toggle="offcanvas">
					<span class="ti-view-list"></span>
				</button>
			</div>
		</nav>

		<%
        Connection con = null;
    %>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_sidebar.html -->
			<nav class="sidebar sidebar-offcanvas" id="sidebar">
				<ul class="nav">
					<li class="nav-item"><a class="nav-link" href="apoinments.jsp">
							<i class="ti-shield menu-icon"></i> <span class="menu-title">Appoinments</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="doctors.jsp">
							<i class="ti-shield menu-icon"></i> <span class="menu-title">Doctors</span>
					</a></li>

					<li class="nav-item"><a class="nav-link" href="profile.jsp">
							<i class="ti-shield menu-icon"></i> <span class="menu-title">Profile</span>
					</a></li>

				</ul>
			</nav>
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">
						<div class="col-md-12 grid-margin">
							<div class="d-flex justify-content-between align-items-center">
								<div>
									<h4 class="font-weight-bold mb-0">RoyalUI Dashboard</h4>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<%
          	   //Get  patient count from database
               try {
                   con = DBConnect.getConnection();
                   String sql = "SELECT COUNT(*) AS patientCount FROM patient WHERE status = 2";
                   PreparedStatement ps = con.prepareStatement(sql);
                   ResultSet rs = ps.executeQuery();
                   if (rs.next()) {
                       int count = rs.getInt("patientCount");
              
            %>
						<div class="col-md-4 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<p class="card-title text-md-center text-xl-left">Patient</p>
									<div
										class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">
										<!-- Pass patient count -->
										<h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0"><%=count%></h3>
										<i class="ti-calendar icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
									</div>
								</div>
							</div>
						</div>
						<%
                    }
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
						<% 
               //Get Doctors Count
               try {
                   con = DBConnect.getConnection();
                   String sql = "SELECT COUNT(*) AS doctorCount FROM doctor WHERE status = 2";
                   PreparedStatement ps = con.prepareStatement(sql);
                   ResultSet rs = ps.executeQuery();
                   if (rs.next()) {
                       int count = rs.getInt("doctorCount");
              
            %>
						<div class="col-md-4 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<p class="card-title text-md-center text-xl-left">Active
										Doctors</p>
									<div
										class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">
										<!-- Pass doctor count -->
										<h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0"><%=count%></h3>
										<i class="ti-calendar icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
									</div>
								</div>
							</div>
						</div>
						<%
                    }
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
						<%     
               //Get Appoinment Count 
               try {
                   con = DBConnect.getConnection();
                   String sql = "SELECT COUNT(*) AS appoinmentCount FROM apoinment";
                   PreparedStatement ps = con.prepareStatement(sql);
                   ResultSet rs = ps.executeQuery();
                   if (rs.next()) {
                       int count = rs.getInt("appoinmentCount");
              
            %>
						<div class="col-md-4 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<p class="card-title text-md-center text-xl-left">Appoinment</p>
									<div
										class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">
										<!-- Pass app count -->
										<h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0"><%=count%></h3>
										<i class="ti-calendar icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
									</div>
								</div>
							</div>
						</div>
						<%
                    }
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>      <!-- Create appointment -->
					</div>
					<hr>
					<section id="appointment" class="appointment section-bg">
						<div class="container">

							<div class="section-title text-center">
								<h3>Create Appointment</h3>

							</div>

							<form action="/Receptionist/CreateAppoinmentServelet"
								method="POST" class="appointment-form"
								onsubmit="return validateForm()">
								<!--   <c:if test="${not empty errorMessage}">
			        	<p>${errorMessage}</p>
			    	</c:if>-->
								<div class="row">
									<div class="col-md-4 form-group">
										<input type="text" name="name" class="form-control" id="name"
											placeholder="Your Name">

									</div>
									<div class="col-md-4 form-group mt-3 mt-md-0">
										<input type="email" class="form-control" name="email"
											id="email" placeholder="Your Email">

									</div>
									<div class="col-md-4 form-group mt-3 mt-md-0">
										<input type="text" class="form-control" name="mobile"
											id="phone" placeholder="Your Phone">

									</div>
								</div>
								<div class="row">
									<div class="col-md-4 form-group mt-3">
										<input type="text" class="form-control" name="nic" id="nic"
											placeholder="Your NIC">

									</div>
									<div class="col-md-4 form-group mt-3">
										<input type="text" name="date" class="form-control datepicker"
											id="date" placeholder="Appointment Date(MM/DD)">

									</div>
									<div class="col-md-4 form-group mt-3">
										<select name="doctor" id="doctor" class="form-select">
											<option value="">Select Doctor</option>
											<%
											       
						       con = DBConnect.getConnection();
						   	
						   	   String sql = "select * from doctor";
						       
						       Statement stmt = con.createStatement();
						       
						       ResultSet rs1 = stmt.executeQuery(sql);
						       
						       while(rs1.next()) {
						       	%>

											<option value="<%=rs1.getString("doctorId")%>"><%=rs1.getString("fname")%>
												<%=rs1.getString("lname")%></option>

											<%
						       }
					       
					       %>
										</select>

									</div>
								</div>

								<div class="form-group mt-3">
									<textarea class="form-control" name="message" rows="5"
										placeholder="Message (Optional)"></textarea>

								</div>

								<div class="text-center">
									<button type="submit" class="btn btn-primary md-5">Make
										an Appointment</button>
								</div>
							</form>

						</div>
					</section>
					<!-- End Appointment Section -->
				</div>
				<!-- content-wrapper ends -->
				<!-- partial:partials/_footer.html -->
				<footer class="footer">
					<div
						class="d-sm-flex justify-content-center justify-content-sm-between">
						<span
							class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright
							© <a href="https://www.bootstrapdash.com/" target="_blank">bootstrapdash.com
						</a>2021
						</span>
					</div>
				</footer>
				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->

	<script>
	function validateForm() {
	    var name = document.getElementById("name").value;
	    var email = document.getElementById("email").value;
	    var mobile = document.getElementById("phone").value;
	    var nic = document.getElementById("nic").value;
	
	    if (name.length > 50) {
	        alert("Name must not exceed 50 characters.");
	        return false;
	    }else if (email.length > 100 || !email.includes("@")) {
	        alert("Invalid or too long email address.");
	        return false;
	    }else if (mobile.length !== 10) {
	        alert("Mobile number must be 10 characters long.");
	        return false;
	    }else if (mobile.length !== 10) {
	        alert("Mobile number must be 10 characters long.");
	        return false;
	    }else if (mobile.charAt(0) !== '0') {
	        alert("Mobile number should start with '0'.");
	        return false;
	    }else if (nic.length > 12 ) {
	        alert("NIC must be 12 characters long.");
	        return false;
	    }
	
	    // Other validation rules can be added here
	
	    return true; // Form will submit if all validations pass
	}
	
	const urlParams = new URLSearchParams(window.location.search);
    if (urlParams.has('success') && urlParams.get('success') === 'true') {
        // Display a success alert
        alert('Patient added successfully!');
    }
	
    
	
	</script>
	
	
	

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

