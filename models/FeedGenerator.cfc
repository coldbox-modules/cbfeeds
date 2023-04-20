/**
 * Description :
 * 	This is a feed generator. It is able to output RSS 2.0 feeds
 * 	You need to set the following settings in your application (coldbox.xml.cfm)
 *
 * METHODS:
 *
 * 	- CreateFeed( feedStruct:struct, [ColumnMap:struct] [OutputFile:string] [OutputXML:boolean] ): XML or Boolean
 *
 * 	  This method will create the feed and return it to the caller in XML format.
 * 	  * feedStruct : The properties and items structure.
 * 	  * ColumnMap : You create a structure that will map the RSS elements to your query.
 * 	  * OutputFile : The file path of where to write the feed to.
 * 	  * OutputXML : Boolean (default:false) display generated XML on screen.
 *
 * 	- getDefaultPropertyMap(): Struct
 *
 * 	  This method creates a structure listing of all the default property maps for dumping.
 *
 * 	- parseColumnMap( columnMap:struct ): Struct
 *
 * 	  This method parses and validates a supplied column map, returning the results for dumping.
 * 	  * columnMap : Column map structure (see below).
 *
 * A feed generator plug-in. Currently this plug-in only generates RSS 2.0 feeds.
 */
component hint="A feed generator plug-in. Currently this plug-in only generates RSS 2.0 feeds." singleton {

	// ------------------------------------- CONSTRUCTOR ------------------------------------------------

	/**
	 * Plug-in constructor.
	 */
	public FeedGenerator function init(){
		variables.extrasRSS2   = createObject( "component", "util.RSS2Generator" ).init();
		variables.extrasShared = createObject( "component", "util.SharedGenerator" ).init();
		return this;
	}

	/**
	 * Create a web feed, by default it returns the xml string.
	 */
	public any function createFeed(
		required struct feedStruct,
		struct columnMap = "#structNew()#",
		string outputFile,
		boolean outputXML
	){
		var fs         = arguments.feedStruct;
		var cm         = arguments.ColumnMap;
		var xmlContent = "";
		var xmlCleaned = "";

		/* Append generator infomation to feed */
		fs[ "generator" ] = "FeedGenerator";

		/* Force creation of RSS2 feeds (as it is the only format currently supported) */
		fs[ "feedformat" ] = "rss2";

		/* Verify feed structure and data then generate XML source */
		if ( fs.feedformat is "rss2" ) {
			/* verify our structure */
			extrasRSS2.verifyFeed( fs, cm );
			/* generate XML source */
			xmlContent = extrasRSS2.generateChannel( fs, cm );
		} else if ( fs.feedformat is "atom" ) {
		} else if ( fs.feedformat is "rdf" ) {
		}

		/* Apply XSL formating to messy XML code */

		if ( server.keyExists( "lucee" ) ) {
			xmlCleaned = xmlTransform( xmlContent, extrasShared.XSLFormat() );
		} else {
			xmlCleaned = xmlContent;
		}

		//  Check for and generate file output
		if ( structKeyExists( arguments, "OutputFile" ) ) {
			cffile(
				charset = "utf-8",
				output  = xmlCleaned,
				file    = arguments.OutputFile,
				action  = "write"
			);
		}
		//  Check for and generate on-screen output
		if ( structKeyExists( arguments, "OutputXML" ) ) {
			cfcontent( variable = toBinary( toBase64( xmlCleaned ) ), type = "text/xml" );
		}
		//  Always return xml
		return xmlCleaned;
	}

	/**
	 * Parse and validate a column mapper
	 */
	public struct function parseColumnMap( required struct columnMap ){
		return extrasShared.getDefaultPropertyMap( arguments.columnMap );
	}

	/**
	 * Get the default property map
	 */
	public struct function getDefaultPropertyMap(){
		return extrasRSS2.generateDefaultPropertyMap();
	}

}
