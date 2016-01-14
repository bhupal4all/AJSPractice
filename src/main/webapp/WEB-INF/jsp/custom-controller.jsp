<!DOCTYPE html>
<html lang="en">
<head>
   <title>Angular Module JS</title>
   <script src="${pageContext.request.contextPath}/resources/js/angular.js"></script>   
   <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>   
   <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">   

   <!-- Custom Script Files -->
   <script src="${pageContext.request.contextPath}/resources/js/practice/controller/customdirectives-controller.js"></script>  
</head>
<body style="background-color: WhiteSmoke">
<div class="container" ng-app='mainModule' ng-controller="mainController">
	<div class="page-header">
		<h1>Angular JS - Custom Directives Controllers</h1>
	</div>

	<div class="row">
		<h3>Controllers</h3>
		<div class="col-md-6">
			<div basket>
				<div gift-pack>
					<button fruit-checker apple>Apple in Gift Pack</button> 
				</div>
				<button fruit-checker apple peanuts>Apple + Peanut</button>
			</div>
			<br/><p><label>What we have ? </label> {{whatWeHave}}</p>
		</div>
	</div>
</div>
</body>
</html>
