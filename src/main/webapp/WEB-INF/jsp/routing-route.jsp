<!DOCTYPE html>
<html lang="en">
<head>
   <title>Angular Module JS</title>
   <script src="${pageContext.request.contextPath}/resources/js/angular.js"></script>   
   <script src="${pageContext.request.contextPath}/resources/js/angular-route.js"></script>   
   <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>   
   <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">   

   <!-- Custom Script Files -->
   <script src="${pageContext.request.contextPath}/resources/js/practice/controller/routing-route.js"></script>  
</head>
<body style="background-color: WhiteSmoke">
<div class="container">
	<div class="page-header">
		<h1>Angular JS - Route Routing</h1>
	</div>

	<div class="row" ng-app='mainModule' ng-controller="mainController">
		<h3>Routing through ng-route</h3>
		<div class="col-md-6">
			<a href="${pageContext.request.contextPath}/page?page=routing-route#default">Default</a> <br/>
			<a href="${pageContext.request.contextPath}/page?page=routing-route#viewone">View One</a> <br/>
		</div>
		<div class="col-md-6">
			<div style='border: 1px solid black;' ng-view>
				This would be replaced
			</div>
		</div>
	</div>
</div>
</body>
</html>

