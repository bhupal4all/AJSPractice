///////////////////////////////////////////////////////////////////////////////
// Main Module
///////////////////////////////////////////////////////////////////////////////	
angular.module('mainModule', [])
	.controller('mainController',['$scope',function($scope){
		$scope.scopeVar = 'Base Scope Value';
	}])

	.directive('transcludeTrue', function(){
		console.log('TranscludeTrue - Initialization');

		return {
			scope: {},
			transclude: true,
			restrict: 'E',
			replace: true,
			template: 
				  "<div>"
				+ 	"<label>[Directive Template Content - Blue]</label><br/>"
				+ 	"<label>Enter </label> <input type='text' ng-model='scopeVar'/><br/>"
				+ 	"<label>Scope ID:</label> {{$id}} <br/>"
				+ 	"<label>Parent Scope ID:</label> {{$parent.$id}} <br/>"
				+ 	"<label>Scope Variable:</label> {{scopeVar}} <br/>"
				+ 	"<label>Original Content: </label>"
				+ 	"<div style='border: 1px solid black;background-color: lightgreen' ng-transclude>"
				+	"This conetent would be replaced by element.html()"
				+ 	"</div>"
				+ "</div>",
			link: function(scope, element, attributes){
				console.log('TranscludeTrue - post link');
				scope.scopeVar = 'Directive Scope Value';
			}
		};
	})

	.directive('transcludeElementPreBoundScope', function(){
		console.log('TranscludeElementPreBoundScope - Initialization');

		return {
			scope: {},
			transclude: 'element',
			replace: true,
			link: function(scope, element, attributes, controller, transcludeFn){
				console.log('TranscludeElementPreBoundScope - post link');
				scope.scopeVar = 'Transclude Element Directive Scope Value';

				var attrValue = attributes.transcludeElementPreBoundScope;
				// Cloning the content
				if (attrValue == 'clone' || attrValue == 'scopeclone'){
					var cloneContent = null;

					// getting clone object
					if (attrValue == 'scopeclone'){
						// with local scope
						transcludeFn(scope, function(divContent){
							cloneElement = divContent;
						});
					} else {
						transcludeFn(function(divContent){
							cloneElement = divContent;
						});
					}

					// Changing attributes
					cloneElement.attr("style", "background-color: lightcoral; border: 1px solid black;")
					cloneElement.find('h4').text('This Conetent belongs to Clone');
					// Addding to Element
					element.after(cloneElement);
				}

				// Adding divcontent
				element.after(transcludeFn());
			}
		};
	})
