//
//  XmlParser.h
//  RetailStore
//
//  Created by gaurav sinha on 11/01/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface XmlParser : NSObject<NSXMLParserDelegate> {
	NSMutableString  *currentElementValue; 
}
+(NSMutableArray*)sharedparseeee:(NSString *)xml:(NSMutableArray*)arrayelement;

@end
