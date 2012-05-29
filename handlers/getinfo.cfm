<cfset showForm = true>
<cfif structKeyExists(form, "username") and structKeyExists(form, "password")>
	<!--- First, validate --->
	<cfif application.gistService.validate(form.username, form.password)>
		<cfset packet = {username:form.username, password:form.password}>
		<cfset fileWrite(expandPath("./settings.json"), serializeJSON(packet))>
		<cfset showForm = false>
	<cfelse>
		<cfset errorFlag = true>
	</cfif>
</cfif>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="app.css" type="text/css" />
</head>

<body>

	<cfif showForm>
		
		<cfif not structKeyExists(variables, "errorFlag")>
			<p>
			In order to use this extension, you must provide your Github username and password. This information
			will be stored in a plain text file in the extension directory. This is a one-time setup process.
			</p>
		<cfelse>
			<p>
			Sorry, but the information you provided did not validate.
			</p>
		</cfif>
				
		<form method="post">
		<p>
		<label for="username">Username:</label> <input type="text" id="username" name="username"><br/>
		<label for="password">Password:</label> <input type="password" id="password" name="password"><br/>
		<input type="submit" value="Save Information">
		</p>
		</form>

	<cfelse>
		
		<p>
		Congratulations! Your Github information validated and you are ready to use the extension. Please
		try your action again.
		</p>
		
	</cfif>
	
</body>
</html>
