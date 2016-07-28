///////////////////////////////////////////////////////////////////////////////
// Hash Bang Module
///////////////////////////////////////////////////////////////////////////////	
angular.module('hashBangModule', ['mainModule'])
	.config(function($locationProvider){
		$locationProvider.html5Mode(false).hashPrefix('!');
	});

///////////////////////////////////////////////////////////////////////////////
// Html5 Module
///////////////////////////////////////////////////////////////////////////////	
angular.module('html5Module', ['mainModule'])
	.config(function($locationProvider){
		$locationProvider.html5Mode(true).hashPrefix('!');
	});

///////////////////////////////////////////////////////////////////////////////
// Main Module
///////////////////////////////////////////////////////////////////////////////	
angular.module('mainModule', [])
	.controller('mainController',['$scope','$location',function($scope, $location){
		$scope.message='This is a sample Message from \'mainController\'';

		$scope.location = $location;
		var urlCounter = 0;
		var pathCounter = 0;
		var hashCounter = 0;
		var locationChangeStartCounter = 0;
		var locationChangeSuccessCounter = 0;

		$scope.setURL = function(urlvalue){
			$location.url(urlvalue+(++urlCounter));
		};

		$scope.setPath = function(pathvalue){
			$location.path(pathvalue+(++pathCounter));
		};

		$scope.setHash = function(hashvalue){
			$location.hash(hashvalue+(++hashCounter));
		};

		$scope.$on('$locationChangeStart', function(event){
			locationChangeStartCounter++;
			$scope.locationChangeStartCounter = locationChangeStartCounter;
		});

		$scope.$on('$locationChangeSuccess', function(event){
			locationChangeSuccessCounter++;
			$scope.locationChangeSuccessCounter = locationChangeSuccessCounter;
		});
	}])
