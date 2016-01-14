///////////////////////////////////////////////////////////////////////////////
// Main Module
///////////////////////////////////////////////////////////////////////////////	
angular.module('mainModule', [])

	.controller('mainController',['$scope',function($scope){
		$scope.whatWeHave = 'Nothing';
	}])

	.directive("basket", function(){
		return {
			link: function(scope, elements, attrs){
				console.log('basket - post link');
			},
			controller: function(){
				console.log('basket - controller');
				this.getSize = function() {
					return ' medium basket';
				}
			}
		};
	})

	.directive("giftPack", function(){
		return {
			link: function(scope, elements, attrs){
				console.log('giftPack - post link');
			},
			controller: function(){
				console.log('giftPack - controller');
				this.getSize = function() {
					return ' gift pack';
				}
			}
		};
	})

	.directive("apple", function(){
		return {
			link: function(scope, elements, attrs){
				console.log('apple - post link');
			},
			controller: function(){
				console.log('apple - controller');
				this.getFruits = function(){
					return ' One Apple';
				};
			}
		};
	})

	.directive("peanuts", function(){
		return {
			link: function(scope, elements, attrs){
				console.log('peanuts - post link');
			},
			controller: function(){
				console.log('peanuts - controller');
				this.getFruits = function(){
					return ' One Peanut';
				};
			}
		};
	})

	.directive('fruitChecker', function(){
		return {
			require: ['apple','?peanuts','^basket','^?giftPack','fruitChecker'],
			controller: function($scope){
				console.log('fruitChecker - controller');
				this.setWhatWeHave = function(value){
					console.log('fruitChecker - setting value');
					$scope.whatWeHave = value;
					// This would help us to render the tags
					$scope.$root.$digest();
				};
			},
			// post link
			link: function(scope, element, attributes, controllers){
				console.log('fruitChecker - post link');
				element.on('click', function(){
					console.log('Button clicked');
					var appleController = controllers[0];
					var peanutsController = controllers[1];
					var basketController = controllers[2];
					var giftPackController = controllers[3];
					var fruitchckerController = controllers[4];

					var result = '';
					result += ' ' + appleController.getFruits();

					if (peanutsController){
						result += ', ' + peanutsController.getFruits();
					}

					if (giftPackController){
						result += ' in ' + giftPackController.getSize();
					}

					result += ' in '+basketController.getSize();

					fruitchckerController.setWhatWeHave(result);	
				});
			}
		};
	})

	
