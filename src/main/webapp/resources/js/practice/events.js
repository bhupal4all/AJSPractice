///////////////////////////////////////////////////////////////////////////////
// Button click Module
///////////////////////////////////////////////////////////////////////////////	
angular.module('clickModule', [])
	.value('clickCount', {value: 0})
	.controller('clickController', function($scope, clickCount){
		$scope.clickCount = clickCount.value;
		
		$scope.clickFn = function(){
			$scope.firstClickResult = "Button has been clicked";
			clickCount.value += 1;
			$scope.clickCount = clickCount.value;
		};

		$scope.clickInputFn = function(inputStr){
			$scope.secondClickResult = inputStr;
		};

		$scope.clickImageFn = function(){
			$scope.imageClickResult = 'Clicked on Image';
		};

		$scope.dblClickImageFn = function(){
			$scope.imageClickResult = 'Double Clicked on Image';
		};
	});
	
///////////////////////////////////////////////////////////////////////////////
// Mouse click Module
///////////////////////////////////////////////////////////////////////////////	
angular.module('mouseModule', [])
	.controller('mouseController', function($scope, clickCount){
		$scope.mouseDownFn = function($event){
			$scope.mouseDownDesc = getMouseEventResult($event, 'Mouse Down');
		};
		$scope.mouseUpFn = function($event){
			$scope.mouseUpDesc = getMouseEventResult($event, 'Mouse Up');
		};
		$scope.mouseEnterFn = function($event){
			$scope.mouseEnterDesc = getMouseEventResult($event, 'Mouse Enter');
		};
		$scope.mouseLeaveFn = function($event){
			$scope.mouseLeaveDesc = getMouseEventResult($event, 'Mouse Leave');
		};
		$scope.mouseMoveFn = function($event){
			$scope.mouseMoveDesc = getMouseEventResult($event, 'Mouse Move');
		};
		$scope.mouseOverFn = function($event){
			$scope.mouseOverDesc = getMouseEventResult($event, 'Mouse Over');
		};

		var getMouseEventResult = function($event, desc){
			var coords = getCrossBrowserElementCoords($event);
			return desc + ' at (' + coords.x + ',' + coords.y + ')';
		}
		
		// Utility functions

		// Accepts a MouseEvent as input and returns the x and y
		// coordinates relative to the target element.
		var getCrossBrowserElementCoords = function (mouseEvent) {
			var result = {
				x: 0,
				y: 0
			};

			if (!mouseEvent)
			{
				mouseEvent = window.event;
			}

			if (mouseEvent.pageX || mouseEvent.pageY)
			{
				result.x = mouseEvent.pageX;
				result.y = mouseEvent.pageY;
			}
			else if (mouseEvent.clientX || mouseEvent.clientY)
			{
				result.x = mouseEvent.clientX + document.body.scrollLeft + document.documentElement.scrollLeft;
				result.y = mouseEvent.clientY + document.body.scrollTop + document.documentElement.scrollTop;
			}

			if (mouseEvent.target)
			{
				var offEl = mouseEvent.target;
				var offX = 0;
				var offY = 0;

				if (typeof(offEl.offsetParent) != "undefined")
				{
					while (offEl)
					{
						offX += offEl.offsetLeft;
						offY += offEl.offsetTop;

						offEl = offEl.offsetParent;
					}
				}
				else
				{
					offX = offEl.x;
					offY = offEl.y;
				}

				result.x -= offX;
				result.y -= offY;
			}

			return result;
		};

	});

///////////////////////////////////////////////////////////////////////////////
// Keyboard Module
///////////////////////////////////////////////////////////////////////////////	
angular.module('keyboardModule', [])
	.controller('keyboardController', function($scope){
		$scope.keyUpFn = function($event){
			$scope.keyUpResult = getKeyboardResult($event, 'Key Up');
		};
		$scope.keyDownFn = function($event){
			$scope.keyDownResult = getKeyboardResult($event, 'Key Down');
		};
		$scope.keyPressFn = function($event){
			$scope.keyPressResult = getKeyboardResult($event, 'Key Press');
		};
		
		var getKeyboardResult = function(keyEvent, desc){
			var key = (window.event ? keyEvent.keyCode : keyEvent.which);
			return desc + ' (key code: ' + key + ', value: ' +  String.fromCharCode(key) + ')';
		};
	});

///////////////////////////////////////////////////////////////////////////////
// Change Event Module
///////////////////////////////////////////////////////////////////////////////	
angular.module('changeModule', [])
	.controller('changeController', function($scope){
		$scope.changeEventFn = function(){
			$scope.inputTxtResult = $scope.inputTxt;
		};
	})	
	.controller('checkedController', function($scope){
		$scope.checkedEventFn = function(){
			console.log('working'); 
			$scope.checkedResult = 'Check Box 1 ? '+ ($scope.check1Selected ? 'CHECKED' : 'UNCHECKED') 
				+', Check Box 2 ? ' + ($scope.check2Selected ? 'CHECKED' : 'UNCHECKED');
		};
	});
	
///////////////////////////////////////////////////////////////////////////////
// Main Module
///////////////////////////////////////////////////////////////////////////////	
angular.module('mainModule', ['clickModule','mouseModule','keyboardModule','changeModule']);