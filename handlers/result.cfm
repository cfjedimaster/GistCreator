<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="app.css" type="text/css" />
</head>

<body>

	<cfif application.result.status is "OK">
		
		<cfoutput>
		<p>
		Your Gist was created and may be found here: #application.result.url#
		</p>
		
		<p>
		You can embed your Gist with this code: <input value="#htmlEditFormat(application.result.embed)#" style="width:100%">
		</p>
		</cfoutput>
	<cfelse>
		
		<p>
		Unfortunately, your Gist was not created. If this extension was built better, it would provide information
		about exactly what went wrong and why. Unfortunately, this extension was built by Ray, so, deal withit.
		</p>
		
	</cfif>
	
</body>
</html>