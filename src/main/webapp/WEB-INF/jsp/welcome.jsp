<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<head>
   <title>Angular JS</title>
   <script src="${pageContext.request.contextPath}/resources/js/angular.js"></script>   
   <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>   
   
   <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">   
</head>

<body ng-app="demoApp">
	<div ng-controller="divCtrlr">
		<h1>{{ init.title }}</h1>
		<p>{{ init.message }}</p>
	</div>
</body>

<script>
	var demoApp = angular.module("demoApp", []);
	
	demoApp.controller("divCtrlr", function($scope){
		$scope.init = {};
		$scope.init.title = "Welcome to Angular JS";
		$scope.init.message = "This is first application";
	});
</script>

</html>
