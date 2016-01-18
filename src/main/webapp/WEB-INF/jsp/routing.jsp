<!DOCTYPE html>
<html lang="en">
<head>
   <title>Angular Module JS</title>
   <script src="${pageContext.request.contextPath}/resources/js/angular.js"></script>   
   <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>   
   <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">   

   <!-- Custom Script Files -->
   <script src="${pageContext.request.contextPath}/resources/js/practice/controller/routing.js"></script>  
   <script src="${pageContext.request.contextPath}/resources/js/practice/controller/routing-hashbang.js"></script>  
   <script src="${pageContext.request.contextPath}/resources/js/practice/controller/routing-html5.js"></script>  
</head>
<body style="background-color: WhiteSmoke">
<div class="container">
	<div class="page-header">
		<h1>Angular JS - Routing</h1>
	</div>

	<div class="row">
		<h2>Location Service</h2>
		<div class="col-md-6" ng-app='hashBangModule' ng-controller="mainController">
			<h3>Hashing Mode</h3>
			<div ng-include="'${pageContext.request.contextPath}/common-routing.jsp'"></div>
		</div>
		<div class="col-md-6" ng-app='html5Module' ng-controller="mainController">
			<h3>HTML5 Mode</h3>
			<div ng-include="'${pageContext.request.contextPath}/common-routing.jsp'"></div>
		</div>
	</div>
</div>
</body>
</html>

