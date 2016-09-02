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
