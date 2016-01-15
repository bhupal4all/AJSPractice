<!DOCTYPE html>
<html lang="en">
<head>
   <title>Angular Module JS</title>
   <script src="${pageContext.request.contextPath}/resources/js/angular.js"></script>   
   <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>   
   <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">   

   <!-- Custom Script Files -->
   <script src="${pageContext.request.contextPath}/resources/js/practice/controller/customdirectives-transclude.js"></script>  
</head>
<body style="background-color: WhiteSmoke">
<div class="container" ng-app='mainModule' ng-controller="mainController">
	<div class="page-header">
		<h1>Angular JS - Custom Directives Transclude</h1>
	</div>

	<div class="row">
		<div class="col-md-6">
			<h3>Base Scope</h3>
			<label>Enter </label> <input type="text" ng-model='scopeVar'/><br/>
			<label>Scope ID:</label> {{$id}} <br/>
			<label>Parent Scope ID:</label> {{$parent.$id}} <br/>
			<label>Scope Variable:</label> {{scopeVar}}
		</div>
		<div class="col-md-6">
			<h3>1. Transclude True</h3>
			<transclude-true style="background-color: lightblue">
				<label>This Content is belongs to tag element html()</label><br/>
				<label>Enter </label> <input type="text" ng-model='scopeVar'/><br/>
				<label>Scope ID:</label> {{$id|number}} <br/>
				<label>Parent Scope ID:</label> {{$parent.$id}} <br/>
				<label>Scope Variable:</label> {{scopeVar}}
			</transclude-true>
		</div>
	</div>
	<div class="row">
		<h3>2. Transclude Element</h3>
		<div class="col-md-6">
			<h3>2.1 Pre Bound Scope</h3>
			<div transclude-element-pre-bound-scope style="background-color: lightyellow">
				<label>This Content is belongs to div</label><br/>
				<label>Enter </label> <input type="text" ng-model='scopeVar'/><br/>
				<label>Scope ID:</label> {{$id}} <br/>
				<label>Parent Scope ID:</label> {{$parent.$id}} <br/>
				<label>Scope Variable:</label> {{scopeVar}}
			</div>
		</div>
		<div class="col-md-6">
		    <h3>2.2. Clone element with pre-bound scope</h3>
			<div transclude-element-pre-bound-scope='clone' style="background-color: lightyellow">
				<h4>This Content is belongs to div</h4>
				<label>Enter </label> <input type="text" ng-model='scopeVar'/><br/>
				<label>Scope ID:</label> {{$id}} <br/>
				<label>Parent Scope ID:</label> {{$parent.$id}} <br/>
				<label>Scope Variable:</label> {{scopeVar}}
			</div>
		</div>
		<div class="col-md-6">
		    <h3>2.3. Clone element and assign Directive Scope</h3>
			<div transclude-element-pre-bound-scope='scopeclone' style="background-color: lightyellow">
				<h4>This Content is belongs to div</h4>
				<label>Enter </label> <input type="text" ng-model='scopeVar'/><br/>
				<label>Scope ID:</label> {{$id}} <br/>
				<label>Parent Scope ID:</label> {{$parent.$id}} <br/>
				<label>Scope Variable:</label> {{scopeVar}}
			</div>
		</div>
	</div>
</div>
</body>
</html>
