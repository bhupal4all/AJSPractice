var sampleApp = angular.module('sampleApp', ['ngRoute']);

sampleApp.value("defaultVal",1);
sampleApp.constant("constVal","This is Constant");

// create a factory "MathOperations" which provides methods for operations
sampleApp.factory('MathOperations', function(){
	var factory = {};
	
	factory.multiply = function(a, b){
		return a * b;
	};
	
	factory.addition = function(a, b){
		return a + b;
	};
	
	return factory;
});

// inject the factory "MathOperations" into service to utilize exiting methods
// create a service which defines a methods for add/mul 
sampleApp.service('CalcService', function(MathOperations){
	this.add = function(a, b){
		return MathOperations.addition(a, b);
	};
	
	this.mul = function(a, b){
		return MathOperations.multiply(a, b);
	};
});

// Routing
sampleApp.config(['$routeProvider',
	function($routeProvider) {
	$routeProvider.when('/Addition', {
		templateUrl: 'Common.html',
		controller: 'AdditionController'
	}).when('/Multiplication', {
		templateUrl: 'Common.html',
		controller: 'MultiplicationController'
	}).when('/welcome', {
		templateUrl: 'Welcome.html',
		controller: 'WelcomeController'
	}).otherwise({
		redirectTo: '/welcome'
	});
}]);

sampleApp.controller('WelcomeController', function($scope, defaultVal, constVal) {
	$scope.message = 'Welcome to Services';
	$scope.defaultVal = defaultVal;
	$scope.constantVal = constVal;
});

sampleApp.controller('AdditionController', function($scope, CalcService, defaultVal) {
	$scope.title = 'Addition of Two Numbers ';
	$scope.operand1 = defaultVal;
	$scope.operand2 = defaultVal;
	$scope.execute = CalcService.add;
});

sampleApp.controller('MultiplicationController', function($scope, CalcService, defaultVal) {
	$scope.title = 'Multiplication of Two Numbers';
	$scope.operand1 = defaultVal;
	$scope.operand2 = defaultVal;
	$scope.execute = CalcService.mul;
});
