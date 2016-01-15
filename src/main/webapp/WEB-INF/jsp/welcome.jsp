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
		<h1>Angular JS {{ angular.version.full }}</h1>
	</div>
	
	<div class="col-md-3">
		<ul class="list-group">
			<li class="list-group-item"><a href="${pageContext.request.contextPath}/page?page=basic">Basic</a></li>
			<li class="list-group-item"><a href="${pageContext.request.contextPath}/page?page=module">Module</a></li>
			<li class="list-group-item"><a href="${pageContext.request.contextPath}/page?page=eventhandlers">Event Handlers</a></li>
			<li class="list-group-item"><a href="${pageContext.request.contextPath}/page?page=conditionaldisplay">Conditional Display</a></li>
			<li class="list-group-item"><a href="${pageContext.request.contextPath}/page?page=collections">Collections</a></li>
			<li class="list-group-item"><a href="${pageContext.request.contextPath}/page?page=forfilters">Formating Filters</a></li>
			<li class="list-group-item"><a href="${pageContext.request.contextPath}/page?page=forms">Forms</a></li>
			<li class="list-group-item"><a href="${pageContext.request.contextPath}/page?page=customdirectives">Custom Directives</a></li>
			<li class="list-group-item"><a href="${pageContext.request.contextPath}/page?page=custom-template">Custom Directives - Templates</a></li>
			<li class="list-group-item"><a href="${pageContext.request.contextPath}/page?page=custom-scope">Custom Directives - Scope</a></li>
			<li class="list-group-item"><a href="${pageContext.request.contextPath}/page?page=custom-controller">Custom Directives - Controller</a></li>
			<li class="list-group-item"><a href="${pageContext.request.contextPath}/page?page=custom-priority">Custom Directives - Priority</a></li>
			<li class="list-group-item"><a href="${pageContext.request.contextPath}/page?page=custom-restrict">Custom Directives - Restrict</a></li>
			<li class="list-group-item"><a href="${pageContext.request.contextPath}/page?page=custom-transclude">Custom Directives - Transclude</a></li>
		</ul>
	</div> 
</div>
</body>
</html>
