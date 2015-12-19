///////////////////////////////////////////////////////////////////////////////
// Main Module
///////////////////////////////////////////////////////////////////////////////	
angular.module('mainModule', [])
	.controller('repeatController', function ($scope){
		$scope.personList = [{
			firstname: 'Yagna',
			lastname: 'Shree',
			isSelected: true
		},{
			firstname: 'Ranga',
			lastname: 'Bhupal',
			isSelected: false
		},{
			firstname: 'Rama',
			lastname: 'Devi',
			isSelected: false
		},
		{
			firstname: 'Rajesh',
			lastname: 'Reddy',
			isSelected: false
		}];
		
		$scope.selectAllToggle = function(array, selVal){
			for(var i=0;i<array.length;i++){
				array[i].isSelected = selVal;
			}
		};
		
		$scope.addPersonFn = function(person){
			$scope.personList.contact(person);
		};
		
		$scope.removePersonFn = function(index){
			console.log(index);
			var a = $scope.personList.splice(index,1);
		};
		
		$scope.positionDesc = function(first,middle,last,even,odd){
			var ret = '';
			
			if (first)
				ret = ret + '(First # ';
			else if (middle)
				ret = ret + '(Middle # ';
			else if (last)
				ret = ret + '(Last # ';
			
			if (even)
				ret = ret + 'Even)';
			else if (odd)
				ret = ret + 'Odd)';
			
			return ret;
		};
	});