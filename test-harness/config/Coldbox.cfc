component{
	// Configure ColdBox Application
	function configure(){
		// coldbox directives
		coldbox = {
			// Application Setup
			appName                 : "Module Tester",
			// Development Settings
			reinitPassword          : "",
			handlersIndexAutoReload : true,
			modulesExternalLocation : [],
			// Implicit Events
			defaultEvent            : "",
			requestStartHandler     : "",
			requestEndHandler       : "",
			applicationStartHandler : "",
			applicationEndHandler   : "",
			sessionStartHandler     : "",
			sessionEndHandler       : "",
			missingTemplateHandler  : "",
			// Error/Exception Handling
			exceptionHandler        : "",
			onInvalidEvent          : "",
			customErrorTemplate     : "/coldbox/system/exceptions/Whoops.cfm",
			// Application Aspects
			handlerCaching          : false,
			eventCaching            : false,
			autoMapModels           : true
		};

		settings = {
			APURL="http://hosted.ap.org/lineups/WORLDHEADS-rss_2.0.xml",
			BBCIntURL="http://newsrss.bbc.co.uk/rss/newsonline_uk_edition/world/rss.xml",
			FlickrURL="http://api.flickr.com/services/feeds/photos_public.gne",
			FlickrTags="all",
			ReutersURL="http://feeds.reuters.com/reuters/topNews",
			YouTubeURL="http://gdata.youtube.com/feeds/api/videos",
			YouTubeDefaultStartIndex="1",
			YouTubeDefaultMaxResults="5"
		};

		// environment settings, create a detectEnvironment() method to detect it yourself.
		// create a function with the name of the environment so it can be executed if that environment is detected
		// the value of the environment is a list of regex patterns to match the cgi.http_host.
		environments = { development : "localhost,127\.0\.0\.1" };

		// Module Directives
		modules = {
			// An array of modules names to load, empty means all of them
			include : [],
			// An array of modules names to NOT load, empty means none
			exclude : []
		};

		layouts = [
			{ name = "youtube",
		 	  file = "Layout.YouTube.cfm",
			  folders = "youtube"
			},
			{ name = "flickr",
		 	  file = "Layout.Flickr.cfm",
			  folders = "flickr"
			}
		];

		// Register interceptors as an array, we need order
		interceptors = [];

		// LogBox DSL
		logBox = {
			// Define Appenders
			appenders : {
				files : {
					class      : "coldbox.system.logging.appenders.RollingFileAppender",
					properties : { filename : "tester", filePath : "/#appMapping#/logs" }
				},
				console : { class : "coldbox.system.logging.appenders.ConsoleAppender" }
			},
			// Root Logger
			root  : { levelmax : "DEBUG", appenders : "*" },
			// Implicit Level Categories
			info  : [ "coldbox.system" ],
			debug : [ "cbsecurity" ]
		};

		// Module Settings
		moduleSettings = {
		};
	}

	/**
	 * Load the Module you are testing
	 */
	function afterConfigurationLoad( event, interceptData, rc, prc ){
		controller
			.getModuleService()
			.registerAndActivateModule( moduleName = request.MODULE_NAME, invocationPath = "moduleroot" );
	}
}
