<!DOCTYPE html>
<html lang="en">
<head>
   <title>Angular Module JS</title>
   <script src="${pageContext.request.contextPath}/resources/js/angular.js"></script>   
   <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>   
   <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">   

   <!-- Custom Script Files -->
   <script src="${pageContext.request.contextPath}/resources/js/practice/controller/customdirectives-scope.js"></script>  
</head>
<body style="background-color: WhiteSmoke">
<div class="container" ng-app='mainModule' ng-controller="mainController">
	<div class="page-header">
		<h1>Angular JS - Custom Directives Scope</h1>
	</div>

	<div class="row">
		<h3>Base Scope</h3>
		<div class="col-md-6" ng-init="bFirstname='Yagna';bLastname='Sree'">
			<label>First Name:</label> <input type="text" ng-model='bFirstname'><br/>
			<label>Last Name:</label> <input type="text" ng-model='bLastname'><br/>
		</div>
		<div class="col-md-6">
			<label>First Name:</label> {{bFirstname}}<br/>
			<label>Last Name:</label> {{bLastname}}<br/>
		</div>
	</div>
	<hr/>
	<div class="row">
		<div class="col-md-6">
			<h3>Shared Scope</h3>
			<p>Shared scope simply means that the directive works with the same scope that is already available for the DOM node where the directive appears without creating a new one</p>
			<div rb-shared-directive>
				This would be replaced
			</div>
		</div>
		<div class="col-md-6">
			<h3>Inheritance Scope</h3>
			<p>A new scope is created for our directive, but it inherits all the properties of the parent scope through JavaScript's prototypal inheritance: when the directive accesses a property on it's new scope, the property is first searched on the current scope and if it's found then it's value is returned, otherwise, if it's not found, the same property name is searched in the parent scope and that value is returned</p>
			<div rb-inherited-directive>
				This would be replaced
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6">
			<h3>Isolated Scope</h3>
			<p>Using '@', we can set the values to given variable.  Using '=', we can link other variables.  Using '@', we can call methods.  In this case we are calling 'updateName' method which is derived at 'mainController'.</p>
			<div rb-isolated-directive dir-first-name="John" dir-last-name="bLastname" dir-update-name-method='updateName(newFirstname, newLastname)'>
				This woudl be replaced
			</div>
		</div>
		<div class="col-md-6">
		</div>
	</div>
</div>
</body>
</html>
