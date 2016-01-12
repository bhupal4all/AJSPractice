<!DOCTYPE html>
<html lang="en">
<head>
   <title>Angular Module JS</title>
   <script src="${pageContext.request.contextPath}/resources/js/angular.js"></script>   
   <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>   
   <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">   

  <style>
    .spanBackground
    {
      background-color: yellow;
    }

    .divFrame
    {
      border-width: 1px;
      border-style: solid;
    }

    .logTextArea
    {
      width: 400px;
      height: 200px;
    }
  </style>

   <!-- Custom Script Files -->
   <script src="${pageContext.request.contextPath}/resources/js/practice/controller/customdirectives-template.js"></script>  
</head>
<body style="background-color: WhiteSmoke">
<div class="container" ng-app='mainModule' ng-controller="compileController">
	<div class="page-header">
		<h1>Angular JS - Custom Directives Templates</h1>
	</div>

	<div class="row">
		<div class="col-md-6">
			<h3>Using Template</h3>
			<div rb-cust-dir>
				This Conetent would be replaced by directive html
				<div>
					This Content would be replaced too
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<h3>Using Template URL</h3>
			<div rb-cust-dir-2>
				This Conetent would be replaced by directive html
			</div>
		</div>
	</div>
	<hr/>
	<h2>Custom Directive - Replace</h2>
	<div class="row">
		<div class="col-md-6">
			<h3>All Content (inner html) would be replaced by custom directive</h3>
			<div rb-no-replace-cust-dir>
				This Contnent would be replaced by directive
				<div>
					This Content would be repalced too
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<h3>The element of the DOM node is replaced and the attributes are merged</h3>
			<span rb-no-replace-cust-dir-attr span-attribute common-attribute='span value' 
					style='font-weight: bold; color: blue' class='spanBackground' >
				This Content is Without custom replace directive
			</span><br/>
			<span rb-replace-cust-dir span-attribute common-attribute='span value' 
					style='font-weight: bold; color: blue' class='spanBackground' >
				This Content would be replaced by custom directive
			</span>
			<label>div.outerHTML</label>
			<textarea rows="10" class="logTextArea">
				{{replaceCustomDirHtml}}
			</textarea>
		</div>
	</div>
</div>
</body>
</html>
