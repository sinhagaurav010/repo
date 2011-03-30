//
//  Modal.m
//  Zillow
//
//  Created by gaurav sinha on 10/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Modal.h"
#import "SearchViewController.h"

@implementation Modal

@synthesize receivedData;

-(void)returnArrayWithString:(NSString*)UrlToParse:(BOOL)value;
{
	//NSString* updateURL = [NSString stringWithFormat:UrlToParse];
	
    //responseData = [[NSMutableData alloc] init];
	//NSLog(@"%@",UrlToParse);
//    NSURLRequest* updateRequest = [NSURLRequest requestWithURL: [NSURL URLWithString:UrlToParse]];
//    NSURLConnection* connection = [[NSURLConnection alloc] initWithRequest:updateRequest delegate:self];
//	[connection start];
	
	_isMapView = value;
	self.receivedData = [[NSMutableData alloc] init];
	
	NSURLRequest *request = [[NSURLRequest alloc]
							 initWithURL: [NSURL URLWithString:UrlToParse]
							 cachePolicy: NSURLRequestReloadIgnoringLocalCacheData
							 timeoutInterval:10
							 ];
	
	NSURLConnection *connection = [[NSURLConnection alloc]
								   initWithRequest:request
								   delegate:self
								   startImmediately:YES];
  	if(!connection) {
		//stringXml = @"Error";
		//[[NSNotificationCenter defaultCenter] postNotificationName:ERROR object:nil];
  		NSLog(@"connection failed :(");
	} else {
		NSLog(@"connection succeeded  :)");
		
	}
	
  	[connection release];
	
}



#pragma mark NSURLConnection delegate methods
 - (NSURLRequest *)connection:(NSURLConnection *)connection
  			 willSendRequest:(NSURLRequest *)request
  			redirectResponse:(NSURLResponse *)redirectResponse {
	  	NSLog(@"Connection received data, retain count");
	         return request;
	  }
  
  
  - (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	  	NSLog(@"Received response: %@", response);
	  	
	       // [receivedData setLength:0];
	  }
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	NSLog(@"%@",[[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding]);
	[receivedData appendData:data];

	  	
        // [receivedData appendData:data];
	  	//NSLog(@"Received data is now %d bytes", [receivedData length]); 	  
}
  
  - (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	  stringXml = @"Error";
	  [[NSNotificationCenter defaultCenter] postNotificationName:ERROR object:nil];
	  	NSLog(@"Error receiving response: %@", error);
	  }
  
  - (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	NSLog(@"connectionDidFinishLoading");
	
	NSLog(@"Received %d bytes of data", [receivedData length]); 
	
	NSString *string = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
	
	stringXml  = string;
	[string release];
	if(_isMapView == 1)
	{
	//SearchViewController *searchConroller = [[SearchViewController alloc] init];
//	[searchConroller setString_xml:string];
	//searchConroller.string_xml = string;
	
	[[NSNotificationCenter defaultCenter] postNotificationName:@"MyNotification" object:nil];
	}
	else
	{
		[[NSNotificationCenter defaultCenter] postNotificationName:ZIPIDNOT object:nil];

	}

// Once this method is invoked, "responseData" contains the complete result
//	NSLog(@"Succeeded! Received %d bytes of data", [receivedData length]); 
//	  	
//	  	NSString *dataStr=[[NSString alloc] initWithData:receivedData encoding:NSASCIIStringEncoding];
//	  	NSLog(@"Succeeded! Received %@ bytes of data", dataStr); 
//	  	
//	  	if ([delegate respondsToSelector:@selector(didFinishDownload:)]) {
//		  		NSLog(@"Calling the delegate"); 
//		  		//NSString* dataAsString = [[[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding] autorelease];
//		  		[delegate performSelector:@selector(didFinishDownload:) withObject: dataStr];
//		  	}
//	  	
//	  	[dataStr release];
	  }



////////////////////////////////////////////
//- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
//  //  [responseData setLength:0];
//	//filesize = [[NSNumber numberWithLong: [response expectedContentLength] ] retain];
//}
//
//-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data 
//{	
//	NSLog(@"%@",data);
//	NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//	SearchViewController *searchConroller = [[SearchViewController alloc] init];
//	searchConroller.string_xml = string;
//	[[NSNotificationCenter defaultCenter] postNotificationName:@"MyNotification" object:nil];
//
//    //[responseData appendData:data];
//}
//-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
//{
//    NSLog(@"ERROR with theConenction");
//    [connection release];
//  //  [webData release];
//}

//- (void)connectionDidFinishLoading:(NSURLConnection *)connection
//{
//   //[filesize release];
//	NSLog(@"connectionDidFinishLoading");
//    [connection release];
//	
//}


@end
