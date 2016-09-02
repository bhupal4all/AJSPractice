<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<head>
   <title>Angular JS</title>
   <script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>   
   <script src="${pageContext.request.contextPath}/resources/js/angular.js"></script>   
   <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>   
   
   <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">   
</head>

<body>
	<div class="container" ng-app="mainModule" ng-controller="simpleController">
		<div class="jumbotron">
			<h1>Todo List</h1>
			<p class="lead">Bootstrap CSS, JQuery and Angular JS are being used</p>
		</div>

		<!-- Todo List -->
		<form name='myform'>
		<div class='input-group'>
			<input id='taskentry' name='taskentry' type='text' class="form-control" placeholder='Enter Task here' ng-model="inputTask" required />
			<div class="input-group-btn">
				<button id='addBtn' type="button" ng-click="addTask()" ng-disabled="myform.taskentry.$invalid" class="btn btn-default">{{btnLabel}}</button>
			</div>
		</div>
		</form>
		<div>
			<table id='tasklist' class='table table-bordered table-hover'>
				<tr ng-repeat="task in tasks | orderBy : 'done'">
					<td width='50px;' style='text-align: center'>
						<task-button ng-model="task" mark-completed-fn="markCompleted" delete-task-fn="deleteTask"></task-button>
					</td>
					<td><task-info ng-model="task"></task-info></td>
				</tr>
			</table>
		</div>
		<label ng-show='getRemaining()>0'>Pending Tasks Count: {{getRemaining()}} / {{tasks.length}}</label>

		<br/>
		<button type='button' ng-show='tasks.length - getRemaining() > 0' ng-click='clearCompletedTasks()' class='btn btn-default'>Clear Tasks</button>
	</div>

</body>

   <script src="${pageContext.request.contextPath}/resources/js/app.js"></script>   

</html>
