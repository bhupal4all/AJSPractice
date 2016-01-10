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
	}])

  .controller('formController', ['$scope', function($scope){
      $scope.textChangedCount = 0;
      $scope.emailChangedCount = 0;

      $scope.onTextChanged = function(){
        $scope.textChangedCount+=1;
      };

      $scope.onEmailChanged = function(){
        $scope.emailChangedCount += 1;
      };

      $scope.getStatus = function(item){
        if (item.$dirty)
          return "dirty";
        if (item.$pristine)
          return "pristine";
      };
  }])

  .controller('formValController', ['$scope', function($scope){
      $scope.getCustomClass = function(item){
        return{
          invalidItem: item.$invalid && item.$dirty
        };
      };
            
      $scope.getCustomValidationError = function(item){
        var msg = 'Field Required';

        if (item.$dirty && item.$invalid){
          msg = 'Field Required';
        }else{
          msg = '';
        }

        return msg;
      };
  }]);
  