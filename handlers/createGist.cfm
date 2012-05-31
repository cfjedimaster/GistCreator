<cfsetting showdebugoutput="false">
<cfset helper = new cfcs.builderHelper(ideeventinfo)>
<cfset runType = helper.getRunType()>

<!--- Step One: Do we have gist info? --->
<cfif not fileExists(expandPath("./settings.json"))>

	<cfheader name="Content-Type" value="text/xml">
	<cfoutput>
	<response showresponse="true">
	<ide url="#helper.getRootURL()#getinfo.cfm">
	<dialog width="455" height="470" title="Gist Setup" />
	</ide>
	</response>
	</cfoutput>	
	
<cfelse>
	
	<!--- load and cache the auth info --->
	<!--- todo: validate it still works --->
	<cfif not structKeyExists(application, "githubdata")>
		<cfset application.githubdata = deserializeJSON(fileRead(expandPath("./settings.json")))>
		<!--- set the u/p values in our service - note that this is an application specific cfc, but that's normal in extensions --->
		<cfset application.gistService.username = application.githubdata.username>
		<cfset application.gistService.password = application.githubdata.password>
	</cfif>
	
	<!---
	So, if we were in the editor, get the stuff they selected. If they selected nothing, get the entire file.
	If they were in the project view, get the file.
	--->
	<cfif runtype is "editor">
		
		<cfset selection = helper.getSelectedText()>
		<cfset filename = listLast(selection.path, "\/")>
		<cfset text = selection.text>
		
	<cfelseif runtype is "projectview">
		
		<cfset filepath = helper.getSelectedResource().path>
		<cfset text = fileRead(filepath)>
		<cfset filename = listlast(filepath, "\/")>
		
	</cfif>

	<!--- cache this for our next UI view --->
	<cfset application.content = {filename=filename, text=text}>

	<cfheader name="Content-Type" value="text/xml">
	<cfoutput>
	<response showresponse="true">
	<ide url="#helper.getRootURL()#result.cfm">
	<dialog width="455" height="350" title="Gist Details" />
	</ide>
	</response>
	</cfoutput>	
	
</cfif>

