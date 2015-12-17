<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<head>
   <title>Angular Basic JS</title>
   <script src="${pageContext.request.contextPath}/resources/js/angular.js"></script>   
   <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>   
   <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">   
</head>
<body style="background-color: WhiteSmoke">
<div class="container">
	<div class="page-header">
		<h1>Angular JS</h1>
	</div>
	
	<div class="col-md-3">
		<ul class="list-group">
			<li class="list-group-item"><a href="${pageContext.request.contextPath}/page?page=basic">Basic</a></li>
			<li class="list-group-item"><a href="${pageContext.request.contextPath}/page?page=module">Module</a></li>
			<li class="list-group-item"><a href="${pageContext.request.contextPath}/page?page=eventhandlers">Event Handlers</a></li>
		</ul>
	</div>
</div>
</body>
</html>
