component {

	this.name = "gistextensionv2";
	
	public boolean function onApplicationStart() {
		application.gistService = new cfcs.gistservice(); 
		return true;
	}

	public boolean function onRequestStart(string req) {
		setting showdebugoutput="false";
		return true;
	}

}