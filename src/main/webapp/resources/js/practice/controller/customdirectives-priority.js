///////////////////////////////////////////////////////////////////////////////
// Logging Start
var logScope = null;
var compilationResult1 = '';
var compilationResult2 = '';
var compilationResult3 = '';
var compilationResult4 = '';

var logLine = function(value, message){
	if (logScope){
		logScope['compilationResult'+value] += '[ '+message+' ]\n';
	}else{
		this['compilationResult'+value] += '[ '+message+' ]\n';
	}
}

///////////////////////////////////////////////////////////////////////////////
// Main Module
///////////////////////////////////////////////////////////////////////////////	
angular.module('mainModule', [])

	.controller('mainController',['$scope',function($scope){
		$scope.compilationResult1 = compilationResult1;
		$scope.compilationResult2 = compilationResult2;
		$scope.compilationResult3 = compilationResult3;
		$scope.compilationResult4 = compilationResult4;

		logScope = $scope;
	}])

	.directive('lowPriority', function(){
		return {
			priority: 10,
			compile: function(element, attributes){
				logLine(attributes.lowPriority, 'compile / lowPriority');
			}
		}
	})

	.directive('mediumPriority', function(){
		return {
			priority: 20,
			compile: function(element, attributes){
				logLine(attributes.mediumPriority, 'compile / mediumPriority');
			}
		}
	})
	.directive('highPriority', function(){
		return {
			priority: 30,
			compile: function(element, attributes){
				logLine(attributes.highPriority, 'compile / highPriority');
			}
		}
	})
	.directive('lowPriorityTerminal', function(){
		return {
			priority: 10,
			terminal: true,
			compile: function(element, attributes){
				logLine(attributes.lowPriorityTerminal, 'compile / lowPriorityTerminal');
			}
		}
	})
	.directive('mediumPriorityTerminal', function(){
		return {
			priority: 20,
			terminal: true,
			compile: function(element, attributes){
				logLine(attributes.mediumPriorityTerminal, 'compile / mediumPriorityTerminal');
			}
		}
	})
	.directive('highPriorityTerminal', function(){
		return {
			priority: 30,
			terminal: true,
			compile: function(element, attributes){
				logLine(attributes.highPriorityTerminal, 'compile / highPriorityTerminal');
			}
		}
	})
