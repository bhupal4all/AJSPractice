var sampleApp = angular.module('sampleApp', []);

//create a directive, first parameter is html element to be attached
//we are attaching html tag
//directive will be activated as soon as any student element is encountered in html
sampleApp.directive('student', function(){
	//define the directive object
	var directive = {};
	// restrict='E', signifies that directive is element directive
	directive.restrict='E';
	// template replaces the complete tag with its text
	directive.template = "<label>Student Id: </label>{{student.id}}<br/><label>Student Name: </label>{{student.name}}<br/><label>Student Roll No: </label>{{student.rollno}}";
	// scope is going to distinguish the students based on criteria
	directive.scope = {
		student : "=src"
	};
	
	//compile is called during application initialization.  AJS calls it once html page is loaded
	directive.compile = function(element, attributes){
		element.css("border", "2px solid red");
				
		// linkFunction is linked with each element with scope to get element specified data
		var linkFunction = function ($scope, element, attributes){
			element.css("background-color", "black");
			element.css("color", "white");
			
			element.on('click', function(event){
				alert('You Clicked on \''+$scope.student.name+'\'');	
			});
		};
		
		return linkFunction;
	};
	
	return directive;
});

sampleApp.controller('cntlr', function($scope){
	$scope.message = "First Class";
	
	$scope.st1 = {};
	$scope.st1.name = "Student1";
	$scope.st1.id="101";
	$scope.st1.rollno=101;
	
	$scope.st2 = {};
	$scope.st2.name = "Student2";
	$scope.st2.id="102";
	$scope.st2.rollno=102;

});

sampleApp.controller('cntlr2', function($scope){
	$scope.message = "Second Class";
	
	$scope.st1 = {};
	$scope.st1.name = "Yagna";
	$scope.st1.id="1";
	$scope.st1.rollno=1;
	
	$scope.st2 = {};
	$scope.st2.name = "Shree";
	$scope.st2.id="2";
	$scope.st2.rollno=2;

});