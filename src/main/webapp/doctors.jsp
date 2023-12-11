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
  <title>RoyalUI Admin</title>
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
	
    
    <%= session.getAttribute("employeeObj") %>
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
      
      
      
      
        <!-- content-wrapper ends -->
        <div class="main-panel">
	        <div class="content-wrapper">
	          <div class="row">
	          
	          	<div class="col-md-6">
                            <form id="form" method="post" action="doctors.jsp" class="form-horizontal">
                            
                            <div class="form-group">
			                    <div class="input-group">
			                      <input type="text" class="form-control" id="search" placeholder="Name" name="search">
			                      <div class="input-group-append">
			                        <button class="btn btn-sm btn-primary" >Search</button>
			                      </div>
			                    </div>
			                </div>
                               <!--  <div class="form-group col-md-6">
                                    <label>Employee ID</label>
                                    <input type="text" name="search" class="form-control" id="search" placeholder="Employee ID">
                                </div>
                                <div class="form-group col-md-6" align="center">
                                    <Button class="btn btn-success" style="width: 80px;">Submit</Button>
                                </div> -->
                            </form>
                        </div>




						<div class="col-lg-11 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Reception</h4>
                                    <div class="table-responsive">
                                    <table class="table">
					                      <thead>
					                        <tr>
					                          <th>Doctor Id</th>
					                          <th>Doctor Name</th>
					                          <th>Status</th>
					                        </tr>
					                      </thead>
                                        <%
                                            Connection con = null;
                                            Statement stmt = null;
                                            ResultSet rs = null;
                                            try {
                                                con = DBConnect.getConnection();
                                                stmt = con.createStatement();

                                                String search = request.getParameter("search");
                                                out.print("<h3>Appointments</h3>");

                                                if (search == null || search.isEmpty()) { 
                                                	String query = "SELECT * FROM doctor";
                                                	rs = stmt.executeQuery(query);
                                                	
                                                }else {
                                                	
                                               
                                                    String query = "SELECT * FROM doctor WHERE fname =?";
													             
                                                    PreparedStatement ps = con.prepareStatement(query);
                                                    ps.setString(1, search);
                                                    rs = ps.executeQuery();
                                                }

                                                while (rs.next()) {
                                        %>
                                         	<tbody>
						                        <tr>
						                          <td><%=rs.getString(1)%></td>						      
						                          <td><%=rs.getString(2)%> <%=rs.getString(3)%></td>
						                          <td>
						                          <% if (rs.getInt(9) == 1) { %>
													    <form action="DoctorStatusChange" method="post" style="display: inline-block; margin-right: 10px;">
													        <input type="hidden" name="dId" value="<%=rs.getString(1)%>">
													        <input type="hidden" name="status" value="<%=rs.getString(9)%>">
													        <button type="submit" class="btn btn-primary btn-rounded btn-fw">Active</button>
													    </form>
												  <% }else {%>
												  		<form action="DoctorStatusChange" method="post" style="display: inline-block; margin-right: 10px;">
													        <input type="hidden" name="dId" value="<%=rs.getString(1)%>">
													        <input type="hidden" name="status" value="<%=rs.getString(9)%>">
													        <button type="submit" class="btn btn-success btn-rounded btn-fw">Inactive</button>
													    </form>
												  <% }%>
												    
													</td>
						                        </tr>
						                        
						                      </tbody>
                                        <%
                                                }
                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            } finally {
                                                if (rs != null) {
                                                    rs.close();
                                                }
                                                if (stmt != null) {
                                                    stmt.close();
                                                }
                                                if (con != null) {
                                                    con.close();
                                                }
                                            }
                                        %>
                                        
                                        </table>
                                    </div>
                                </div>
                            </div>
                            </div>
	          
	          </div>
          	</div>
        <!-- partial:partials/_footer.html -->
        <footer class="footer">
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2023</span>
          </div>
        </footer>
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->

 
</body>
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

</html>

