<!DOCTYPE html>
<html lang="en">
<head>
   <title>Angular Module JS</title>
   <script src="${pageContext.request.contextPath}/resources/js/angular.js"></script>   
   <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>   
   <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">   

   <!-- Custom Script Files -->
   <script src="${pageContext.request.contextPath}/resources/js/practice/controller/customdirectives-priority.js"></script>  
</head>
<body style="background-color: WhiteSmoke">
<div class="container" ng-app='mainModule' ng-controller="mainController">
	<div class="page-header">
		<h1>Angular JS - Custom Directives Priority</h1>
		<p>The order of Custom Directives compilation will be controlled by 'Priority' (high priority number --> low priority number).  Once the directive which is having terminal: true, then compilation would be stopped (low prority directives wouldnt be executed) </p>
	</div>

	<div class="row">
		<div class="col-md-6">
			<h3>Low, Medium, High tags</h3>
			<div low-priority=1 medium-priority=1 high-priority=1></div>
			<textarea rows="5" cols="50">{{compilationResult1}}</textarea>
		</div>
		<div class="col-md-6">
			<h3>Low Terminal, Medium, High tags</h3>
			<div low-priority=2 low-priority-terminal=2 medium-priority=2 high-priority=2></div>
			<textarea rows="5" cols="50">{{compilationResult2}}</textarea>
		</div>
		<div class="col-md-6">
			<h3>Low, Medium Terminal, High tags</h3>
			<div low-priority=3 medium-priority=3 medium-priority-terminal=3 high-priority=3></div>
			<textarea rows="5" cols="50">{{compilationResult3}}</textarea>
		</div>
		<div class="col-md-6">
			<h3>Low, Medium, High Terminal tags</h3>
			<div low-priority=4 medium-priority=4 high-priority=4 high-priority-terminal=4></div>
			<textarea rows="5" cols="50">{{compilationResult4}}</textarea>
		</div>
	</div>
</div>
</body>
</html>
