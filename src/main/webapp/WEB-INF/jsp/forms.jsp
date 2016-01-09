<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<head>
   <title>Angular Module JS</title>
   <script src="${pageContext.request.contextPath}/resources/js/angular.js"></script>   
   <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>   
   <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">   

   <!-- Custom Script Files -->
   <script src="${pageContext.request.contextPath}/resources/js/practice/controller/formController.js"></script>  

   <style>
	.inputTextLabel
	{
		width: 100px;
		display: inline-block;
		vertical-align: middle;
	}

	.inputTextForm
	{
		width: 150px;
		height: 20px;
		vertical-align: middle;
	}

	.inputTextareaForm
	{
		width: 150px;
		height: 100px;
		vertical-align: middle;
	}
   </style>

</head>
<body style="background-color: WhiteSmoke">
<div class="container" ng-app='mainModule'>
	<div class="page-header">
		<h1>Angular JS - Form Controls</h1>
	</div>
	
	<div class="row" ng-controller="formController"> 
		<div >
			<form name='testForm'>
			<div class="col-md-6">
				<h3>Input Text Control</h3>
				<label class='inputTextLabel'>Text </label> <input class='inputTextForm' name='iText' type='text' ng-model='iText' ng-change="onTextChanged()"/> 
				<label>Value</label> {{ iText }}<br/>
				<label class='inputTextLabel'>Email </label> <input class='inputTextForm' name='iEmail' type='email' ng-model='iEmail' ng-change="onEmailChanged()"/>
				<label>Value</label> {{ iEmail }}<br/>
				<label class='inputTextLabel'>Url </label> <input class='inputTextForm' type='url' ng-model='iUrl'/> 
				<label>Value</label> {{ iUrl }}<br/>
				<label class='inputTextLabel'>Password </label> <input class='inputTextForm' type='password' ng-model='iPassword'/> 
				<label>Value</label> {{ iPassword }}<br/>
				<label class='inputTextLabel'>Number </label> <input class='inputTextForm' type='number' ng-model='iNumber'/> 
				<label>Value</label> {{ iNumber }}<br/>
				<label class='inputTextLabel'>Text Area</label> <textarea class='inputTextareaForm' ng-model='iTextArea'></textarea>
				<label>Value</label> {{ iTextArea }}<br/>
			</div>
			<div class="col-md-6">
				<h3>Tracking Changes</h3>
				<label>Text Changed Count:</label> {{ textChangedCount }}<br/>
				<label>Email Changed Count:</label> {{ emailChangedCount }}<br/>
				<label>Text Status using Java Script</label> {{ getStatus(testForm.iText) }}<br/>
				<label>Email Status using Java Script</label> {{ getStatus(testForm.iEmail) }}<br/>
				<label>Form Status using Java Script</label> {{ getStatus(testForm) }}<br/>
				<label>Form Status using Expression</label> {{ testForm.$dirty?'Dirty':testForm.$pristine?'Pristine':'UnKnown' }}<br/>
			</div>
			</form>
		</div>
	</div>
	<hr/>
	<div class="row"> 
		<div>
			<div class="col-md-6">
				<h3>Check Box</h3>
				<label>Fruits</label> <input type='checkbox' ng-model='checkboxValue'/> <label>Fruits Checked ?</label> {{checkboxValue}}  <br/>
				<label>Fruits (Custom Value)</label> <input type='checkbox' ng-model='customvalue' ng-true-value="'Checked'" ng-false-value="'Un Checked'" /> <label>Fruits Checked (Custom)?</label> {{customvalue}}  <br/>
			</div>
			<div class="col-md-6">
				<h3>Radio Buttons</h3>
				<label>Red</label> <input type='radio' ng-model='radioBtnValue' value='Red'/> <br/>
				<label>Blue</label> <input type='radio' ng-model='radioBtnValue'value='Blue'/> <br/>
				<label>Green</label> <input type='radio' ng-model='radioBtnValue' value='Green'/> <br/>
				<label>Selected ?</label> {{radioBtnValue}}  <br/>
			</div>
		</div>
	</div>
	<hr/>
	<div class="row"> 
		<h3>Select Menu</h3>
		<div >
			<div class="col-md-6">
				<h3>Simple Select</h3>
				<select ng-model='sSelectValue'>
					<option value='blue'>Blue</option>
					<option value='green'>Green</option>
					<option value='red'>Red</option>
				</select>
				<label>Selected value </label>{{sSelectValue}} <br/>
			</div>
			<div class="col-md-6">
				<h3>Simple Multi Select</h3>
				<select ng-model='sMultiValue' multiple="true">
					<option value='blue'>Blue</option>
					<option value='green'>Green</option>
					<option value='red'>Red</option>
				</select>
				<label>Selected value </label>{{sMultiValue}} <br/>
			</div>
		</div>
	</div>
	<hr/>
	<div class="row"> 
		<h3>Select Menu From Array</h3>
		<div ng-controller='menuController'>
			<div class="col-md-6">
				<h3>Simple Select</h3>
				<p>Getting options from an array</p>
				<select ng-model='colorValue' ng-options='color for color in colorsArray'>
					<option value=''>[ none ]</option>
				</select>
				<label>Selected value </label>{{colorValue}} <br/>
			</div>
			<div class="col-md-6">
				<h3>Object Selection</h3>
				<p>Getting options from an object (json) array </p>
				<select ng-model='personValue' ng-options="person.firstName for person in peopleArray">
					<option value=''>[ none ]</option>
				</select><br/>
				<label>Selected value </label><textarea>{{personValue|json}}</textarea> <br/>

			</div>
		</div>
	</div>
	<hr/>
	<div class="row"> 
		<div ng-controller='menuController'>
			<div class="col-md-6">
				<h3>Object Selection, Label Composition</h3>
				<p>Getting options from an object (json) array.  Options label is coming from function </p>
				<select ng-model='personValue' ng-options="getPersonFullNameFn(person) for person in peopleArray">
					<option value=''>[ none ]</option>
				</select><br/>
				<label>Selected value </label><textarea>{{personValue|json}}</textarea> <br/>
			</div>
			<div class="col-md-6">
				<h3>Object Property Selection</h3>
				<p>Getting options from an object (json) array.  Options label is coming from function and the value is property of object </p>
				<select ng-model='personProperyValue' ng-options="person.lastName as getPersonFullNameFn(person) for person in peopleArray">
					<option value=''>[ none ]</option>
				</select><br/>
				<label>Selected value </label>{{personProperyValue}}<br/>
			</div>
		</div>
	</div>
	<hr/>
	<div class="row"> 
		<div ng-controller='menuController'>
			<div class="col-md-6">
				<h3>Group By </h3>
				<p>Getting options from an object (json) array.  Grouping the options by property (sex)</p>
				<select ng-model='personValue' ng-options="person as getPersonFullNameFn(person) group by person.sex for person in peopleArray">
					<option value=''>[ none ]</option>
				</select><br/>
				<label>Selected value </label><textarea>{{personValue|json}}</textarea> <br/>
			</div>
			<div class="col-md-6">
				<h3>Group By, select one property and with disable</h3>
				<p>Getting options from an object (json) array.  Grouping the options by property (sex)</p>
				<select ng-model='personValue' ng-options="person as getPersonFullNameFn(person) group by person.sex disable when !person.active for person in peopleArray">
					<option value=''>[ none ]</option>
				</select><br/>
				<label>Selected value </label><textarea>{{personValue|json}}</textarea> <br/>
			</div>
		</div>
	</div>
</div>
</body>
</html>
