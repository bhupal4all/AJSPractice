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
		<div class='input-group'>
			<input id='taskentry' type='text' class="form-control" placeholder='Enter Task here' ng-model="inputTask" />
			<div class="input-group-btn">
				<button id='addBtn' type="button" ng-click="addTask()" class="btn btn-default">{{btnLabel}}</button>
			</div>
		</div>
		<div>
			<table id='tasklist' class='table table-bordered table-hover'>
				<tr ng-repeat="task in tasks | orderBy : 'done'">
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
	var app = angular.module("mainModule", []);

	app.service('TodoService',function(){
		var tasks = [{
				task: 'One',
				done: false
			}, {
				task: 'Two',
				done: true
			}, {
				task: 'Three',
				done: false
			}];

		this.getTasks = function() {
			return tasks;
		};

		this.markTaskDone = function(task){
			task.done = true;
		}

		this.addTask = function(taskName){
			tasks.push({
				task: taskName,
				done: false
			});
		};

		this.getRemaining = function() {
			var count = 0;
			angular.forEach(tasks, function(task) {
				if (!task.done) count++;
			});

			return count;
		};

		this.deleteTask = function(task) {
			var index = tasks.indexOf(task);
			tasks.splice(index, 1);
		};

		this.clearCompletedTasks = function() {
			var i = tasks.length;
			while (i--){
				var task = tasks[i];
				if (task.done) {
					this.deleteTask(task);
				}
			}
		};
	});
	
	app.controller("simpleController", function($scope, TodoService) {
		$scope.tasks = TodoService.getTasks();
		$scope.getRemaining = TodoService.getRemaining;
		$scope.clearCompletedTasks = TodoService.clearCompletedTasks;
		$scope.deleteTask = TodoService.deleteTask;
		$scope.markCompleted = TodoService.markTaskDone;

		$scope.btnLabel = "Add";
		$scope.inputTask = "";

		$scope.addTask = function() {
			TodoService.addTask($scope.inputTask);
			$scope.inputTask = "";
		};

		$scope.applyStyle = function(task) {
			if (task.done) return { 'text-decoration':'line-through'}
		};
	});

</script>

</html>
