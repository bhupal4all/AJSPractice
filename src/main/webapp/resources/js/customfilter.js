var sampleApp = angular.module('sampleApp', []);

sampleApp.filter('reverse', function(){
	return function(input, uppercase) {
		input = input || '';
		var out = '';
		for(var idx=0;idx<input.length;idx++) {
			out = input.charAt(idx) + out;
		}
		if (uppercase){
			out = out.toUpperCase();
		}
		
		return out;
	};
});

sampleApp.controller('filterController', function($scope){
	$scope.inputStr = "reverse";
});