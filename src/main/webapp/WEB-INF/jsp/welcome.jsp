<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<head>
   <title>Angular Basic JS</title>
   <script src="${pageContext.request.contextPath}/resources/js/angular.js"></script>   
   <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>   
   <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">   

   <script src="${pageContext.request.contextPath}/resources/js/practice/app.js"></script>  
   <script src="${pageContext.request.contextPath}/resources/js/practice/controller/basic.js"></script>   
</head>
<body style="background-color: WhiteSmoke">
<div class="container" ng-app='myApp' ng-init="firstname = 'Yagna'; lastname='Shree'">
	<div class="page-header">
		<h1>Angular JS - Basic</h1>
		<p>Basics of Angular JS. Angular is initialized through 'ng-app' attribute in any tag.  Only one 'ng-app' for page</p>
	</div>
	
	<div class="row"> 
		<div class="col-md-6">
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
		</div>
		<div class="col-md-6">
			<h3>Controller</h3>
			<div ng-controller="simpleController">
				<p>Values are binded using 'ng-model' in 'ng-controller'</p>
				
				<label>First Name</label> <input type="text" ng-model="firstName" /><br/>
				<label>Last Name</label> <input type="text" ng-model="lastName" /><br/>
				
				<h4>Entered Values are </h4>
				<label>First Name</label> {{ firstName }} <br/>
				<label>Last Name</label> {{ lastName }} <br/>
				<label>Full Name</label> {{ fullName() }} <br/>
			</div>
		</div>
	</div>
	<hr/>
	
	<div ng-controller="simpleSecondController" class="row">
		<div class="col-md-6">
			<h3>Multiple Controllers</h3>
			<p>Values are binded using 'ng-model' in 'ng-controller'</p>
			
			<label>Name</label> <input type="text" ng-model="name" /><br/>
			<label>Father Name</label> <input type="text" ng-model="fathername" /><br/>
			
			<h4>Address </h4>
			<address>
			{{ name }}, <br/>
			d/o {{ fathername }}.
			</address>
		</div>
		
		<div class="col-md-6">
			<h3>Nested Controllers</h3>
			<div ng-controller="simpleNestedController">
				<p>This controller is part of 'Multiple Controllers', so we are able to access its binding variables </p>
				<label>City</label> <input type="text" ng-model="city" /><br/>
				
				<h4>Full Address </h4>
				<address>
				{{ name }}, <br/>
				d/o {{ fathername }}, <br/>
				{{ city }}.
				</address>
			</div>
		</div>
	</div>
	<hr/>

</div>
</body>
</html>
