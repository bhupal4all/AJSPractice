/*
* Simple Controller
*/
myApp.controller('simpleController', ['$scope',function($scope){
	$scope.firstName='Yagna';
	$scope.lastName='Shree';
	
	$scope.fullName = function(){
		return 'Miss. '+$scope.firstName+' '+$scope.lastName;
	};
}]);

myApp.controller('simpleSecondController', ['$scope',function($scope){
	$scope.name='Yagna Shree';
	$scope.fathername='Ranga Bhupal';
}]);

/*
* simpleNestedController is part of simpleSecondController
*/
myApp.controller('simpleNestedController', ['$scope',function($scope){
	$scope.city='Bangalore';
}]);