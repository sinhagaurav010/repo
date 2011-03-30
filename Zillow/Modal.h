//
//  Modal.h
//  Zillow
//
//  Created by gaurav sinha on 10/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Global.h"

@interface Modal : NSObject 
{
	NSMutableData *receivedData;
	BOOL _isMapView;

}
@property(nonatomic,retain)NSMutableData *receivedData;
-(void)returnArrayWithString:(NSString*)UrlToParse:(BOOL)value;

@end
