<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<head>
   <title>Angular Module JS</title>
   <script src="${pageContext.request.contextPath}/resources/js/angular.js"></script>   
   <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>   
   <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">   

   <script src="${pageContext.request.contextPath}/resources/js/practice/controller/http-service.js"></script>  
</head>
<body style="background-color: WhiteSmoke">
<div class="container" ng-app='mainModule' ng-controller="mainController" ng-init="baseUrl='${pageContext.request.requestURL}/${pageContext.request.contextPath}'">
	<div class="page-header">
		<h1> {{headerMsg}} </h1>
	</div>

	<div class="row">
		<div class="col-md-6">
			<h3>Simple Get Method</h3>
			<button ng-click='simpleGetFn(true)'>Success</button>
			<button ng-click='simpleGetFn(false)'>Failure</button>
			<br/>
			<textarea rows="10" cols="50">{{simpleGetResult}}</textarea>
		</div>
	</div>
</div>
</body>
</html>
