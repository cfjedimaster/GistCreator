component accessors="true" {

	property name="username";
	property name="password";
	
	variables.ROOT = "https://api.github.com";
	
	public any function createGist(required string filename, required string contents) {
		var http = new http();
		http.setURL(variables.ROOT & "/gists");
		http.setUsername(this.username);
		http.setPassword(this.password);
		http.setMethod("post");

		var input = {"public"="true", "files"=
			{
				"#filename#"={"content"=contents}
			}
		};

		http.addParam(type="body", value="#serializeJSON(input)#");
		var httpresult=http.send().getPrefix();
		
		if(httpresult.responseheader.status_code == 201) {
			var gistdata = deserializeJSON(httpresult.filecontent);
			//Create the embed url on the fly. The Gist API doesn't specifically support this.
			//Note - this embed URL is for all the "files" in the Gist even though we will have only one.
			var embed = '<script src="https://gist.github.com/#gistdata.id#.js"></script>';
			return {status="ok", url= gistdata.html_url, embed=embed};
		} else {
			//todo: return info on the failure
			return {status:"failure"};	
		}

	}
	
	public boolean function validate(required string username, required string password) {
		var http = new http();
		http.setURL(variables.ROOT);
		http.setUsername(username);
		http.setPassword(password);
		return (http.send().getPrefix().responseheader.status_code == 204);
	}
	
}