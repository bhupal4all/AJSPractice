<!DOCTYPE html>
<html lang="en">
<head>
   <title>Angular Module JS</title>
   <script src="${pageContext.request.contextPath}/resources/js/angular.js"></script>   
   <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>   
   <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">   

   <!-- Custom Script Files -->
   <script src="${pageContext.request.contextPath}/resources/js/practice/controller/customdirectives-restrict.js"></script>  
</head>
<body style="background-color: WhiteSmoke">
<div class="container" ng-app='mainModule' ng-controller="mainController">
	<div class="page-header">
		<h1>Angular JS - Custom Directives Priority</h1>
	</div>

	<div class="row">
		<div class="col-md-6">
			<h3>1. Directive as Element</h3>
			<element-dir>
				This Content wouldnt be visible
			</element-dir>
			<br/>
			<element-dir2>
				This content would be changed to bold, italic, underline.
			</element-dir2>
			<br/>

			<h3>2. Directive as Attribute</h3>
			<dir attribute='my attribute value'></dir>
			<br/>

			<h3>3. Directive as Class Attribute</h3>
			<dir class='class-dir: My Class Value'></dir>
			<br/>

			<h3>4. Directive as Comment Attribute</h3>
			<p>Comment format needs to be like 'directive: comment-dir my comment value'</p>
			<!-- directive: comment-dir my comment value -->
		</div>
	</div>
</div>
</body>
</html>
