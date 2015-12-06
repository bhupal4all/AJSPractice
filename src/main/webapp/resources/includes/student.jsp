<div ng-controller="includeCtrlr">
	<table>
		<tr><td>First Name</td><td>{{ student.firstName }}</td></tr>
		<tr><td>Last Name</td><td>{{ student.lastName }}</td></tr>
		<tr><td>Fee</td><td>{{ student.fee | currency }}</td></tr>
	</table>
</div>