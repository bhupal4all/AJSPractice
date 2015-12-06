<!DOCTYPE html>
<html lang="en">
  <head>
    <title>AngularJS Routing example</title>

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

    <div class="container">
		<div class="row">
			<div class="col-md-3">
			   <ul class="nav">
					<li><a href="#AddNewOrder"> Add New Order </a></li>
					<li><a href="#ShowOrders"> Show Order </a></li>
				</ul>
			</div>
			<div class="col-md-9">
				<div ng-view></div>
			</div>
		</div>
    </div><!-- /.container -->

	<script type="text/ng-template" id="welcome_order.html">
		<h2>{{message}}</h2>
	</script>

	<script type="text/ng-template" id="add_order.html">
		<h2> Add Order </h2>
		{{message}}
	</script>

	<script type="text/ng-template" id="show_orders.html">
		<h2> Show Orders </h2>
		{{message}}
	</script>

    <script src="${pageContext.request.contextPath}/resources/js/angular.js"></script>   
	<script src="${pageContext.request.contextPath}/resources/js/angular-route.js"></script>   
	<script src="${pageContext.request.contextPath}/resources/js/angular-animate.js"></script>   
	<script src="${pageContext.request.contextPath}/resources/js/angular-aria.js"></script>   
	<script src="${pageContext.request.contextPath}/resources/js/angular-cookies.js"></script>   
	<script src="${pageContext.request.contextPath}/resources/js/angular-loader.js"></script>   
	<script src="${pageContext.request.contextPath}/resources/js/angular-touch.js"></script>   
	<script src="${pageContext.request.contextPath}/resources/js/appview.js"></script>
  </body>
</html>
