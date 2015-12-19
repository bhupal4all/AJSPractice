<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<head>
   <title>Angular Module JS</title>
   <script src="${pageContext.request.contextPath}/resources/js/angular.js"></script>   
   <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>   
   <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">   

   <script src="${pageContext.request.contextPath}/resources/js/practice/collections.js"></script>  
</head>
<body style="background-color: WhiteSmoke">
<div class="container" ng-app='mainModule'>
	<div class="page-header">
		<h1>Angular JS - Collections</h1>
	</div>
	
	<div class="row"> 
		<div class="col-md-6">
			<div ng-controller="repeatController">
				<h3>Simple Table</h3>
				<table class="table table-bordered">
					<tr><th>Firstname</th><th>Lastname</th></tr>
					<tr ng-repeat="person in personList"><td>{{person.firstname}}</td><td>{{person.lastname}}</td></tr>
				</table>
			</div>
		</div>
		<div class="col-md-6">
			<div ng-controller="repeatController">
				<h3>Table Row Selection</h3>
				<table class="table table-bordered">
					<tr>
						<th width="30px"><input type='checkbox' ng-model='allcheck' ng-click='selectAllToggle(personList, allcheck)' /></th>
						<th>Firstname</th>
						<th>Lastname</th>
					</tr>
					<tr ng-repeat="person in personList">
						<td><input type='checkbox' ng-model='person.isSelected' /></td>
						<td>{{person.firstname}}</td>
						<td>{{person.lastname}}</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<hr/>
	<div class="row"> 
		<div class="col-md-6">
			<div ng-controller="repeatController">
				<h3>Nested List with Object properties</h3>
				<ol>
					<li ng-repeat="person in personList">
						<ul>
							<li ng-repeat="(propName, propValue) in person"><b>{{$index+1}})</b> '{{propName}}' = '{{propValue}}'</li>
						</ul>
					</li>
				</ol>
			</div>
		</div>
		<div class="col-md-6">
			<div ng-controller="repeatController">
				<h3>List with Special Values</h3>
				<ul>
					<li ng-repeat='person in personList'>{{ person.firstname }} {{ person.lastname }} - {{ positionDesc($first, $middle, $last, $even, $odd) }}</li>
				</ul>
			</div>
		</div>
	</div>
	<hr/>
	<div class="row"> 
		<div class="col-md-6">
			<div ng-controller="repeatController">
				<h3>Adding and Removing Entries</h3>
				
				<div>
					<input type='text' placeholder='Firstname' ng-model='person.firstname' />
					<input type='text' placeholder='Lastname' ng-model='person.lastname' />
					<input type='button' ng-click='addPersonFn(person)' value='Add'></input>
				</div>
				
				<table class="table">
					<tr><th>Firstname</th><th>Lastname</th></tr>
					<tr ng-repeat='person in personList'>
						<td>{{person.firstname}}</td>
						<td>{{person.lastname}}</td>
						<td><input type='button' ng-click='removePersonFn($index)' value='Remove' /></td>
					</tr>
				</table>
				
			</div>
		</div>
		<div class="col-md-6">
		</div>
	</div>
</div>
</body>
</html>
