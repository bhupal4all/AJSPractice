<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<head>
   <title>Angular Module JS</title>
   <script src="${pageContext.request.contextPath}/resources/js/angular.js"></script>   
   <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>   
   <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">   

   <script src="${pageContext.request.contextPath}/resources/js/practice/app.js"></script>  
   <script src="${pageContext.request.contextPath}/resources/js/practice/controller/basic.js"></script>   
</head>
<body style="background-color: WhiteSmoke">
<div class="container" ng-app='myApp' ng-init="firstname = 'Yagna'; lastname='Shree'">
	<div class="page-header">
		<h1>Angular JS - Module</h1>
	</div>
	
	<div class="row"> 
		<div class="col-md-6">
		</div>
	</div>
</div>
</body>
</html>
