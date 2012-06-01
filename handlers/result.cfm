<cfsetting showdebugoutput="false">
<cfset showForm = true>
<cfif structKeyExists(form, "submit")>
	<!---
	TODO: Validate the input.
	--->

	<cfset result = application.gistService.createGist(form.filename, application.content.text, form.public, form.description)>
	<cfset showForm = false>
	
</cfif>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Cache-control" content="no-cache">
	<link rel="stylesheet" href="app.css?<cfoutput>x=#createUUID()#</cfoutput>" type="text/css" />
</head>

<body>

	<cfif showForm>
		
		<cfoutput>
		<form method="post">
		<p>
		<label for="filename">Filename:</label> <input type="text" id="filename" name="filename" value="#application.content.filename#">
		</p>
		<p>
		<label for="public">Public:</label> <select name="public" id="public"><option value="yes" selected>Yes</option><option value="no">No</option></select>
		</p>
		<p>
		<label for="description">Description:</label> <input type="text" id="description" name="description">
		</p>
		<input type="submit" name="submit" value="Create Gist">
		</p>
		</form>
		</cfoutput>
		
	<cfelse>

		<cfif result.status is "OK">
			
			<cfoutput>
			<p>
			Your Gist was created and may be found here:
			<input value="#result.url#" style="width:100%">
			</p>
			
			<p>
			You can embed your Gist with this code: <input value="#htmlEditFormat(result.embed)#" style="width:100%" id="embed">
			</p>
			</cfoutput>

			<script>
			embed = document.getElementById('embed');
			embed.focus();
			embed.select();
			</script>
			
		<cfelse>
			
			<p>
			Unfortunately, your Gist was not created. If this extension was built better, it would provide information
			about exactly what went wrong and why. Unfortunately, this extension was built by Ray, so, deal withit.
			</p>
			
		</cfif>		
		
	</cfif>
	
</body>
</html>
