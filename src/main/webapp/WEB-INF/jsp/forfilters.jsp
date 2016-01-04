<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<head>
   <title>Angular Module JS</title>
   <script src="${pageContext.request.contextPath}/resources/js/angular.js"></script>   
   <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>   
   <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">   

   <script src="${pageContext.request.contextPath}/resources/js/practice/formattingfilters.js"></script>  
</head>
<body style="background-color: WhiteSmoke">
<div class="container" ng-app='mainModule'>
	<div class="page-header">
		<h1>Angular JS - Formating Filters</h1>
	</div>
	
	<div class="row"> 
		<div ng-controller="sFilterController">
			<div class="col-md-6">
				<h3>Simple Filter (upper case/lower case)</h3>
				<label>Enter: </label><input type="text" ng-model="sfilterdata" /> <br/>
				<label>Upper Case: </label>{{ sfilterdata | uppercase }} <br/>
			</div>
			<div class="col-md-6">
				<h3>Chained Filters (lowercase and substring) </h3>
				<label>Lower Case: </label>{{ sfilterdata | lowercase }} <br/>
				<label>Substring (first 5): </label>{{ sfilterdata | lowercase | limitTo:5 }}<br/>
				<label>Substring (4 to 7): </label>{{ sfilterdata | lowercase | limitTo: 5 : 3 }}
			</div>
		</div>
	</div>
	<hr/>
	<div class="row"> 
		<div ng-controller="sFilterController">
			<div class="col-md-6">
				<h3>Filters In Java Script</h3>
				<label>Current Date: </label> {{ datedata }} <br/>
				<label>Fomatted Date: </label> {{ datedata | date }}<br/>
				<label>Fomatted Date (dd/mm/yyyy): </label> {{ datedata | date:"dd/MM/yyyy" }}
			</div>
			<div class="col-md-6">
				<h3>Utility Functions</h3>
				<label>dd/mm/yyyy (Function): </label> {{ formatDate1(datedata,"dd/MM/yyyy") }}<br/>
				<p> formatDate1 retrieves the date filter using the $filter variable. That variable is available for us using Dependency Injection and allows to retrieve any available filter</p>
				<label>dd/MMM/yyyy HH:mm:ss sss (Function2): </label> {{ formatDate1(datedata,"dd/MMM/yyyy HH:mm:ss sss") }}<br/>
				<p>We can retrieve the date filter through Dependecy Injection also specifying as a module function argument (the controller function in this case) the name of the filter with a Filter suffix. Here we've written dateFilter as a function argument because we want the filter named date.</p>
			</div>
		</div>
	</div>
	<hr/>
	<div class="row"> 
		<div ng-controller="sFilterController">
			<div class="col-md-6">
				<h3>Custom Currrency Filter</h3>
				<label>Enter Value</label> <input type='text' ng-model='cValue' /> <br/>
				<label>Currency Value (default) </label> {{ cValue | customCurrency }} <br/>
				<label>Currency Value (parameters) </label> {{ cValue | customCurrency:'$':'-':' ':3 }}
			</div>
			<div class="col-md-6">
			</div>
		</div>
	</div>
	<hr/>
	<div class="row"> 
		<div ng-controller="tableController">
			<div class="col-md-6">
				<h3>Table Filters</h3>
				<label>Filter Value</label> <input type='text' ng-model='cValue' /> <br/>
				<table border=1>
					<tr><th>Value</th><th>Name</th></tr>
					<tr ng-repeat="arrVal in arrayVals">
						<tr>{{ arrVal.value }}</tr>
						<tr>{{ arrVal.name }}</tr>
					</tr>
				</table>
				<p>Try to Type something </p>
			</div>
			<div class="col-md-6">
			</div>
		</div>
	</div>
</div>
</body>
</html>
