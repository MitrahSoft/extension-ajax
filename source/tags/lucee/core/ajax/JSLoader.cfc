component output="false" {
	
	<!---get--->
	public any function get(string lib)access="remote" output="false" returntype="string" returnformat="plain" {
		<!--- restrict to files from JS directory !--->
		if( arguments.lib CT ".."){
			cfheader (statuscode="400");
			return "// 400 - Bad Request";
		}
		var relPath = "js/#arguments.lib#.js";
		if (fileExists( expandPath( relPath ))) {
			cfcontent(type="text/javascript");
			cfsavecontent(variable="local.result");
			include template="#relPath#";
			return result;
		}else{
			cfheader(statuscode="404");
			return "// 404 - Not Found";
		}
	}
}

	
