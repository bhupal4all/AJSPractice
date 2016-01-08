///////////////////////////////////////////////////////////////////////////////
// Main Module
///////////////////////////////////////////////////////////////////////////////	
angular.module('mainModule', [])
	.controller('menuController', ['$scope', function ($scope){
		$scope.colorsArray = ["Red", "Green", "Blue"];

    	$scope.peopleArray = [
      		{id: "1", firstName: "John", lastName: "Doe", sex: "M", active: false},
      		{id: "2", firstName: "Alice", lastName: "White", sex: "F", active: true},
      		{id: "3", firstName: "Michael", lastName: "Green", sex: "M", active: true}
    	];

    	$scope.getPersonFullNameFn = function(person){
    		return person.firstName + ' ' + person.lastName;
    	};
	}]);
  