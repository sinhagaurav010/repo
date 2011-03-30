//
//  TwitterRequest.h
//  Chirpie
//
//  Created by Brandon Trebitowski on 6/15/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TwitterRequest : NSObject {
	NSString		*username;
	NSString		*password;
	NSMutableData   *receivedData;
	NSURLRequest	*theRequest;
	NSURLConnection *theConnection;
	id				 delegate;
	SEL				 callback;
	SEL				 errorCallback;
}

@property(nonatomic, retain) NSString	   *username;
@property(nonatomic, retain) NSString	   *password;
@property(nonatomic, retain) NSMutableData *receivedData;
@property(nonatomic, retain) id			    delegate;
@property(nonatomic) SEL					callback;
@property(nonatomic) SEL					errorCallback;

-(void)friends_timeline:(id)requestDelegate requestSelector:(SEL)requestSelector forUrl:(NSURL*)url;
-(void)request:(NSURL *) url;

@end
