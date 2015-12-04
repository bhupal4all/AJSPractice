<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<head>
   <title>Angular JS</title>
   <script src="${pageContext.request.contextPath}/resources/js/angular.js"></script>   
   <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>   
   
   <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">   
   
   <style>
   .hdr{ background: #f4f7f4 !important;}
   </style>
</head>
<body ng-app="demoApp" ng-init="countries=[{locale:'en-US',name:'United States'},{locale:'en-FR',name:'France'}]">
	Message From Spring MVC : ${message}
	<hr/>
	
	<div ng-controller="divCtrlr">
		<h2 class="hdr">{{ 'ng-controller' | lowercase }}</h2>
		<h1>{{ init.title }}</h1>
		<p>{{ init.message }}</p>
	</div>
	<hr/>
	
	<div>
		<h2 class="hdr">{{ 'ng-model' | lowercase }}</h2>
		<label>Enter value: </label><input type="text" value="" ng-model="textInput" />
		<h2>{{ 'ng-bind' | lowercase }}</h2>
		<p>Entered : <span ng-bind="textInput"></span></P>
	</div>
	<hr/>

	<div >
		<h2 class="hdr">{{ 'ng-init' | lowercase }}</h2>
		<p>Initialized through ng-init, countries JSON '{{ countries }}'</P>
	</div>
	<hr/>
	
	<div >
		<h2 class="hdr">{{ 'ng-repeat' | lowercase }}</h2>
		
		<table class="table table-bordered">
			<caption><h3>List of Countries</h3></caption>
			<thead>
				<tr><th>Locale</th><th>Country</th></tr>
			</thead>
			
			<tbody>
				<tr ng-repeat="cntry in countries"><td>{{ cntry.locale }}</td><td>{{ cntry.name }}</td></tr>
			</tbody>
		</table>
	</div>
	<hr/>
	
	<div ng-controller="exprCtrlr">
		<h2 class="hdr">{{ 'Expressions' }}</h2>
		<p>Expression between { { and } } will be processed</P>
		
		<div>
			<br/><label>Name : </label>{{ student.firstName + ' ' + student.lastName }}
			<br/><label>Id : </label>{{ student.id }}
			<br/><label>Total Marks : </label>{{ student.marks[0] + student.marks[1] + student.marks[2] + student.marks[3] + student.marks[4] + student.marks[5] }}
			<br/><label>Books Cost : </label>Rs. {{ bookCost * nbrOfBooks }}
		</div>
	</div>
	<hr/>

	<div ng-controller="exprCtrlr">
		<h2 class="hdr">{{ 'Controllers - ng-controller'  }}</h2>
		
		<div>
			<br/><label>Name : </label>{{ student.firstName + ' ' + student.lastName }}
			<br/><label>Id : </label>{{ student.id }}
			<br/><label>Full Name (js fn) : </label>{{ student.fullname() }}
		</div>
	</div>
	<hr/>
	
	<div ng-controller="exprCtrlr">
		<h2 class="hdr">{{ 'Filters'  }}</h2>
		
		<div>
			<h3>Upper Case</h3>
			<input type="text" ng-model="student.firstName" />
			<p>First Name: {{ student.firstName | uppercase }}</p>
		</div>
		<div>
			<h3>Lower Case</h3>
			<input type="text" ng-model="student.lastName" />
			<p>Last Name: {{ student.lastName | lowercase }}</p>
		</div>
		<div>
			<h3>Currency</h3>
			<p>Total Books Cost: {{ bookCost * nbrOfBooks | currency }}</p>
		</div>

		<div>
			<h3>Filter</h3>
			<p>Enter filter into text box and list will get filtered</p>
			<input type="text" ng-model="subjectName" />
			<ol>
				<li ng-repeat="subjMark in student.marksSubjs | filter:subjectName"><label>{{ subjMark.name }}</label> = {{ subjMark.marks }}</li>
			</ol>
		</div>		

		<div>
			<h3>Order By</h3>
			<p>Ordering the marks list by Subject Name</p>
			<ol>
				<li ng-repeat="subjMark in student.marksSubjs | orderBy: 'name'"><label>{{ subjMark.name }}</label> = {{ subjMark.marks }}</li>
			</ol>
		</div>		
	</div>
	<hr/>
	
	<div ng-controller="exprCtrlr">
		<h2 class="hdr">{{ 'Tables' }}</h2>
		<table border="1">
			<thead>
				<tr><th>Subject</th><th>Marks</th></tr>
			</thead>
			
			<tbody>
				<tr ng-repeat="subjMark in student.marksSubjs"><td>{{ subjMark.name }}</td><td>{{ subjMark.marks }}</td></tr>
			</tbody>
		<table>
	</div>
	<hr/>
	
	<div ng-controller="domCtrlr">
		<h2 class="hdr">{{ 'HTML DOM' }}</h2>
		<div>
			<h3>ng-disabled</h3>
			<input type="checkbox" ng-model="enableButton" />Disable Button<button ng-disabled="enableButton" >click me</button>
			<h3>ng-show</h3>
			<input type="checkbox" ng-model="showButton" />Show Button<button ng-show="showButton" >click me</button>
			<h3>ng-hide</h3>
			<input type="checkbox" ng-model="hideButton" />Hide Button<button ng-hide="hideButton" >click me</button>
			<h3>ng-click</h3>
			<p>Total Clicks {{ clicked }} </p><button ng-click="clicked = clicked + 1" >click me</button>
		</div>
	</div>
	<hr/>

</body>


<script>
	var demoApp = angular.module("demoApp", []);
	
	demoApp.controller("divCtrlr", function($scope){
		$scope.init = {};
		$scope.init.title = "Welcome to Angular JS";
		$scope.init.message = "This is first application";
	});
	
	demoApp.controller("exprCtrlr", function($scope){
		$scope.student={
			id:101, 
			firstName:'Yagna Shree', 
			lastName:'Gangavarapu', 
			marks:[80,90,80,90,80,90],
			marksSubjs: [{name:'Hindi',marks:80},{name:'Telugu',marks:90},{name:'English',marks:80},{name:'Maths',marks:90},{name:'Social',marks:80},{name:'Science',marks:90}],
			fullname: function(){
				return 'Miss. ' + $scope.student.firstName + '' + $scope.student.lastName;
			}
		};
		$scope.bookCost=25;
		$scope.nbrOfBooks=9;
	});
	
	demoApp.controller("domCtrlr", function($scope){
		$scope.clicked=0;
	});
</script>

</html>
