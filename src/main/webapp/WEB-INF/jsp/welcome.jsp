<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<head>
   <title>Angular JS</title>
   <script src="${pageContext.request.contextPath}/resources/js/angular.js"></script>   
   <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>   
   <script src="${pageContext.request.contextPath}/resources/js/mustache.min.js"></script>   
   
   <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">   
</head>

<body>
	<div class="container" ng-app="mainModule" ng-controller="simpleController">
		<div class="jumbotron">
			<h1>Todo List</h1>
			<p class="lead">Bootstrap CSS, JQuery and Angular JS are being used</p>
		</div>

		<!-- Todo List -->
		<div class='input-group'>
			<input id='taskentry' type='text' class="form-control" placeholder='Enter Task here' ng-model="inputTask" />
			<div class="input-group-btn">
				<button id='addBtn' type="button" ng-click="addTask()" class="btn btn-default">{{btnLabel}}</button>
			</div>
		</div>
		<div>
			<table id='tasklist' class='table table-bordered table-hover'>
				<tr ng-repeat="task in tasks">
					<td width='50px;' style='text-align: center'>
						<button class="btn btn-default btn-xs">
							<span class="glyphicon glyphicon-ok" ng-click='markCompleted(task)' ng-hide="task.done"></span>
							<span class="glyphicon glyphicon-remove" ng-click='deleteTask(task)' ng-hide="!task.done"></span>
						</button>
					</td>
					<td><span ng-style="applyStyle(task)">{{task.task}}</span></td>
				</tr>
			</table>
		</div>
		<label ng-show='getRemaining()>0'>Pending Tasks Count: {{getRemaining()}} / {{tasks.length}}</label>

		<br/>
		<button type='button' ng-show='tasks.length - getRemaining() > 0' ng-click='clearCompletedTasks()' class='btn btn-default'>Clear Tasks</button>
	</div>

</body>

<script>
	// A simple module with no dependencies
	angular.module("mainModule", [])
		.controller("simpleController", function($scope) {
			$scope.tasks = [{
				task: 'One',
				done: true
			}];

			$scope.btnLabel = "Add";
			$scope.inputTask = "";

			$scope.addTask = function() {
				$scope.tasks.push({
					task: $scope.inputTask,
					done: false
				});
				$scope.inputTask = "";

				$('#tasklist').html(Mustache.to_html(this.template, {
					"tasks": this.taskList
				}));
			};

			$scope.getRemaining = function() {
				var count = 0;
				angular.forEach($scope.tasks, function(task) {
					if (!task.done) count++;
				});

				return count;
			};

			$scope.clearCompletedTasks = function() {
				var i = $scope.tasks.length;
				while (i--){
					var task = $scope.tasks[i];
					if (task.done) {
						$scope.deleteTask(task);
					}
				}
			};

			$scope.markCompleted = function(task) {
				task.done = true;
			};

			$scope.deleteTask = function(task) {
				var index = $scope.tasks.indexOf(task);
				$scope.tasks.splice(index, 1);
			};

			$scope.applyStyle = function(task) {
				if (task.done) return { 'text-decoration':'line-through'}
			};
	});

</script>

</html>
