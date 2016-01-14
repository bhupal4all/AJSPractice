///////////////////////////////////////////////////////////////////////////////
// Main Module
///////////////////////////////////////////////////////////////////////////////	
angular.module('mainModule', [])
	.controller('mainController',['$scope',function($scope){

	}])

	.directive('elementDir', function(){
		return {
			scope: true,
			restrict: "E",
			template: "<strong>As an Element</strong>"
		};
	})

	.directive('elementDir2', function(){
		return {
			scope: true,
			restrict: "E",
			link: function(scope, element, attributes){
				var innerHTML = element.html();
				innerHTML = '<strong><i><u>'+innerHTML+'</i></u></strong>';

				element.html(innerHTML);
			}
		};
	})

	.directive('attribute', function(){
		return {
			scope: true,
			restrict: "A",
			template: "<strong>As an Attribute - </strong>{{value}}",
			link: function(scope, element, attributes){
				scope.value = attributes.attribute;
			}
		};
	})

	.directive('classDir', function(){
		return {
			scope: true,
			restrict: "C",
			template: "<strong>As an Class Attribute - </strong>{{value}}",
			link: function(scope, element, attributes){
				scope.value = attributes.classDir;
			}
		};
	})

	.directive('commentDir', function($compile){
		return {
			scope: true,
			restrict: "M",
			link: function(scope, element, attributes){
				// Adding a new node to show the comment value
		        element.after($compile("<span><strong>As an Comment Attribute:</strong> {{value}}</span>")(scope));

				scope.value = attributes.commentDir;
			}
		};
	})
