<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<head>
   <title>Angular JS - Conditional Display</title>
   <script src="${pageContext.request.contextPath}/resources/js/angular.js"></script>   
   <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>   
   <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">   

   <script src="${pageContext.request.contextPath}/resources/js/practice/events.js"></script>  
   
   <style>
	img { 
		border:1px solid #021a40;
	}
   </style>
</head>
<body style="background-color: WhiteSmoke">
<div class="container" ng-app='mainModule'>
	<div class="page-header">
		<h1>Angular JS - Conditional Display</h1>
	</div>
	
	<div class="col-md-6">
		<h3>Show</h3>
		Show Below Box <input type='checkbox' ng-model="showCheck"><br/>
		<div ng-show="showCheck" style="width:50px; height:50px; background-color: Red;"> </div>
	</div>
	<div class="col-md-6">
		<h3>Hide</h3>
		Hide Below Box <input type='checkbox' ng-model="hideCheck"><br/>
		<div ng-hide="hideCheck" style="width:50px; height:50px; background-color: Green;"> </div>
	</div>
	<div class="col-md-6">
		<h3>Switch Case</h3>
		Enter (1-3) value <input type='text' ng-model='switchInput' /><br/>
		<div ng-switch="switchInput">
			<div ng-switch-when="1">
				<h4>First</h4>
				<p>This is First Paragraph</p>
			</div>
			<div ng-switch-when="2">
				<h4>Second</h4>
				<p>This is Second Paragraph</p>
			</div>
			<div ng-switch-when="3">
				<h4>Third</h4>
				<p>This is Third Paragraph</p>
			</div>
			<div ng-switch-default>
				<p>Invalid Entry</p>
			</div>
		</div>		
	</div>
	<div class="col-md-6">
		<h3>If Case</h3>
		Logged In <input type='checkbox' ng-model='loggedinCheck' /><br/>
		<div ng-if="loggedinCheck">
			<h4>Welcome User</h4>
			<p>How are you?</p>
		</div>
		<div ng-if="!loggedinCheck">
			<h4>Dear Guest,</h4>
			<p>Please Sign Up or Login</p>
		</div>
	</div>	
	<div class="col-md-6">
		<h3>Include from other page</h3>
		
		<h4>Simple Include</h4>
		<div ng-include="'include1.jsp'" style="border-style: solid;">
		</div>
		<h4>Conditional Include</h4>
		Include 1 <input type='checkbox' ng-model='check' /><br/>
		<div ng-include="check ? 'include1.jsp' : 'include2.jsp'" style="border-style: solid;">
		</div>
	</div>	
</div>
</body>
</html>
