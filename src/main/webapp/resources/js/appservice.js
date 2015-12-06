var sampleApp = angular.module('sampleApp', ['ngRoute']);

// Factory for Service
sampleApp.factory('MathService', function(){
	var factory = {};
	
	factory.multiply = function(a, b){
		return a * b;
	};
	
	factory.addition = function(a, b){
		return a + b;
	};
	
	return factory;
});

sampleApp.service('CalcService', function(MathService){
	this.add = function(a, b){
		return MathService.addition(a, b);
	};
	
	this.mul = function(a, b){
		return MathService.multiply(a, b);
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

sampleApp.controller('WelcomeController', function($scope) {
	$scope.message = 'Welcome to Services';
});

sampleApp.controller('AdditionController', function($scope, CalcService) {
	$scope.title = 'Addition of Two Numbers ';
	$scope.execute = CalcService.add;
});

sampleApp.controller('MultiplicationController', function($scope, CalcService) {
	$scope.title = 'Multiplication of Two Numbers';
	$scope.execute = CalcService.mul;
});
