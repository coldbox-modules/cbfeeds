<!-----------------------------------------------------------------------
********************************************************************************
Copyright 2005-2007 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.coldbox.org | www.luismajano.com | www.ortussolutions.com
********************************************************************************

Author      :	Sana Ullah
Date        :	June 01 2008
Description :
	FeedReaderTest plugin test
----------------------------------------------------------------------->
<cfcomponent extends="coldbox.system.testing.BaseTestCase" appMapping="/root">

	<cffunction name="setUp" returntype="void" access="public" output="false">
		<cfscript>
		//Call the super setup method to setup the app.
		super.setup();
		variables.feedlink = 'http://newsrss.bbc.co.uk/rss/newsonline_world_edition/front_page/rss.xml';
		</cfscript>
	</cffunction>

	<cffunction name="testModel" access="public" returntype="void" output="false">
		<!--- Now test some events --->
		<cfscript>
			var oFeeds = getWireBox().getInstance( "FeedReader@feeds" );

			AssertTrue( isObject(oFeeds) );
		</cfscript>
	</cffunction>

	<cffunction name="testReadFeed" access="public" returntype="void" output="false">
		<!--- Now test some events --->
		<cfscript>
			var oFeeds = getWireBox().getInstance( "FeedReader@feeds" );
			var tStruct = oFeeds.readFeed(variables.feedlink);

			assertTrue(isStruct(tStruct), "Returned value is not valid struct");
		</cfscript>
	</cffunction>

	<cffunction name="testRetrieveFeed" access="public" returntype="void" output="false">
		<!--- Now test some events --->
		<cfscript>
			var oFeeds = getWireBox().getInstance( "FeedReader@feeds" );
			var tStruct = oFeeds.retrieveFeed(variables.feedlink);

			assertTrue(isStruct(tStruct), "Returned value is not valid struct");

			oFeeds.setCachedFeed(variables.feedlink, tStruct);

			assertTrue(isStruct(oFeeds.getCachedFeed(variables.feedlink)), "Returned value is not valid struct");

			oFeeds.removeCachedFeed(variables.feedlink);

		</cfscript>
	</cffunction>

</cfcomponent>