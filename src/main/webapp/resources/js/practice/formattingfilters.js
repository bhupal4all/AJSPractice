///////////////////////////////////////////////////////////////////////////////
// Main Module
///////////////////////////////////////////////////////////////////////////////	
angular.module('mainModule', [])
	.controller('sFilterController', function ($scope, $filter, dateFilter){
		$scope.sfilterdata = 'Exmaple String';
		$scope.datedata = new Date();
		
		// Date Utility Functions
		$scope.formatDate1 = function(date, format){
			return $filter("date")(date, format);
		};

		$scope.formatDate1 = function(date, format){
			return dateFilter(date, format);
		};
	}).filter('customCurrency',function(numberFilter){
		// we specify the numberFilter argument because we want to retrieve the built-in number filter that is going to be useful in our formatting function
		function isNumeric(value){
			return (!isNaN(parseFloat(value)) && isFinite(value));
		}
		
		function isValidParameter(inputVal, defaultVal){
			return (typeof(inputVal) == 'undefined') ? defaultVal : inputVal; 
		}
		
		return function(inputNumber, currencySymbol, decimalSeperator, thousandSeparator, decimalParts){
			if (isNumeric(inputNumber)){
				currencySymbol = isValidParameter(currencySymbol, 'INR.');
				decimalSeperator = isValidParameter(decimalSeperator, '.');
				thousandSeparator = isValidParameter(thousandSeparator, ',');
				decimalParts = isValidParameter(decimalParts, 2);
				
				var result = numberFilter(inputNumber, decimalParts);
				var decParts = result.split('.');
				decParts[0] = decParts[0].split(',').join(thousandSeparator);
								
				return currencySymbol + decParts[0] + decimalSeperator + decParts[1];
			}else{
				return 'Not Valid Input';
			}
		}
	}).controller('tableController', function($scope){
		$scope.fValue = 'o';
		$scope.aValues = [
			{ name: "One", value: "1", category: "Gen"},
			{ name: "Two", value: "2", category: "Pri"},
			{ name: "Three", value: "3", category: "Gen"},
			{ name: "Four", value: "4", category: "Pri"},
			{ name: "Five", value: "5", category: "Gen"}
		];

		$scope.cValue = 'G';
		// return true or false to keep the item in filtered array
		$scope.customArrayFilter = function(obj){
			return (obj.category.indexOf($scope.cValue) != -1);
		};
	});