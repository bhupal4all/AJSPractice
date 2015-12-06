<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<head>
   <title>Angular JS</title>
   <script src="${pageContext.request.contextPath}/resources/js/angular.js"></script>   
   <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>   
   
   <script src="${pageContext.request.contextPath}/resources/js/app.js"></script>   
   <script src="${pageContext.request.contextPath}/resources/js/controllers.js"></script>   
   
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

	<div ng-controller="formCtrlr">
		<h2 class="hdr">{{ 'FORM - ng-click' }}</h2>
		<form name="studentForm" novalidate>
			<div>
				<table>
					<tr>
						<td><label>First Name</label></td>
						<td><input name = "firstname" type = "text" ng-model = "firstName" required>
						 <span style = "color:red" ng-show = "studentForm.firstname.$dirty && studentForm.firstname.$invalid">
							<span ng-show = "studentForm.firstname.$error.required">First Name is required.</span>
						 </span>
					  </td>
				  </tr>
					<tr><td>Last Name</td><td><input type="text" ng-model="lastName" required /></td></tr>
					<tr><td><button ng-click="reset()" >Reset</button></td><td><button ng-click="" >Submit</button></td></tr>
				</table>
			</div>
		</form>
	</div>

	<div ng-controller="formCtrlr">
		<h2 class="hdr">{{ 'ng-include - NOT WORKING' }}</h2>
		<p>loading from ${pageContext.request.contextPath}/resources/includes/student.jsp</p>
		<div ng-include="'${pageContext.request.contextPath}/resources/includes/student.jsp'"></div>
	</div>

	<div ng-controller="httpCtrlr">
		<h2 class="hdr">{{ 'http' }}</h2>
		
		<table border=1>
			<tr><th>Id</th><th>Name</th><th>Percentile</th></tr>
			<tr ng-repeat="student in students"><td>{{ student.Id }}</td><td>{{ student.Name }}</td><td>{{ student.Percentile }}</td></tr>
		</table>
	</div>
</body>
</html>
