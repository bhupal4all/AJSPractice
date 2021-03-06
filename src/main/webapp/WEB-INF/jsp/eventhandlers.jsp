<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<head>
   <title>Angular JS - Event Handlers</title>
   <script src="${pageContext.request.contextPath}/resources/js/angular.js"></script>   
   <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>   
   <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">   

   <script src="${pageContext.request.contextPath}/resources/js/practice/events.js"></script>  
   
   <style>
	img { 
		border:1px solid #021a40;
	}
   </style>
</head>
<body style="background-color: WhiteSmoke">
<div class="container" ng-app='mainModule'>
	<div class="page-header">
		<h1>Angular JS - Event handlers</h1>
	</div>
	
	<div class="row"> 
		<h3>Mouse Click Events</h3>
		<div class="col-md-4">
			<div ng-controller="clickController">
				<input type="button" ng-click="clickFn()" value="Click Me !!!" /><br/>
				<b>RESULT: </b>{{ firstClickResult }} {{ clickCount }} times clicked.
			</div>
		</div>
		<div class="col-md-4">
			<div ng-controller="clickController">
				Enter Name : <input type="text" ng-model="clickInput" /><input type="button" ng-click="clickInputFn(clickInput)" value="Click Me !!!" /> <br/>
				<b>RESULT: </b>Hey {{ secondClickResult }} ...
			</div>
		</div>
		<div class="col-md-4">
			<div ng-controller="clickController">
				<img src="${pageContext.request.contextPath}/resources/images/square.png" ng-click="clickImageFn()" ng-dblclick="dblClickImageFn()" /><br/>
				<b>Result : </b> {{ imageClickResult }}
			</div>
		</div>
	</div>
	<hr/>
	<div class="row"> 
		<h3>Mouse Events on Image</h3>
		<div ng-controller="mouseController">
			<div class="col-md-6">
				<img src="${pageContext.request.contextPath}/resources/images/square.png" 
					ng-mousedown="mouseDownFn()" 
					ng-mouseup="mouseUpFn()"
					ng-mouseenter="mouseEnterFn()"
					ng-mouseleave="mouseLeaveFn()"
					ng-mousemove="mouseMoveFn()"
					ng-mouseover="mouseOverFn()"
					/><br/>
			</div>
			<div class="col-md-6">
				<b>Mouse Down : </b> {{ mouseDownDesc }} <br/>
				<b>Mouse Up : </b> {{ mouseUpDesc }} <br/>
				<b>Mouse Enter : </b> {{ mouseEnterDesc }} <br/>
				<b>Mouse Leave : </b> {{ mouseLeaveDesc }} <br/>
				<b>Mouse Move : </b> {{ mouseMoveDesc }} <br/>
				<b>Mouse Over : </b> {{ mouseOverDesc }} <br/>
			</div>
		</div>
	</div>
	<hr/>
	<div class="row"> 
		<h3>Keyboard Events</h3>
		<div ng-controller="keyboardController">
			<div class="col-md-6">
				<input type='text' ng-keyup="keyUpFn($event)" ng-keydown="keyDownFn($event)" ng-keypress="keyPressFn($event)" /><br/>
				<label>Key Up: </label>{{ keyUpResult }}<br/>
				<label>Key Down: </label>{{ keyDownResult }}<br/>
				<label>Key Press: </label>{{ keyPressResult }}<br/>
			</div>
			<div class="col-md-6">
			</div>
		</div>
	</div>
	<hr/>
	<div class="row"> 
		<h3>Change Events</h3>
		<div class="col-md-6" ng-controller="changeController">
			With Change Event : <input type='text' ng-change="changeEventFn()" ng-model="inputTxt" /><br/>
			Without Change Event : <input type='text' ng-model="inputTxt" /><br/>
			<label>Result: </label>{{ inputTxtResult }}<br/>
		</div>
		<div class="col-md-6" ng-controller="checkedController">
			Check Box 1 <input type='checkbox' ng-model="check1Selected" ng-change="checkedEventFn()" /><br/>
			Check Box 2 <input type='checkbox' ng-model="check2Selected" ng-change="checkedEventFn()" /><br/>
			<label>Result: </label>{{ checkedResult }}<br/>
		</div>
	</div>
</div>
</body>
</html>
