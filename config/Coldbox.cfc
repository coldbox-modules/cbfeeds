<cfcomponent output="false" hint="My App Configuration">
<cfscript>
	// Configure ColdBox Application
	function configure(){

		// coldbox directives
		coldbox = {
			//Application Setup
			appName 				= "Feeds Shell",

			//Development Settings
			reinitPassword			= "",
			handlersIndexAutoReload = true,

			//Implicit Events
			defaultEvent			= "generator.index",
			requestStartHandler		= "",
			requestEndHandler		= "",
			applicationStartHandler = "main.onAppInit",
			applicationEndHandler	= "",
			sessionStartHandler 	= "",
			sessionEndHandler		= "",
			missingTemplateHandler	= "",

			//Extension Points
			UDFLibraryFile 				= "",
			coldboxExtensionsLocation 	= "",
			modulesExternalLocation		= [],
			pluginsExternalLocation 	= "",
			viewsExternalLocation		= "",
			layoutsExternalLocation 	= "",
			handlersExternalLocation  	= "",
			requestContextDecorator 	= "",

			//Error/Exception Handling
			exceptionHandler		= "",
			onInvalidEvent			= "",
			customErrorTemplate		= "",

			//Application Aspects
			handlerCaching 			= false,
			eventCaching			= false,
			proxyReturnCollection 	= false
		};

		// custom settings
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

		// Activate WireBox
		wirebox = { enabled = true, singletonReload=true };

		// Module Directives
		modules = {
			//Turn to false in production, on for dev
			autoReload = false
		};

		//Register Layouts
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

		//LogBox DSL
		logBox = {
			// Define Appenders
			appenders = {
				files={class="coldbox.system.logging.appenders.RollingFileAppender",
					properties = {
						filename = "javaloader", filePath="/#appMapping#/logs"
					}
				}
			},
			// Root Logger
			root = { levelmax="DEBUG", appenders="*" },
			// Implicit Level Categories
			info = [ "coldbox.system" ]
		};

		//Register interceptors as an array, we need order
		interceptors = [
			//SES
			{class="coldbox.system.interceptors.SES",
			 properties={}
			}
		];

	}
</cfscript>
</cfcomponent>