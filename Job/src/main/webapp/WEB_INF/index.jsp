<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %> 
 <%@ page isErrorPage="true" %> 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>LoginAndRegistration</title>
</head>
<body>
<div class="container">


	<h2>Register</h2>

	<div class="container">
		<form:form action="/register" modelAttribute="newUser" class="form-control" method="post">
		
			<div class="form-row">
			 	
				<form:label for="userName" path="userName">User Name:</form:label>
				<form:input type="text" path="userName" class="form-control"/>
				<form:errors path="userName" class="badge text-danger"/>
			</div>
			
			<div class="form-row">
				
				<form:label for="email" path="email">Email:</form:label>
				<form:input type="text" path="email" class="form-control"/>
				<form:errors path="email" class="badge text-danger"/>
			</div>
			
			<div class="form-row">
				
				<form:label for="password" path="password">Password:</form:label>
				<form:input type="pasword" path="password" class="form-control"/>
				<form:errors path="password" class="badge text-danger"/>
			</div>
			
			<div class="form-row">
				
				<form:label for="" path="confirm">Confirm:</form:label>
				<form:input type="confirm" path="confirm" class="form-control"/>
				<form:errors path="confirm" class="badge text-danger"/>
			</div>
			
			<div class="form-row">
				<input type="submit" value="Register" class="btn btn-primary  mt-3"/>
			</div>
			
		</form:form>
	</div>
	<hr>
	<h2>Log In</h2>

	<div class="container">
		<form:form action="/login" modelAttribute="newLogin" class="form-control" method="post">
			<div class="form-row">
				
				<form:label for="email" path="email">Email:</form:label>
				<form:input type="text" path="email" class="form-control"/>
				<form:errors path="email" class="badge text-danger"/>
			</div>
			
			<div>
				
				<form:label for="password" path="password">Password:</form:label>
				<form:input type="password" path="password" class="form-control"/>
				<form:errors path="password" class="badge text-danger"/>
			</div>
			
			<div class="form-row">
				<input type="submit" value="Login" class="btn btn-primary  mt-3"/>
			</div>
		
		</form:form>
	</div>
	
</body>
</html>