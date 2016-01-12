<!DOCTYPE html>
<html lang="en">
<head>
   <title>Angular Module JS</title>
   <script src="${pageContext.request.contextPath}/resources/js/angular.js"></script>   
   <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>   
   <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">   

   <!-- Custom Script Files -->
   <script src="${pageContext.request.contextPath}/resources/js/practice/controller/custdirectives.js"></script>  

  <style>
    .logTextAreaSmall
    {
      width: 400px;
      height: 80px;
    }

    .logTextAreaMedium
    {
      width: 400px;
      height: 150px;
    }

    .logTextAreaBig
    {
      width: 400px;
      height: 220px;
    }

    .logTextAreaTall
    {
      width: 400px;
      height: 330px;
    }
  </style>
</head>
<body style="background-color: WhiteSmoke">
<div class="container" ng-app='mainModule' ng-controller="compileController">
	<div class="page-header">
		<h1>Angular JS - Custom Directives</h1>
	</div>

	<h3>Compile and Link</h3>	
	<div class="row" > 
		<div class="col-md-6">
			<h3>1. No Definition Object</h3>
			<div rb-no-defn='1' ></div>
			<div rb-no-defn='2' ></div>
			<textarea class='logTextAreaSmall'>{{noDefObjLog}}</textarea>
		</div>
		<div class="col-md-6">
			<h3>2. Post Link</h3>
			<div rb-post-link='1' ></div>
			<div rb-post-link='2' ></div>
			<textarea class='logTextAreaSmall'>{{postLinkLog}}</textarea>
		</div>
	</div>
	<div class="row" > 
		<div class="col-md-6">
			<h3>3. Pre Post Link Functions</h3>
			<div rb-pre-post-link='1' ></div>
			<div rb-pre-post-link='2' ></div>
			<textarea class='logTextAreaMedium'>{{prePostLinkLog}}</textarea>
		</div>
		<div class="col-md-6">
			<h3>4. Compile Function</h3>
			<div rb-compile-function='1' ></div>
			<div rb-compile-function='2' ></div>
			<textarea class='logTextAreaMedium'>{{compileFunctionLog}}</textarea>
		</div>
	</div>
	<div class="row" > 
		<div class="col-md-6">
			<h3>5. Post Link Functions</h3>
			<div rb-compile-post-function='1' ></div>
			<div rb-compile-post-function='2' ></div>
			<textarea class='logTextAreaMedium'>{{compilePostLinkFunctionLog}}</textarea>
		</div>
		<div class="col-md-6">
			<h3>6. Compile Function</h3>
			<div rb-compile-pre-post-function='1' ></div>
			<div rb-compile-pre-post-function='2' ></div>
			<textarea class='logTextAreaMedium'>{{compilePrePostLinkFunctionLog}}</textarea>
		</div>
	</div>
	<div class="row" > 
		<div class="col-md-6">
			<h3>7. Nested Directives</h3>
			<div rb-nested-directive-1='1'>
				<div rb-nested-directive-2='2'>
					<div rb-nested-directive-3='3'></div>
				</div>
			</div>
			<textarea class='logTextAreaBig'>{{rbNestedDirectiveLog}}</textarea>
		</div>
		<div class="col-md-6">
			<h3>8. Miltiple Directives</h3>
			<div rb-multi-directive-1='1' rb-multi-directive-2='2' rb-multi-directive-3='3'>
			</div>
			<textarea class='logTextAreaBig'>{{rbMultiDirectiveLog}}</textarea>
		</div>
	</div>
</div>
</body>
</html>
