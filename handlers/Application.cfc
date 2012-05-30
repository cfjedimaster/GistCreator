component {

	this.name = "gistextensionv3";
	
	public boolean function onApplicationStart() {
		application.gistService = new cfcs.gistservice(); 
		return true;
	}

	public boolean function onRequestStart(string req) {
		//Keeping this around for quick testing...
		//structDelete(application,"githubdata");onApplicationStart();
		return true;
	}

}