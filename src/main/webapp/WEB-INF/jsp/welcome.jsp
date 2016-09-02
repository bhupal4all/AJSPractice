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
			//console.log('marking done at service for ' + task);
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
			//console.log('deleting at service at ' + index + ' ' + task);
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

	app.directive('taskInfo', function($parse){
		var taskInfo = {};
		
		taskInfo.restrict = 'E';
		taskInfo.require = '^ngModel';
		taskInfo.scope = {
			task: "=ngModel"
		};
		taskInfo.template = '<span>{{task.task}}</span>';

		taskInfo.controller = function ($scope, $element) {
			$scope.$watch('task', function(){
				if ($scope.task.done){
					$element.css({'text-decoration':'line-through'});
				};
			}, true);
        }

		return taskInfo;
	});

	app.directive('taskButton', function($parse){
		return {
			restrict: 'E',
			require: '^ngModel',
			scope: {
				task: "=ngModel",
				deleteTaskFn: '&',
				markCompletedFn: '&'
			},
			template: '<button class="btn btn-default btn-xs"><span class="glyphicon"></span></button>',
			link: function($scope, $element, attrs){
				$element.on('click', function() {
					if ($element.find('.glyphicon').hasClass('glyphicon-ok')) {
						$element.find('.glyphicon').removeClass('glyphicon-ok').addClass('glyphicon-remove');

						$scope.$apply(function(){
							$scope.markCompletedFn()($scope.task);
						});
					} else if ($element.find('.glyphicon').hasClass('glyphicon-remove')) {
						$scope.$apply(function(){
							$scope.deleteTaskFn()($scope.task);
						});					
					}
				});
			},
			controller: function($scope, $element) {
				if (!$scope.task.done)
					$element.find('.glyphicon').addClass('glyphicon-ok');
				else
					$element.find('.glyphicon').addClass('glyphicon-remove');
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
