<!DOCTYPE html>
<html lang="en">
  <head>
    <title>AngularJS Custom Filter example</title>

    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>   
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">   

    <style>
		body {
		  padding-top: 10px;
		  background-color: #F5F5F5;
		}
    </style>
  </head>

  <body ng-app="sampleApp">
	<center><h1>AngularJS Custom Filter Demo</h1></center>
	<hr/>
	<div ng-controller="filterController">
		<input type="text" ng-model="inputStr" /><br/>
		<label>Entered : </label>{{ inputStr }}<br/>
		<label>Reversed : </label> {{ inputStr | reverse }}<br/>
		<label>Reversed + UpperCase : </label> {{ inputStr | reverse:true }}
	</div>
    
    <script src="${pageContext.request.contextPath}/resources/js/angular.js"></script>   
	<script src="${pageContext.request.contextPath}/resources/js/angular-route.js"></script>   
	<script src="${pageContext.request.contextPath}/resources/js/angular-animate.js"></script>   
	<script src="${pageContext.request.contextPath}/resources/js/angular-aria.js"></script>   
	<script src="${pageContext.request.contextPath}/resources/js/angular-cookies.js"></script>   
	<script src="${pageContext.request.contextPath}/resources/js/angular-loader.js"></script>   
	<script src="${pageContext.request.contextPath}/resources/js/angular-touch.js"></script>   
	
	<script src="${pageContext.request.contextPath}/resources/js/customfilter.js"></script>
  </body>
</html>
