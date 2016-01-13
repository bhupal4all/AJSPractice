///////////////////////////////////////////////////////////////////////////////
// Main Module
///////////////////////////////////////////////////////////////////////////////	
angular.module('mainModule', [])

	.controller('mainController',['$scope',function($scope){
		$scope.bFirstname = '';
		$scope.bLastname = '';

		$scope.updateName = function(firstname, lastname){
			console.log('mainController - updateName');
			$scope.bFirstname = firstname;
			$scope.bLastname = lastname;
		};
	}])

	.directive('rbSharedDirective', function(){
		return {
			scope: false,
			replace: true,
			// All the tags should be under one tag, if there are more
			template: "<div><label>First Name:</label> <input type='text' ng-model='bFirstname'><br/>"
				+ "<label>Last Name:</label> <input type='text' ng-model='bLastname'><br/>"
				+ "<br/>"
				+ "<label>First Name:</label> {{bFirstname}}<br/>"
				+ "<label>Last Name:</label> {{bLastname}}<br/></div>"
		};
	})

	.directive('rbInheritedDirective', function(){
		return {
			scope: true,
			replace: true,
			// All the tags should be under one tag, if there are more
			template: "<div><label>First Name:</label> <input type='text' ng-model='bFirstname'><br/>"
				+ "<label>Last Name:</label> <input type='text' ng-model='bLastname'><br/>"
				+ "<br/>"
				+ "<label>First Name:</label> {{bFirstname}}<br/>"
				+ "<label>Last Name:</label> {{bLastname}}<br/></div>"
		};
	})

	.directive('rbIsolatedDirective', function(){
		return {
			scope: {
				bFirstname: '@dirFirstName',
				bLastname: '=dirLastName',
				setNameMethod: '&dirUpdateNameMethod'
			},
			replace: true,
			// All the tags should be under one tag, if there are more
			template: "<div><label>First Name:</label> <input type='text' ng-model='bFirstname'>New One<br/>"
				+ "<label>Last Name:</label> <input type='text' ng-model='bLastname'>Linked with others<br/>"
				+ "<button ng-click='execSetNameMethod()'>Set Name on External Scope</button>(calling given method)"
				+ "<br/>"
				+ "<label>First Name:</label> {{bFirstname}}<br/>"
				+ "<label>Last Name:</label> {{bLastname}}<br/></div>",

			link: function(scope, element, attrs){
				scope.execSetNameMethod = function(){
					console.log('Isolated Directive Post Link - execSetNameMethod');
					scope.setNameMethod({
						newFirstname: scope.bFirstname,
						newLastname: scope.bLastname
					});
				};
			}
		};
	})
  	;