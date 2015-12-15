<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<head>
   <title>Angular Basic JS</title>
   <script src="${pageContext.request.contextPath}/resources/js/angular.js"></script>   
   <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>   
   <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">   

   <script src="${pageContext.request.contextPath}/resources/js/practice/simpleController.js"></script>   
</head>
<body style="background-color: WhiteSmoke">
<div class="container" ng-app ng-init="firstname = 'Yagna'; lastname='Shree'">
	<div class="page-header">
		<h1>Angular JS - Basic</h1>
		<p>Basics of Angular JS. Angular is initialized through 'ng-app' attribute in any tag.  Only one 'ng-app' for page</p>
	</div>
	
	<h3>One Way Binding</h3>
	<div>
		<p>Values are initialized through 'ng-init'</p>
		<label>First Name</label> <span ng-bind='firstname'></span><br/>
		<label>Last Name</label> <span ng-bind='lastname'></span><br/>
	</div>
	<hr/>
	
	<h3>Two Way Binding</h3>
	<div>
		<p>Values are binded using 'ng-model'</p>
		<label>First Name</label> <input type="text" ng-model="firstname" /><br/>
		<label>Last Name</label> <input type="text" ng-model="lastname" /><br/>
		
		<h4>Entered Values are </h4>
		<label>First Name</label> {{ firstname }} <br/>
		<label>Last Name</label> {{ lastname }} <br/>
	</div>
	<hr/>
	
	<h3>Controller</h3>
	<div ng-controller="simpleController">
		<p>Values are binded using 'ng-model' in 'ng-controller'</p>
		<label>First Name</label> <input type="text" ng-model="firstname" /><br/>
		<label>Last Name</label> <input type="text" ng-model="lastname" /><br/>
		
		<h4>Entered Values are </h4>
		<label>First Name</label> {{ firstname }} <br/>
		<label>Last Name</label> {{ lastname }} <br/>
		<label>Full Name</label> {{ fullname() }} <br/>
	</div>
	<hr/>
	
</div>
</body>
</html>
