//
//  DataViewController.h
//  WaitTimerPage
//
//  Created by gaurav sinha on 27/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DataViewController : NSObject 
{
	NSString *string_Name;
	NSString *string_waiting;
	NSString *string_call;
	NSString *string_notes;
	NSString *string_mobile;

}
@property (nonatomic, retain) NSString *string_Name;
@property (nonatomic, retain) NSString *string_waiting;
@property (nonatomic, retain) NSString *string_call;
@property (nonatomic, retain) NSString *string_notes;
@property (nonatomic, retain) NSString *string_mobile;

@end
