<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="login/css/style.css">
</head>
<body class="img js-fullheight" style="background-image: url(login/images/bg.jpg);">
	
	
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Login </h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-4">
					<div class="login-wrap p-0">
		      	
		      	<form action="EmployeeLoginServelet" method="post" class="signin-form">
		      		<div class="form-group">
		      			<input type="text" id="userName" name="userName" class="form-control" placeholder="Username" required>
		      		</div>
		            <div class="form-group">
		              <input id="password" name="password" type="password" class="form-control" placeholder="Password" required>
		              
		            </div>
		            <div class="form-group">
		            	<button type="submit" class="form-control btn btn-primary submit px-3">Sign In</button>
		            </div>
		            
		          </form>
	          
		      </div>
				</div>
			</div>
		</div>
	</section>
	

</body>

<script>
    const urlParams = new URLSearchParams(window.location.search);
    if (urlParams.has('unsuccess') && urlParams.get('unsuccess') === 'true') {
        // Display a success alert
        alert('Login successfully!');
    } 
</script>

<script src="login/js/jquery.min.js"></script>
  <script src="login/js/popper.js"></script>
  <script src="login/js/bootstrap.min.js"></script>
  <script src="login/js/main.js"></script>
</html>