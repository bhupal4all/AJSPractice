///////////////////////////////////////////////////////////////////////////////
var logScope = null; // to store scope variable
var noDefObjLog = '';
var postLinkLog = '';
var prePostLinkLog = '';
var compileFunctionLog = '';
var compilePostLinkFunctionLog = '';
var rbNestedDirectiveLog = '';

var logFunction = function(logVar, directive, message){
	if (logScope){
		logScope[logVar] += '[ '+directive+' ] ' + message + '\n';
	}else {
		this[logVar] += '[ '+directive+' ] ' + message + '\n';
	}
};

///////////////////////////////////////////////////////////////////////////////
// Main Module
///////////////////////////////////////////////////////////////////////////////	
angular.module('mainModule', [])

	.controller('compileController', ['$scope', function($scope){
		$scope.noDefObjLog = noDefObjLog;
		$scope.postLinkLog = postLinkLog;
		$scope.prePostLinkLog = prePostLinkLog;
		$scope.compileFunctionLog = compileFunctionLog;
		$scope.compilePostLinkFunctionLog = compilePostLinkFunctionLog;
		$scope.compilePrePostLinkFunctionLog = compilePrePostLinkFunctionLog;
		$scope.rbNestedDirectiveLog = rbNestedDirectiveLog;

		logScope = $scope;

	}])

	.directive('rbNoDefn', function(){
		// Initialization
		logFunction('noDefObjLog', 'rbNoDefn', 'Initialization');

		// Post Link Function
		return function(scope, element, attrs){
			logFunction('noDefObjLog', 'rbNoDefn', 'Post Link - '+attrs.rbNoDefn);
		};
	})

	.directive('rbPostLink', function(){
		// Initialization
		logFunction('postLinkLog', 'rbPostLink', 'Initialization');

		// Post Link Function
		return {
			link: function(scope, element, attrs){
				logFunction('postLinkLog', 'rbPostLink', 'Post Link - '+attrs.rbPostLink);
			}
		};
	})

	.directive('rbPrePostLink', function(){
		// Initialization
		logFunction('prePostLinkLog', 'rbPrePostLink', 'Initialization');

		return {
			link: {
				// Pre Link Function
				pre: function(scope, element, attrs){
					logFunction('prePostLinkLog', 'rbPrePostLink', 'Pre Link - '+attrs.rbPrePostLink);
				},
				// Post Link Function
				post: function(scope, element, attrs){
					logFunction('prePostLinkLog', 'rbPrePostLink', 'Post Link - '+attrs.rbPrePostLink);
				}				
			}
		};
	})

	.directive('rbCompileFunction', function(){
		// Initialization
		logFunction('compileFunctionLog', 'rbCompileFunction', 'Initialization');

		// Definition Object
		return {
			// Compile functions
			compile: function(element, attrs){
				logFunction('compileFunctionLog', 'rbCompileFunction', 'compile - '+attrs.rbCompileFunction);
			}
		};		
	})
	
	.directive('rbCompilePostFunction', function(){
		// Initialization
		logFunction('compilePostLinkFunctionLog', 'rbCompilePostFunction', 'Initialization');

		// Definition Object
		return {
			// Compile functions
			compile: function(element, attrs){
				logFunction('compilePostLinkFunctionLog', 'rbCompilePostFunction', 'compile - '+attrs.rbCompilePostFunction);

				// Post Compile Function
				return function(scope, element, attrs){
					logFunction('compilePostLinkFunctionLog', 'rbCompilePostFunction', 'compile post - '+attrs.rbCompilePostFunction);
				};
			}
		};		
	})

	.directive('rbCompilePrePostFunction', function(){
		// Initialization
		logFunction('compilePrePostLinkFunctionLog', 'rbCompilePrePostFunction', 'Initialization');

		// Definition Object
		return {
			// Compile functions
			compile: function(element, attrs){
				logFunction('compilePrePostLinkFunctionLog', 'rbCompilePrePostFunction', 'compile - '+attrs.rbCompilePrePostFunction);

				return {
					// Post Compile Function
					pre: function(scope, element, attrs){
						logFunction('compilePrePostLinkFunctionLog', 'rbCompilePrePostFunction', 'compile pre - '+attrs.rbCompilePrePostFunction);
					},
					// Post Compile Function
					post: function(scope, element, attrs){
						logFunction('compilePrePostLinkFunctionLog', 'rbCompilePrePostFunction', 'compile post - '+attrs.rbCompilePrePostFunction);
					}
				};
			}
		};		
	})

	.directive('rbNestedDirective1', function(){
		// Initialization
		logFunction('rbNestedDirectiveLog', 'rbNestedDirective1', 'Initialization');

		// Definition Object
		return {
			// Compile functions
			compile: function(element, attrs){
				logFunction('rbNestedDirectiveLog', 'rbNestedDirective1', 'compile - '+attrs.rbNestedDirective1);

				return {
					// Post Compile Function
					pre: function(scope, element, attrs){
						logFunction('rbNestedDirectiveLog', 'rbNestedDirective1', 'compile pre - '+attrs.rbNestedDirective1);
					},
					// Post Compile Function
					post: function(scope, element, attrs){
						logFunction('rbNestedDirectiveLog', 'rbNestedDirective1', 'compile post - '+attrs.rbNestedDirective1);
					}
				};
			}
		};		
	})
	
	.directive('rbNestedDirective1', function(){
		// Initialization
		logFunction('rbNestedDirectiveLog', 'rbNestedDirective1', 'Initialization');

		// Definition Object
		return {
			// Compile functions
			compile: function(element, attrs){
				logFunction('rbNestedDirectiveLog', 'rbNestedDirective1', 'compile - '+attrs.rbNestedDirective1);

				return {
					// Post Compile Function
					pre: function(scope, element, attrs){
						logFunction('rbNestedDirectiveLog', 'rbNestedDirective1', 'compile pre - '+attrs.rbNestedDirective1);
					},
					// Post Compile Function
					post: function(scope, element, attrs){
						logFunction('rbNestedDirectiveLog', 'rbNestedDirective1', 'compile post - '+attrs.rbNestedDirective1);
					}
				};
			}
		};		
	});


