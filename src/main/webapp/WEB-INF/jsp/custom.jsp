<!DOCTYPE html>
<html lang="en">
  <head>
    <title>AngularJS Custom Directives example</title>

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
	<center><h1>AngularJS Custom Directives Demo</h1></center>
	<hr/>
   
   <div ng-controller="cntlr">
	<center><h2>{{ message }}</h2></center>
	
	<student src="st1"></student>
	<br/>
	<student src="st2"></student>
	
   </div>
   
   <div ng-controller="cntlr2">
	<center><h2>{{ message }}</h2></center>
	
	<student src="st1"></student>
	<br/>
	<student src="st2"></student>
	
   </div>
   
    <script src="${pageContext.request.contextPath}/resources/js/angular.js"></script>   
	<script src="${pageContext.request.contextPath}/resources/js/angular-route.js"></script>   
	<script src="${pageContext.request.contextPath}/resources/js/angular-animate.js"></script>   
	<script src="${pageContext.request.contextPath}/resources/js/angular-aria.js"></script>   
	<script src="${pageContext.request.contextPath}/resources/js/angular-cookies.js"></script>   
	<script src="${pageContext.request.contextPath}/resources/js/angular-loader.js"></script>   
	<script src="${pageContext.request.contextPath}/resources/js/angular-touch.js"></script>   
	
	<script src="${pageContext.request.contextPath}/resources/js/customapp.js"></script>
  </body>
</html>
