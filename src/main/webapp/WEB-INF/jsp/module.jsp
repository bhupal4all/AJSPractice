<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<head>
   <title>Angular Module JS</title>
   <script src="${pageContext.request.contextPath}/resources/js/angular.js"></script>   
   <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>   
   <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">   

   <script src="${pageContext.request.contextPath}/resources/js/practice/module.js"></script>  
</head>
<body style="background-color: WhiteSmoke">
<div class="container" ng-app='mainModule'>
	<div class="page-header">
		<h1>Angular JS - Module</h1>
	</div>
	
	<div class="row"> 
		<div class="col-md-6">
			<h3>Module Controller</h3>
			<div ng-controller="moduleController">
				<p>Values are binded using 'ng-controller' by creating an object</p>
				
				<label>First Name</label> <input type="text" ng-model="person.firstname" /><br/>
				<label>Last Name</label> <input type="text" ng-model="person.lastname" /><br/>
				
				<h4>Entered Values are </h4>
				<label>First Name</label> {{ person.firstname }} <br/>
				<label>Last Name</label> {{ person.lastname }} <br/>
				<label>Full Name</label> {{ person.fullname() }} <br/>
			</div>
		</div>
		<div class="col-md-6">
			<h3>Value Controller</h3>
			<div ng-controller="valueController">
				<p>Values are binded using 'ng-controller' by updating intialized object</p>
				
				<label>First Name</label> <input type="text" ng-model="personInstance.firstname" /><br/>
				<label>Last Name</label> <input type="text" ng-model="personInstance.lastname" /><br/>
				
				<h4>Entered Values are </h4>
				<label>First Name</label> {{ personInstance.firstname }} <br/>
				<label>Last Name</label> {{ personInstance.lastname }} <br/>
				<label>Full Name</label> {{ personInstance.fullname() }} <br/>
			</div>
		</div>
	</div>
	<hr/>
	<div class="row"> 
		<div class="col-md-6">
			<h3>Service Controller</h3>
			<div ng-controller="serviceController">
				<label>First Name</label> <input type="text" ng-model="personManagerInstance.personInstance.firstname" /><br/>
				<label>Last Name</label> <input type="text" ng-model="personManagerInstance.personInstance.lastname" /><br/>
				
				<h4>Entered Values are </h4>
				<label>First Name</label> {{ personManagerInstance.getFirstName() }} <br/>
				<label>Last Name</label> {{ personManagerInstance.getLastName() }} <br/>
				<label>Full Name</label> <b>{{ personManagerInstance.getFullName(' * ') }}</b> <br/>
			</div>
		</div>
		<div class="col-md-6">
			<h3>Factory Controller</h3>
			<div ng-controller="factoryController">
				<label>First Name</label> <input type="text" ng-model="fpersonInstance.firstname" /><br/>
				<label>Last Name</label> <input type="text" ng-model="fpersonInstance.lastname" /><br/>
				
				<h4>Entered Values are </h4>
				<label>First Name</label> {{ personFactoryInstance.getFirstName() }} <br/>
				<label>Last Name</label> {{ personFactoryInstance.getLastName() }} <br/>
				<label>Full Name</label> <b>{{ personFactoryInstance.getFullName(' - ') }}</b> <br/>
			</div>
		</div>
	</div>
	<hr/>
	<div class="row"> 
		<div class="col-md-6">
			<h3>Provider Controller</h3>
			<div ng-controller="providerController">
				<label>First Name</label> <input type="text" ng-model="ppersonInstance.firstname" /><br/>
				<label>Last Name</label> <input type="text" ng-model="ppersonInstance.lastname" /><br/>
				
				<h4>Entered Values are </h4>
				<label>First Name</label> {{ personProviderInstance.getFirstName() }} <br/>
				<label>Last Name</label> {{ personProviderInstance.getLastName() }} <br/>
				<label>Full Name</label> <b>{{ personProviderInstance.getFullName(' # ') }}</b> <br/>
			</div>
		</div>
		<div class="col-md-6">
			<h3>Configuration Provider Controller</h3>
			<div ng-controller="configController">
				<label>First Name</label> <input type="text" ng-model="cpersonInstance.firstname" /><br/>
				<label>Last Name</label> <input type="text" ng-model="cpersonInstance.lastname" /><br/>
				
				<h4>Entered Values are </h4>
				<label>First Name</label> {{ configPersonProviderInstance.getFirstName() }} <br/>
				<label>Last Name</label> {{ configPersonProviderInstance.getLastName() }} <br/>
				<label>Full Name</label> <b>{{ configPersonProviderInstance.getFullName() }}</b> <br/>
			</div>
		</div>
	</div>
	<hr/>
	<div class="row"> 
		<div class="col-md-6">
			<h3>Dependency</h3>
			<div ng-controller="dependencyController">
				<label>Provider 1:</label> {{ provider1Instance.getId() }}<br/>
				<label>Provider 2:</label> {{ provider2Instance.getId() }}<br/>
				<label>Provider 3:</label> {{ provider3Instance.getId() }}<br/>
				<label>Provider 4:</label> {{ provider4Instance.getId() }}<br/>
			</div>
		</div>
		<div class="col-md-6">
		</div>
	</div>
	<hr/>
</div>
</body>
</html>
