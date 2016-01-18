<p>To access the scope of calee, we need to use $parent.  this would be useful when we have multiple controllers. 
<ul>
	<li><abbr title='Getter Method'>G</abbr></li>
	<li><abbr title="Setter Method">S</abbr></li>
	<li><a href='https://docs.angularjs.org/api/ng/service/$location'>Location Documentation</a></li>
</ul> 
</p>
<strong>Message: </strong> {{$parent.message}} <br/>
<br/>
<table class="table">
	<tr>
		<th>Property</th>
		<th>Value</th>
	</tr>
	<tr>
		<td>Absolute URL (G)</td>
		<td>{{$parent.location.absUrl()}}</td>
	</tr>
	<tr>
		<td>Host (G)</td>
		<td>{{$parent.location.host()}}</td>
	</tr>
	<tr>
		<td>Protocol (G)</td>
		<td>{{$parent.location.protocol()}}</td>
	</tr>
	<tr>
		<td>Port (G)</td>
		<td>{{$parent.location.port()}}</td>
	</tr>
	<tr>
		<td>Path (G/S)</td>
		<td>{{$parent.location.path()}}</td>
	</tr>
	<tr>
		<td>URL (G/S)</td>
		<td>{{$parent.location.url()}}</td>
	</tr>
	<tr>
		<td>Search (G/S)</td>
		<td>{{$parent.location.search()}}</td>
	</tr>
	<tr>
		<td>Hash (G/S)</td>
		<td>{{$parent.location.hash()}}</td>
	</tr>
	<tr>
		<td>State (G/S)</td>
		<td>{{$parent.location.state()}}</td>
	</tr>
	<tr>
		<td>Location Change Start</td>
		<td>{{locationChangeStartCounter}}</td>
	</tr>
	<tr>
		<td>Location Change Success</td>
		<td>{{locationChangeSuccessCounter}}</td>
	</tr>
</table>

<button ng-click="setURL('newUrl')">Set URL (/newurl)</button>
<button ng-click="setPath('newPath')">Set Path (/newpath)</button>
<button ng-click="setHash('newHash')">Set Hasg (/newhash)</button>

