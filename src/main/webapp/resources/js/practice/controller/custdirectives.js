///////////////////////////////////////////////////////////////////////////////
var logScope = null; // to store scope variable
var noDefObjLog = '';
var postLinkLog = '';
var prePostLinkLog = '';
var compileFunctionLog = '';
var compilePostLinkFunctionLog = '';
var rbNestedDirectiveLog = '';
var rbMultiDirectiveLog = '';

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
		$scope.rbMultiDirectiveLog = rbMultiDirectiveLog;

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

	.directive('rbNestedDirective2', function(){
		// Initialization
		logFunction('rbNestedDirectiveLog', 'rbNestedDirective2', 'Initialization');

		// Definition Object
		return {
			// Compile functions
			compile: function(element, attrs){
				logFunction('rbNestedDirectiveLog', 'rbNestedDirective2', 'compile - '+attrs.rbNestedDirective2);

				return {
					// Post Compile Function
					pre: function(scope, element, attrs){
						logFunction('rbNestedDirectiveLog', 'rbNestedDirective2', 'compile pre - '+attrs.rbNestedDirective2);
					},
					// Post Compile Function
					post: function(scope, element, attrs){
						logFunction('rbNestedDirectiveLog', 'rbNestedDirective2', 'compile post - '+attrs.rbNestedDirective2);
					}
				};
			}
		};		
	})

	.directive('rbNestedDirective3', function(){
		// Initialization
		logFunction('rbNestedDirectiveLog', 'rbNestedDirective3', 'Initialization');

		// Definition Object
		return {
			// Compile functions
			compile: function(element, attrs){
				logFunction('rbNestedDirectiveLog', 'rbNestedDirective3', 'compile - '+attrs.rbNestedDirective3);

				return {
					// Post Compile Function
					pre: function(scope, element, attrs){
						logFunction('rbNestedDirectiveLog', 'rbNestedDirective3', 'compile pre - '+attrs.rbNestedDirective3);
					},
					// Post Compile Function
					post: function(scope, element, attrs){
						logFunction('rbNestedDirectiveLog', 'rbNestedDirective3', 'compile post - '+attrs.rbNestedDirective3);
					}
				};
			}
		};		
	})

	.directive('rbMultiDirective1', function(){
		// Initialization
		logFunction('rbMultiDirectiveLog', 'rbMultiDirective1', 'Initialization');

		// Definition Object
		return {
			// Compile functions
			compile: function(element, attrs){
				logFunction('rbMultiDirectiveLog', 'rbMultiDirective1', 'compile - '+attrs.rbMultiDirective1);

				return {
					// Post Compile Function
					pre: function(scope, element, attrs){
						logFunction('rbMultiDirectiveLog', 'rbMultiDirective1', 'compile pre - '+attrs.rbMultiDirective1);
					},
					// Post Compile Function
					post: function(scope, element, attrs){
						logFunction('rbMultiDirectiveLog', 'rbMultiDirective1', 'compile post - '+attrs.rbMultiDirective1);
					}
				};
			}
		};		
	})

	.directive('rbMultiDirective2', function(){
		// Initialization
		logFunction('rbMultiDirectiveLog', 'rbMultiDirective2', 'Initialization');

		// Definition Object
		return {
			// Compile functions
			compile: function(element, attrs){
				logFunction('rbMultiDirectiveLog', 'rbMultiDirective2', 'compile - '+attrs.rbMultiDirective2);

				return {
					// Post Compile Function
					pre: function(scope, element, attrs){
						logFunction('rbMultiDirectiveLog', 'rbMultiDirective2', 'compile pre - '+attrs.rbMultiDirective2);
					},
					// Post Compile Function
					post: function(scope, element, attrs){
						logFunction('rbMultiDirectiveLog', 'rbMultiDirective2', 'compile post - '+attrs.rbMultiDirective2);
					}
				};
			}
		};		
	})

	.directive('rbMultiDirective3', function(){
		// Initialization
		logFunction('rbMultiDirectiveLog', 'rbMultiDirective3', 'Initialization');

		// Definition Object
		return {
			// Compile functions
			compile: function(element, attrs){
				logFunction('rbMultiDirectiveLog', 'rbMultiDirective3', 'compile - '+attrs.rbMultiDirective3);

				return {
					// Post Compile Function
					pre: function(scope, element, attrs){
						logFunction('rbMultiDirectiveLog', 'rbMultiDirective3', 'compile pre - '+attrs.rbMultiDirective3);
					},
					// Post Compile Function
					post: function(scope, element, attrs){
						logFunction('rbMultiDirectiveLog', 'rbMultiDirective3', 'compile post - '+attrs.rbMultiDirective3);
					}
				};
			}
		};		
	});
