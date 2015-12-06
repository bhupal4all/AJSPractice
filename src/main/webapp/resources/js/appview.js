
var sampleApp = angular.module('sampleApp', ['ngRoute']);

sampleApp.config(['$routeProvider',
	function($routeProvider) {
	$routeProvider.when('/AddNewOrder', {
		templateUrl: 'add_order.html',
		controller: 'AddOrderController'
	}).when('/ShowOrders', {
		templateUrl: 'show_orders.html',
		controller: 'ShowOrdersController'
	}).when('/welcome', {
		templateUrl: 'welcome_order.html',
		controller: 'WelcomeOrderController'
	}).otherwise({
		redirectTo: '/welcome'
	});
}]);

sampleApp.controller('WelcomeOrderController', function($scope) {
	$scope.message = 'This is Welcome Message';
});

sampleApp.controller('AddOrderController', function($scope) {
	$scope.message = 'This is Add new order screen';
});

sampleApp.controller('ShowOrdersController', function($scope) {
	$scope.message = 'This is Show orders screen';
});
