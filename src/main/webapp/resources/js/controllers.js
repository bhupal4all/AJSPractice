demoApp.controller("divCtrlr", function($scope){
	$scope.init = {};
	$scope.init.title = "Welcome to Angular JS";
	$scope.init.message = "This is first application";
});

demoApp.controller("exprCtrlr", function($scope){
	$scope.student={
		id:101, 
		firstName:'Yagna Shree', 
		lastName:'Gangavarapu', 
		marks:[80,90,80,90,80,90],
		marksSubjs: [{name:'Hindi',marks:80},{name:'Telugu',marks:90},{name:'English',marks:80},{name:'Maths',marks:90},{name:'Social',marks:80},{name:'Science',marks:90}],
		fullname: function(){
			return 'Miss. ' + $scope.student.firstName + '' + $scope.student.lastName;
		}
	};
	$scope.bookCost=25;
	$scope.nbrOfBooks=9;
});

demoApp.controller("domCtrlr", function($scope){
	$scope.clicked=0;
});

demoApp.controller("formCtrlr", function($scope){
	$scope.master = {};
	
	$scope.update=function(user){
		alert('update');
		$scope.master = angular.copy(user);
	};
	
	$scope.reset=function(){
		alert('reset');
		$scope.user = angular.copy($scope.master);
	};
	
	$scope.reset();
});

demoApp.controller("includeCtrlr", function($scope){
	$scope.student={
		firstName:'Yagna Shree', 
		lastName:'Gangavarapu', 
		fee: 500
	};
});


demoApp.controller("httpCtrlr", function($scope, $http){
	url = "resources/data/data.txt";
	
	$http.get(url).success(function(response){
		$scope.students = response;
	});
});