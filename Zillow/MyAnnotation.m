//
//  MyAnnotation.m
//  swiftGO
//
//  Created by Dharmendra Singh Kushwaha on 23/01/10.
//  Copyright ChromeInfotech 2010. All rights reserved.
//  mail:gauravs@chromeinfotech.com
//

#import "MyAnnotation.h"

@implementation MyAnnotation

@synthesize coordinate,ann_tag,title,subtitle,userData,annotation_view,annotations;

-init
{
	return self;
}
-initWithCoordinate:(CLLocationCoordinate2D)inCoord
{
	coordinate = inCoord;
	return self;
}
-(void)dealloc 
{
	[title release];
	[subtitle release];
	[userData release];
	
	[super dealloc];
}

@end
