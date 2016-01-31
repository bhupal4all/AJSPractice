///////////////////////////////////////////////////////////////////////////////
// Main Module
///////////////////////////////////////////////////////////////////////////////	
angular.module('mainModule', ['ngRoute'])
	
	.config(['$routeProvider', function($routeProvider){
		console.log('from config');

		$routeProvider
			.when('/default', {
				templateUrl: '/angularjs/views/default.jsp'
			})
			.when('/viewone', {
				templateUrl: '/angularjs/views/viewone.jsp'
			})
			.otherwise({ 
				redirectTo: '/default' 
			});
	}])

	.controller('mainController', ['$scope', function ($scope) {
		console.log('from controller');
	}]);