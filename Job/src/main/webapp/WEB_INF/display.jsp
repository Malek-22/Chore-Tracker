<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %> 
 <%@ page isErrorPage="true" %> 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

    <!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- Bootstrap 5 CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css" integrity="sha384-r4NyP46KrjDleawBgD5tp8Y7UzmLA05oM1iAEQ17CSuDqnUK2+k9luXQOfXJCJ4I" crossorigin="anonymous">
<!-- Font Awesome CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/styles.css"/>
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<div class="mt-4" style="border:1px solid grey">
<h5 style="color:green"> <c:out value="${job.getAddToTheirFavourite().size() }"></c:out>  users added this job to their favorite</h5>
<h1>Title :  <c:out value="${job.getTitle() }"></c:out> </h1>
<h1>Description :  <c:out value="${job.getDescription() }"></c:out> </h1>
<h1>Posted By :  <c:out value="${job.getCreator().getUserName() }"></c:out> </h1>

<c:if test="${job.getCreator().equals(user) }">
<a class="btn btn-success" href="/edit/${job.id }">Edit</a>
</c:if>
</div>


<div class="mt-4">
<c:if test="${job.getAddToTheirFavourite().contains(user) }">
<a class="btn btn-danger" href="/remove/${job.id}">Remove</a>
</c:if>
<c:if test="${!job.getAddToTheirFavourite().contains(user) }">
<a class="btn btn-success" href="/add/${job.id}">Add</a>
</c:if>
</div>

<div class="mt-4">
<ul>
<c:forEach var="user" items="${job.getAddToTheirFavourite()}">
<li>
<c:out value="${user.getUserName() }"> </c:out>
</li>

</c:forEach>
</ul>
</div>

</div>
</body>
</html>