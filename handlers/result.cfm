<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="app.css" type="text/css" />
</head>

<body>

	<cfif application.result.status is "OK">
		
		<p>
		Your Gist was created and may be found here:
		</p>

		<p>
		<cfoutput>#application.result.url#</cfoutput>
		</p>
		
	<cfelse>
		
		<p>
		Unfortunately, your Gist was not created. If this extension was built better, it would provide information
		about exactly what went wrong and why. Unfortunately, this extension was built by Ray, so, deal withit.
		</p>
		
	</cfif>
	
</body>
</html>