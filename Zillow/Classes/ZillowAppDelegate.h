//
//  ZillowAppDelegate.h
//  Zillow
//
//  Created by gaurav sinha on 10/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZillowAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	IBOutlet UINavigationController *navigation;
	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

