///////////////////////////////////////////////////////////////////////////////
// Main Module
///////////////////////////////////////////////////////////////////////////////	
angular.module('mainModule', [])

	.controller('compileController', ['$scope', function($scope){
		$scope.message = '[SCOPE] This is Custom Directive using Templates';
		$scope.replaceCustomDirHtml = '';
	}])

	.directive('rbCustDir', function(){
		return {
			template: 'Custom Directive Message (Direct Template): <strong>{{message}}</strong>'
		}
	})

	.directive('rbCustDir2', function(){
		return {
			templateUrl: 'customdirective-template1.jsp'
		}
	})

	.directive('rbNoReplaceCustDir', function(){
		return {
			replace: false,
			template: 'customdirective-template1.jsp'
		}
	})

	.directive('rbNoReplaceCustDirAttr', function(){
		return {
			replace: false,

			template: 'Before Div Tag. <div div-attribute common-attribute="div value" style="font-size:18px;" class="divFrame">'
			+ 'Without Replace With Attributes: <strong>{{message}}</strong>'
			+ '</div>After Div Tag.<br/>'
		}
	})

	.directive('rbReplaceCustDir', function(){
		return {
			replace: true,

			template: '<div div-attribute common-attribute="div value" style="font-size:18px;" class="divFrame">'
			+ 'Replaced: <strong>{{message}}</strong>'
			+ '</div>',

			link: function(scope,element, attrs){
				scope.replaceCustomDirHtml = element[0].outerHTML;
			}
		}
	});
