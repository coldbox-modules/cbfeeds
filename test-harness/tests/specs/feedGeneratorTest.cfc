component extends="coldbox.system.testing.BaseTestCase" appMapping="/root" {

	public void function setUp() output=false{
		// Call the super setup method to setup the app.
		super.setup();
		variables.q1 = queryNew( "title,description,author,link" );
		for ( i = 1; i <= 10; i++ ) {
			queryAddRow( q1, 1 );
			querySetCell( q1, "title", "Title#i#" );
			querySetCell(
				q1,
				"description",
				"description-q1-#chr( 65 + i )#"
			);
			querySetCell(
				q1,
				"author",
				"lmajano@ortussolutions.com (Luis Majano)"
			);
			querySetCell( q1, "link", "http://www.coldbox.org" );
		}

		variables.feedStruct[ "title" ]          = "feed title";
		variables.feedStruct[ "link" ]           = "http://www.coldbox.org";
		variables.feedStruct[ "description" ]    = "feed generator unit test";
		variables.feedStruct[ "generator" ]      = "ColdBox";
		variables.feedStruct[ "managingEditor" ] = "lmajano@ortussolutions.com (Luis Majano)";
		variables.feedStruct[ "webmaster" ]      = "lmajano@ortussolutions.com (Luis Majano)";

		variables.feedStruct[ "items" ] = variables.q1;
	}

	public void function testPlugin() output=false{
		//  Now test some events

		var plugin = getWireBox().getInstance( "feedGenerator@cbfeeds" );

		assertTrue( isObject( plugin ) );
	}

	public void function testCreateFeed() output=false{
		//  Now test some events

		var plugin = getWireBox().getInstance( "feedGenerator@cbfeeds" );
		var path   = expandPath( "/tests/tmp/" ) & "testrss.xml";
		var xmlDoc = plugin.createFeed( feedStruct = variables.feedStruct, OutputFile = path );

		assertTrue( isXML( xmlDoc ), "Returned value is not valid xml" );
	}

}
