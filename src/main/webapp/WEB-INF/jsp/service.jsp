<!DOCTYPE html>
<html lang="en">
  <head>
    <title>AngularJS Services example</title>

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
	<center><h1>AngularJS Services Demo</h1></center>
    <div class="container">
		<div class="row">
			<div class="col-md-3">
			   <ul class="nav">
					<li><a href="#Addition"> Addition </a></li>
					<li><a href="#Multiplication"> Multiplication </a></li>
				</ul>
			</div>
			<div class="col-md-9">
				<div ng-view></div>
			</div>
		</div>
    </div><!-- /.container -->

	<script type="text/ng-template" id="Welcome.html">
		<h2>{{message}}</h2>
	</script>

	<script type="text/ng-template" id="Common.html">
		<h2> {{ title }} </h2>
		<table>
			<tr><td>Operand 1</td><td><input type="number" ng-model="operand1" /></td></tr>
			<tr><td>Operand 2</td><td><input type="number" ng-model="operand2" /></td></tr>
			<tr><td>Result</td><td>{{ execute(operand1, operand2) }}</td></tr>
		</table>
	</script>

    <script src="${pageContext.request.contextPath}/resources/js/angular.js"></script>   
	<script src="${pageContext.request.contextPath}/resources/js/angular-route.js"></script>   
	<script src="${pageContext.request.contextPath}/resources/js/angular-animate.js"></script>   
	<script src="${pageContext.request.contextPath}/resources/js/angular-aria.js"></script>   
	<script src="${pageContext.request.contextPath}/resources/js/angular-cookies.js"></script>   
	<script src="${pageContext.request.contextPath}/resources/js/angular-loader.js"></script>   
	<script src="${pageContext.request.contextPath}/resources/js/angular-touch.js"></script>   
	
	<script src="${pageContext.request.contextPath}/resources/js/appservice.js"></script>
  </body>
</html>
