//
//  XmlParser.m
//  RetailStore
//
//  Created by gaurav sinha on 11/01/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "XmlParser.h"
NSMutableArray  *array_ele;
NSMutableArray *array_parser ;
NSMutableDictionary *dict_parser;
@implementation XmlParser
- (XmlParser *) initXMLParser {
	
	//arrayForKey					=	[NSMutableArray new];
	[super init];
	//appDelegate				= (ComiciPadAppDelegate *)[[UIApplication sharedApplication] delegate];
	return self;
}

////////////////////////////////////////////
//
+(void)parsingofComicgalleryXmlfile:(NSString*)thexml
{	
	NSData  *galleryXmlfileData			= [thexml dataUsingEncoding:NSUTF8StringEncoding];
	NSXMLParser *xmlParser				= [[NSXMLParser alloc] initWithData:galleryXmlfileData];
	XmlParser *parser		            =	         [[XmlParser alloc] initXMLParser];// Used for ehat purpose
	[xmlParser setDelegate:parser];
	//	Start parsing the XML file.
	BOOL success						= [xmlParser parse];
	if(success)
		NSLog(@"No Errors");
	else
		NSLog(@"Error Error Error!!!");
	if (xmlParser) 
	{
		[xmlParser release];
		xmlParser = nil;
	}
}


- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName 
	attributes:(NSDictionary *)attributeDict {
	
	if([elementName isEqualToString:@"soap:Envelope"])
	{
	}
	
	else if([elementName isEqualToString:@"soap:Body"]) 
	{
		//aOgs				=  [ogs new];
	}	
	
	
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string 

{ 
	if(!currentElementValue) 
	{
		
		currentElementValue	= [[NSMutableString alloc] initWithString:string];
	}
	
	
	else{
		[currentElementValue appendString:string];
	}
	
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
	
	/*if([elementName isEqualToString:@"soap:Envelope"])
	{
		return;
	}
	if([elementName isEqualToString:@"soap:Body"]) 
	{
	}
	if([elementName isEqualToString:@"GetRecipeResponse"])
	{		
	}
	if([elementName isEqualToString:@"GetRecipeResult"])
	{
	}
	
	if([elementName isEqualToString:@"diffgr:diffgram"]){
		//	NSLog(@"----------------------------%@",currentElementValue);
		
		//[dict_list setObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:elementName];
		
	}
	if([elementName isEqualToString:@"NewDataSet"]){
		//NSLog(@"----------------------------%@",currentElementValue);
		
		//	[dict_list setObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:elementName];
    }
	if([elementName isEqualToString:@"Table"])
	{
		//NSLog(@"----------------------------%@",currentElementValue);
		NSLog(@"dict_list_list----%@",dict_parser);
		[array_parser addObject:dict_parser];
		dict_parser = [NSMutableDictionary new];
		//[d ict_list setObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:elementName];
	}
	if([elementName isEqualToString:@"RecipeName"])
	{
		NSLog(@"%@----------------------------%@",elementName,currentElementValue);
		
		[dict_parser setObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:elementName];
	}
	if([elementName isEqualToString:@"RecipeId"])
	{
		NSLog(@"%@----------------------------%@",elementName,currentElementValue);		
		[dict_parser setObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:elementName];
	}
	
		
	else 
	{}
	
	[currentElementValue release];
	currentElementValue				= nil;
	*/
	
	

	if([elementName isEqualToString:[array_ele  objectAtIndex:0]])
	{
		return;
	}
	if([elementName isEqualToString:[array_ele  objectAtIndex:6]])
	{
		[dict_parser setObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:elementName];
	}
	if([elementName isEqualToString:[array_ele  objectAtIndex:1]]) 
	{
		
		[array_parser addObject:dict_parser];
		dict_parser = [NSMutableDictionary new];	
	}
	if([elementName isEqualToString:[array_ele  objectAtIndex:2]])
	{		
		[dict_parser setObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:elementName];
	}
	if([elementName isEqualToString:[array_ele  objectAtIndex:3]])
	{
		[dict_parser setObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:elementName];
	}
		
   if([elementName isEqualToString:[array_ele  objectAtIndex:4]])
   {
	   [dict_parser setObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:elementName];
					
   }
   if([elementName isEqualToString:[array_ele  objectAtIndex:5]])
   {
		[dict_parser setObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:elementName];
   }
   for(int i =7;i<[array_ele  count];i++)
   {
	if([elementName isEqualToString:[array_ele  objectAtIndex:i]])
	{
			[dict_parser setObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:elementName];
	}
   }
	
		
		[currentElementValue release];
		currentElementValue				= nil;
		
		
	
}

+(NSMutableArray*)sharedparseeee:(NSString *)xml:(NSMutableArray*)arrayelement
{
	array_ele    =  [NSMutableArray  new];
	
	for(int i=0;i<[arrayelement  count];i++)
	{
		[array_ele  addObject:[arrayelement  objectAtIndex:i]];
	}
	
	array_parser =  [NSMutableArray  new];
	dict_parser  =  [NSMutableDictionary  new];
	[XmlParser parsingofComicgalleryXmlfile:xml];
	return  array_parser;
}
@end
