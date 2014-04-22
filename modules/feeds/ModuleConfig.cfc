component {

	// Module Properties
	this.title 				= "feeds";
	this.author 			= "Luis Majano";
	this.webURL 			= "http://www.ortussolutions.com";
	this.description 		= "A module that can consume and generate fancy RSS/ATOM feeds";
	this.version			= "1.0.0";
	// If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
	this.viewParentLookup 	= true;
	// If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
	this.layoutParentLookup = true;
	// Module Entry Point
	this.entryPoint			= "feeds";

	function configure(){

		// module settings - stored in modules.name.settings
		settings = {
			// leverage the cache for storage of feed reading, leverages the 'default' cache
			useCache  = true,
			// where to store the cache, options are: [ram, file]
			cacheType = "ram",
			// if using file cache, the location to store the cached files
			cacheLocation = "",
			// the cache timeout for the items in seconds
			cacheTimeout = 30,
			// the http timeout for the cfhttp operations in seconds
			httpTimeout = 30
		};


		// Binder Mappings
		binder.map( "FeedReader@feeds" )
			.to( "#moduleMapping#.model.FeedReader" );

		binder.map( "FeedGenerator@feeds" )
			.to( "#moduleMapping#.model.FeedGenerator" );

	}

	/**
	* Fired when the module is registered and activated.
	*/
	function onLoad(){

	}

	/**
	* Fired when the module is unregistered and unloaded
	*/
	function onUnload(){

	}

}