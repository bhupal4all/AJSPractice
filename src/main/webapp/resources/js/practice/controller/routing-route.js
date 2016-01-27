///////////////////////////////////////////////////////////////////////////////
// Main Module
///////////////////////////////////////////////////////////////////////////////	
angular.module('mainModule', ['ngRoute'])
	
	.provider('routeManager', function($routeProvider){
		var scope = null;
		return{
			$get: function(){
				return{
					setScope: function(outScope){
						scope = outScope;
					}
				};
			},
			configRoutes: function(){
				$routeProvider
					.when('/viewone', {
						templateUrl: '/angularjs/views/viewone' 
					});
			}
		};
	})

	.config(['$routeProvider', function($routeProvider){
		$routeProvider
			.when('/default', {
				templateUrl: '/angularjs/views/default.jsp'
			})
			.otherwise({ 
				redirectTo: '/default' 
			});
	}])

	.controller('mainController', ['$scope', function ($scope) {
		console.log('Routing');
	}]);